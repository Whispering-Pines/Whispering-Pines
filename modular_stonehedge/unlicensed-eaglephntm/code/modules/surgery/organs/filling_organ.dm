//By Vide Noir https://github.com/EaglePhntm.
//container organ that can refill self through nutrients etc.
/obj/item/organ/filling_organ
	name = "self filling organ"

	//faster healing cause those will be rippin alot
	healing_factor = STANDARD_ORGAN_HEALING*3
	decay_factor = STANDARD_ORGAN_DECAY

	//self generating liquid stuff, dont use with absorbing stuff
	var/storage_per_size = 100 //added per organ size
	var/datum/reagent/reagent_to_make = /datum/reagent/consumable/nutriment //naturally generated reagent
	var/refilling = FALSE //slowly refills when not hungry
	var/reagent_generate_rate = 3 //with refilling
	var/hungerhelp = FALSE //if refilling, absorbs reagent_to_make as nutrients if hungry. Conversion is to nutrients direct even if you brew poison in there.
	var/uses_nutrient = TRUE //incase someone for some reason wanna make an OP paradox i guess.
	var/organ_sizeable = FALSE //if organ can be resized in prefs etc, SET THIS RIGHT, IT'S IMPORTANT.
	var/max_reagents = 30 //use if organ not sizeable, it auto calculates with sizeable organs and uses it as a base.
	var/startsfilled = FALSE

	//absorbing etc content liquid stuff, non self generated.
	var/absorbing = FALSE //absorbs liquids within slowly. Wont absorb reagent_to_make type, refilling and hungerhelp are irrelevant to this.
	var/absorbrate = 1 //refilling and hungerhelp are irrelevant to this, each life tick. NO LESS THAN 1 DIGESTS RIGHT.
	var/absorbmult = 1 //free gains
	var/driprate = 0.1
	var/spiller = FALSE //toggles if it will spill its contents when not plugged.
	var/blocker = ITEM_SLOT_SHIRT //pick an item slot
	var/processspeed = 5 SECONDS//will apply the said seconds cooldown each time before any spill or absorb happens.
	var/bloatable = FALSE //will it give bloat debuffs when filled, not good to use with refilling organs.

	//pregnancy vars
	var/fertility = FALSE //can it be impregnated
	var/pregnant = FALSE // is it pregnant

	//misc
	var/list/altnames = list("bugged place", "bugged organ") //used in thought messages.
	var/last_size_alert = 0

	COOLDOWN_DECLARE(liquidcd)

/obj/item/organ/filling_organ/Insert(mob/living/carbon/M, special, drop_if_replaced) //update size cap n shit on insert
	. = ..()
	if(organ_sizeable)
		max_reagents = storage_per_size + (storage_per_size * organ_size)
	create_reagents(max_reagents)
	if(!refilling && M.mind) //mind check so goblins etc have milk on spawn.
		startsfilled = FALSE
	if(special && startsfilled) // won't fill the organ if you insert this organ via surgery
		reagents.add_reagent(reagent_to_make, reagents.maximum_volume)

/obj/item/organ/filling_organ/on_life()
	var/mob/living/carbon/human/H = owner

	..()
	//updates size caps
	if(!issimple(H) && H.mind && organ_sizeable)
		var/captarget = storage_per_size + (storage_per_size * organ_size) // Updates the max_reagents in case the organ size changes
		if(damage)
			captarget = max(0, captarget-damage*10)
		if(contents.len)
			for(var/obj/item/thing as anything in contents)
				if(thing.type != /obj/item/dildo/plug) //plugs wont take space as they are especially for this.
					captarget -= thing.w_class*10
		if(captarget != reagents.maximum_volume)
			if(fertility && pregnant)
				captarget *= 0.5
			reagents.maximum_volume = captarget
			if(H.has_quirk(/datum/quirk/selfawaregeni) && world.time > last_size_alert + 8 SECONDS)
				last_size_alert = world.time
				to_chat(H, span_blue("My [pick(altnames)] hold a different amount now."))

	//debuff checks
	if(bloatable) //its bloatable.
		if(reagents.total_volume > (reagents.maximum_volume/3)) //more than 1/3 full, light bloat.
			if(!reagents.total_volume > (reagents.maximum_volume/2)) //more than half full, heavy bloat.
				if(!owner.has_status_effect(/datum/status_effect/debuff/bloatone) && !owner.has_status_effect(/datum/status_effect/debuff/bloattwo))
					owner.apply_status_effect(/datum/status_effect/debuff/bloatone)
			else
				if(!owner.has_status_effect(/datum/status_effect/debuff/bloattwo))
					owner.apply_status_effect(/datum/status_effect/debuff/bloattwo)

	if(damage > low_threshold)
		if(prob(3))
			to_chat(H, span_warning("My [pick(altnames)] aches..."))
		if(damage > high_threshold) //internal bleeding ig
			owner.transfer_blood_to(src, round(damage/10), TRUE)
			to_chat(H, span_boldwarning("My [pick(altnames)] BLEEDS..!"))


	// modify nutrition to generate reagents
	if(damage) //cant regen or consume while damaged.
		if(!HAS_TRAIT(src, TRAIT_NOHUNGER)) //if not nohunger
			if(owner.nutrition < (NUTRITION_LEVEL_HUNGRY - 25) && hungerhelp) //consumes if hungry and uses nutrient, putting below the limit so person dont get stress message spam.
				var/remove_amount = min(reagent_generate_rate, reagents.total_volume)
				if(uses_nutrient) //add nutrient
					owner.adjust_nutrition(remove_amount) //since hunger factor is so tiny compared to the nutrition levels it has to fill
				reagents.remove_reagent(reagent_to_make, (remove_amount*4)) //we consume our own reagents for food less efficently, allowing running out (may undo this multiplier later.)
			else
				if((reagents.total_volume < reagents.maximum_volume) && refilling && owner.nutrition > (NUTRITION_LEVEL_FED + 25)) //if organ is not full.
					var/max_restore = owner.nutrition > (NUTRITION_LEVEL_WELL_FED) ? reagent_generate_rate * 2 : reagent_generate_rate
					var/restore_amount = min(max_restore, reagents.maximum_volume - reagents.total_volume) // amount restored if fed, capped by reagents.maximum_volume
					if(uses_nutrient) //consume nutrient
						owner.adjust_nutrition(-restore_amount)
					reagents.add_reagent(reagent_to_make, restore_amount)
		else //if nohunger, should just regenerate stuff for free no matter what, if refilling.
			if((reagents.total_volume < reagents.maximum_volume) && refilling)
				var/max_restore = reagent_generate_rate * 2
				var/restore_amount = min(max_restore, reagents.maximum_volume - reagents.total_volume)
				reagents.add_reagent(reagent_to_make, restore_amount)

	if(!COOLDOWN_FINISHED(src, liquidcd))
		return
	if(reagents.total_volume && absorbing) //slowly inject to your blood if they have reagents. Will not work if refilling because i cant properly seperate the reagents for which to keep which to dump.
		reagents.trans_to(owner, absorbrate, absorbmult, TRUE, FALSE)
	if(!contents.len) //if nothing is plugging the hole, stuff will drip out.
		var/tempdriprate = driprate
		if((reagents.total_volume && spiller) || (reagents.total_volume > reagents.maximum_volume)) //spiller or above it's capacity to leak.
			var/obj/item/clothing/blockingitem = H.mob_slot_wearing(blocker)
			if(blockingitem && !blockingitem.genital_access) //we aint dripping a drop.
			/*
				tempdriprate = 0.1 //if worn slot cover it, drip nearly nothing.
				if(owner.has_quirk(/datum/quirk/selfawaregeni))
					if(prob(5))
						to_chat(H, pick(span_info("A little bit of [english_list(reagents.reagent_list)] drips from my [pick(altnames)] to my [blockingitem.name]..."),
						span_info("Some liquid drips from my [pick(altnames)] to my [blockingitem.name]."),
						span_info("My [pick(altnames)] spills some liquid to my [blockingitem.name]."),
						span_info("Some [english_list(reagents.reagent_list)] drips from my [pick(altnames)] to my [blockingitem.name].")))
			*/
			else //we drippin
				if(owner.has_quirk(/datum/quirk/selfawaregeni))
					if(prob(5)) //with selfawaregeni quirk you got some chance to see what type of liquid is dripping from you.
						to_chat(H, pick(span_info("A little bit of [english_list(reagents.reagent_list)] drips from my [pick(altnames)]..."),
						span_info("Some liquid drips from my [pick(altnames)]."),
						span_info("My [pick(altnames)] spills some liquid."),
						span_info("Some [english_list(reagents.reagent_list)] drips from my [pick(altnames)].")))
				var/obj/item/reagent_containers/the_bottle
				if((owner.mobility_flags & MOBILITY_STAND))
					for(var/obj/item/reagent_containers/bottle in range(0,H)) //having a bottle under us speed up leak greatly and transfer the leak there instead.
						if(bottle.reagents.total_volume >= bottle.reagents.maximum_volume)
							continue
						if(bottle.reagents.flags & REFILLABLE)
							the_bottle = bottle
							break
				if(!the_bottle) //no bottle so just spill
					reagents.remove_all(tempdriprate)
				else
					var/avlspace = the_bottle.reagents.maximum_volume - the_bottle.reagents.total_volume
					tempdriprate *= 50 //since default values are basically decimals.
					reagents.trans_to(the_bottle, min(tempdriprate, avlspace))
					to_chat(owner, span_info("I collect the fluids in \the [the_bottle] beneath me."))
	else //we got something in contents
		for(var/obj/item/reagent_containers/contentitem in contents) //we got a bottle inside
			if(contentitem.reagents && contentitem.spillable)
				if(refilling && reagents.total_volume) //producers fill bottles, others get filled.
					reagents.trans_to(reagents, rand(4,8))
				else
					if(contentitem.reagents.total_volume)
						contentitem.reagents.trans_to(reagents, rand(4,8))
	COOLDOWN_START(src, liquidcd, processspeed)

/obj/item/organ/filling_organ/proc/organ_jumped()
	var/mob/living/carbon/human/H = owner
	var/obj/item/organ/filling_organ/forgan = src

	var/stealth = H.get_skill_level(/datum/skill/misc/sneaking)
	var/keepinsidechance = CLAMP((rand(25,100) - (stealth * 20)),0,100) //basically cant lose your item if you have 5 stealth.
	if(reagents.total_volume > reagents.maximum_volume / 2 && spiller && prob(keepinsidechance)) //if you have more than half full spiller organ.
		owner.visible_message(span_info("[owner]'s [pick(altnames)] spill some of it's contents with the pressure on it!"),span_info("My [pick(altnames)] spill some of it's contents with the pressure on it! [keepinsidechance]%"),span_unconscious("I hear a splash."))
		reagents.remove_all(keepinsidechance)
		playsound(owner, 'sound/foley/waterenter.ogg', 15)

	if(!issimple(H) && H.mind)
		if(contents.len)
			for(var/obj/item/forgancontents as anything in forgan.contents)
				if(!istype(forgancontents, /obj/item/dildo)) //dildo keeps stuff in even if you have no pants ig
					var/obj/item/clothing/blockingitem = get_organ_blocker(H, zone)
					if(!blockingitem || blockingitem.genital_access) //checks if the item has genital_access, like skirts, if not, it blocks the thing from flying off.
						if(prob(keepinsidechance))
							if(H.client?.prefs.showrolls)
								to_chat(H, span_alert("Damn! I lose my [pick(altnames)]'s grip on [english_list(contents)]! [keepinsidechance]%"))
							else
								to_chat(H, span_alert("Damn! I lose my [pick(altnames)]'s grip on [english_list(contents)]!"))
							playsound(H, 'sound/misc/mat/insert (1).ogg', 20, TRUE, -2, ignore_walls = FALSE)
							forgancontents.doMove(get_turf(H))
							forgan.contents -= forgancontents
							var/yeet = rand(4)
							var/turf/selectedturf = pick(orange(H, yeet)) //object flies off the hole with pressure at a random turf, funny.
							forgancontents.throw_at(selectedturf, yeet, 2)
						else
							if(H.client?.prefs.showrolls)
								if(keepinsidechance < 10)
									to_chat(H, span_blue("I easily maintain my [pick(altnames)]'s grip on [english_list(contents)]. [keepinsidechance]%"))
								else
									to_chat(H, span_info("Phew, I maintain my [pick(altnames)]'s grip on [english_list(contents)]. [keepinsidechance]%"))
							else
								if(keepinsidechance < 10)
									to_chat(H, span_blue("I easily maintain my [pick(altnames)]'s grip on [english_list(contents)]."))
								else
									to_chat(H, span_info("Phew, I maintain my [pick(altnames)]'s grip on [english_list(contents)]."))
				break

//for milking, here for convenience i guess.
/obj/item/reagent_containers/glass/attack(mob/M, mob/user, obj/target)
	//not as modular as everything else but it is what it is.
	if(ishuman(M) && user.used_intent.type == INTENT_FILL)
		var/mob/living/carbon/human/humanized = M
		var/obj/item/organ/filling_organ/breasts/tiddies = humanized.getorganslot(ORGAN_SLOT_BREASTS) // tiddy hehe
		switch(user.zone_selected)
			if(BODY_ZONE_CHEST) //chest
				if(humanized.wear_shirt && (humanized.wear_shirt.flags_inv & HIDEBOOB || !humanized.wear_shirt.genital_access))
					to_chat(user, span_warning("[humanized]'s chest must be exposed before I can milk [humanized.p_them()]!"))
					return TRUE
				if(!tiddies)
					to_chat(user, span_warning("[humanized] cannot be milked!"))
					return TRUE
				if(tiddies.reagents.total_volume <= 0)
					to_chat(user, span_warning("[humanized] is out of milk!"))
					return TRUE
				if(reagents.total_volume >= volume)
					to_chat(user, span_warning("[src] is full."))
					return TRUE
				var/milk_to_take = CLAMP((tiddies.reagents.maximum_volume/6), 1, min(tiddies.reagents.total_volume, volume - reagents.total_volume))
				if(do_after(user, 20, target = humanized))
					tiddies.reagents.trans_to(src, milk_to_take, transfered_by = user)
					user.visible_message(span_notice("[user] milks [humanized] into \the [src]."), span_notice("I milk [humanized] into \the [src]."))
			if(BODY_ZONE_PRECISE_GROIN) //groin
				if(humanized.wear_pants && (humanized.wear_pants.flags_inv & HIDECROTCH || !humanized.wear_pants.genital_access))
					to_chat(user, span_warning("[humanized]'s groin must be exposed before I can milk [humanized.p_them()]!"))
					return TRUE
				var/obj/item/organ/filling_organ/testicles/testes = humanized.getorganslot(ORGAN_SLOT_TESTICLES)
				if(!testes)
					to_chat(user, span_warning("[humanized] cannot be milked!"))
					return TRUE
				if(testes.reagents.total_volume <= 0)
					to_chat(user, span_warning("[humanized] is out of cum!"))
					return TRUE
				if(reagents.total_volume >= volume)
					to_chat(user, span_warning("[src] is full."))
					return TRUE
				if(do_after(user, 40, target = humanized))
					var/cum_to_take = CLAMP((testes.reagents.maximum_volume/2), 1, min(testes.reagents.total_volume, volume - reagents.total_volume))
					testes.reagents.trans_to(src, cum_to_take, transfered_by = user)
					user.visible_message(span_notice("[user] milks [humanized]'s cock into \the [src]."), span_notice("I milk [humanized]'s cock into \the [src]."))
		return TRUE
	. = ..()

//ton of shit that is used

//Bloat statuses
//added and removed by filling_organs
/datum/status_effect/debuff/bloatone
	id = "bloatone"
	duration = 1 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/bloatone
	examine_text = span_notice("Their belly is bulging...")
	effectedstats = list("constitution" = 1, "speed" = -1)

/atom/movable/screen/alert/status_effect/bloatone
	name = "Bloated"
	desc = "Bit full..."
	icon = 'modular_stonehedge/licensed-eaglephntm/icons/mob/screen_alert.dmi'
	icon_state = "bloat1"

/datum/status_effect/debuff/bloattwo
	id = "bloattwo"
	duration = 1 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/bloattwo
	examine_text = span_notice("Their belly is bulging largely...")
	effectedstats = list("constitution" = 2, "speed" = -2)

/datum/status_effect/debuff/bloattwo/on_apply()
	. = ..()
	//upgrades people, upgrades.
	if(owner.has_status_effect(/datum/status_effect/debuff/bloatone))
		owner.remove_status_effect(/datum/status_effect/debuff/bloatone)

/atom/movable/screen/alert/status_effect/bloattwo
	name = "Bloated"
	desc = "So full..."
	icon = 'modular_stonehedge/licensed-eaglephntm/icons/mob/screen_alert.dmi'
	icon_state = "bloat2"

//had to make this ghetto ass shit, fucks sake
/mob/living/carbon/proc/mob_slot_wearing(zone)
	if(iscarbon(src))
		var/mob/living/carbon/human/user = src
		for(var/obj/item/clothing/equipped_item in user.get_equipped_items(include_pockets = FALSE))
			if(equipped_item.slot_flags & zone)
				return equipped_item
			else
				continue

/obj/item/clothing
	///is it like a skirt or thigh highs on pant slot that wont interfere with our bits?
	var/genital_access = FALSE
	///for bra only body armors that allow groin interactions.
	var/is_bra = FALSE

//this would go to surgery helpers normally.
/proc/get_organ_blocker(mob/user, location = BODY_ZONE_CHEST)
	if(iscarbon(user))
		var/mob/living/carbon/carbon_user = user
		for(var/obj/item/clothing/equipped_item in carbon_user.get_equipped_items(include_pockets = FALSE))
			if(zone2covered(location, equipped_item.body_parts_covered))
				//skips bra items if the location we are looking at is groin
				if(equipped_item.is_bra && location == BODY_ZONE_PRECISE_GROIN)
					continue
				return equipped_item

//not genital but guts redone as if anus
/obj/item/organ/filling_organ/guts
	//absorbs faster than womb, less capacity.
	name = "guts"
	icon_state = "guts"
	w_class = WEIGHT_CLASS_SMALL
	zone = BODY_ZONE_PRECISE_STOMACH
	slot = ORGAN_SLOT_GUTS
	attack_verb = list("gored", "squished", "slapped", "digested")
	desc = ""

	low_threshold_passed = "<span class='info'>My guts flashes with pain before subsiding.</span>"
	high_threshold_passed = "<span class='warning'>My guts flares up with constant pain.</span>"
	high_threshold_cleared = "<span class='info'>The pain in my guts die down for now.</span>"
	low_threshold_cleared = "<span class='info'>The last bouts of pain in my guts have died out.</span>"

	max_reagents = 150 //more size than vagene and more absorbtion speed cuz built for it
	absorbing = TRUE
	absorbmult = 1.5 //more effective absorb than others i guess.
	altnames = list("ass", "asshole", "butt", "butthole", "guts") //used in thought messages.
	spiller = TRUE
	blocker = ITEM_SLOT_PANTS
	bloatable = TRUE
