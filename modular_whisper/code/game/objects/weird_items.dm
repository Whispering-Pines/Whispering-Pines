/obj/item/balm
	name = "balm"
	desc = "Something that is used to preserve bodies for whatever reason, prevents rotting. It is single use."
	gender = PLURAL
	icon = 'modular_whisper/icons/obj/misc.dmi'
	icon_state = "balm"
	w_class = WEIGHT_CLASS_TINY
	item_flags = NOBLUDGEON
	throwforce = 0
	throw_speed = 1
	throw_range = 7
	grid_width = 32
	grid_height = 32

/obj/item/balm/attack(mob/living/carbon/human/target, mob/living/carbon/user)
	. = ..()
	user.changeNext_move(CLICK_CD_MELEE)
	if(!ishuman(target))
		to_chat(user, span_warning("I can only do this to humanoids."))
		return
	if(!do_after(user, 10 SECONDS, target))
		return
	to_chat(user, span_warning("I preserve [target]"))
	ADD_TRAIT(target, TRAIT_EMBALMED, TRAIT_GENERIC)
	qdel(src)


//dangerous meats
//meat from animals that are likely to have disease or parasites, atleast when uncooked maybe.
/obj/item/reagent_containers/food/snacks/meat/steak/dangerous
	list_reagents = list(/datum/reagent/consumable/nutriment = RAWMEAT_NUTRITION, /datum/reagent/toxin/parasite = 2)

/datum/reagent/toxin/parasite
	name = "parasites"
	description = "A parasite."
	harmful = TRUE
	metabolization_rate = REAGENTS_SLOW_METABOLISM
	//silent bitches except... status effect.
	dwarf_toxpwr = 0
	dwarf_nausea = 0
	toxpwr = 0
	nausea = 0

/datum/reagent/toxin/parasite/on_mob_life(mob/living/carbon/M)
	. = ..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(HAS_TRAIT(H, TRAIT_ROT_EATER) || HAS_TRAIT(H, TRAIT_ORGAN_EATER))
			return
		if(prob(25)) //some got a chance not to survive ig
			H.apply_status_effect(/datum/status_effect/debuff/parasite)

/datum/status_effect/debuff/parasite
	id = "parasite"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/parasite
	effectedstats = list(STATKEY_CON = -1, STATKEY_END = -1)
	duration = 30 MINUTES

/atom/movable/screen/alert/status_effect/debuff/parasite
	name = "Parasite"
	desc = "<span class='warning'>I ate something dangerous and now I got uninvited guests in my guts... I need a disease cure.</span>\n"
	icon_state = "poison"

/datum/status_effect/debuff/parasite/tick()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.adjust_nutrition(-2)
		C.adjust_hydration(-2)

//anti preg alchemy recipe

/datum/alch_cauldron_recipe/anti_preg_potion
	recipe_name = "Anti Pregnancy Potion"
	smells_like = "abortion"
	output_reagents = list(/datum/reagent/medicine/antipregnancy = 18)
	required_essences = list(
		/datum/thaumaturgical_essence/poison = 3,
		/datum/thaumaturgical_essence/cycle = 2
	)

//anti preg merchant stuff
/datum/supply_pack/food/cum
	name = "Male Ejaculate"
	cost = 20
	contains = /obj/item/reagent_containers/glass/bottle/cum

/datum/supply_pack/food/femcum
	name = "Female Ejaculate"
	cost = 30
	contains = /obj/item/reagent_containers/glass/bottle/pussyjuice

/datum/supply_pack/food/antipregpot
	name = "Anti Pregnancy Potion"
	cost = 30
	contains = list(
					/obj/item/reagent_containers/glass/bottle/antipregnancy,
					/obj/item/reagent_containers/glass/bottle/antipregnancy,
					/obj/item/reagent_containers/glass/bottle/antipregnancy,
				)

/obj/item/reagent_containers/glass/bottle/antipregnancy
	list_reagents = list(/datum/reagent/medicine/antipregnancy = 45)

/datum/reagent/medicine/antipregnancy
	name = "Pregnancy Removal Potion"
	description = "Fixes mistakes."
	reagent_state = LIQUID
	color = "#a9326a"
	taste_description = "worries"
	overdose_threshold = 60
	metabolization_rate = REAGENTS_METABOLISM
	alpha = 200

/datum/reagent/medicine/antipregnancy/on_mob_life(mob/living/carbon/M)
	for(var/obj/item/organ/filling_organ/vagina/forgan in M.internal_organs)
		if(forgan.pregnant)
			to_chat(M, "I feel like I lost a part of me. The pregnancy is no more.")
			forgan.undo_preggoness()
	M.add_nausea(0.2)
	..()
	. = 1

/datum/reagent/medicine/antipregnancy/overdose_process(mob/living/carbon/M)
	M.add_nausea(9)
	M.adjustToxLoss(3, 0)

/datum/reagent/water/pussjuice
	name = "pussy juice"
	description = "A strange slightly gooey substance."
	color = "#999999"

/datum/reagent/consumable/cum
	name = "Semen"
	description = "A strange white liquid produced by testicles..."
	color = "#c6c6c6"
	taste_description = "salty slime"
	glass_icon_state = "glass_white"
	glass_name = "glass of semen"
	glass_desc = ""
	var/virile = TRUE


/datum/reagent/consumable/cum/on_transfer(atom/A, method, trans_volume)
	. = ..()
	if(istype(A, /obj/item/organ/filling_organ/vagina) && virile)
		var/obj/item/organ/filling_organ/vagina/forgan = A
		if(forgan.fertility && !forgan.pregnant)
			if(prob(trans_volume))
				forgan.be_impregnated() //boom

/datum/reagent/consumable/cum/on_mob_life(mob/living/carbon/M)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(2,0, 0)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!HAS_TRAIT(H, TRAIT_NOHUNGER))
			H.adjust_hydration(5)
			H.adjust_nutrition(5)
		if(H.blood_volume < BLOOD_VOLUME_NORMAL)
			H.blood_volume = min(H.blood_volume+3, BLOOD_VOLUME_NORMAL)
	. = 1
	..()

/datum/reagent/consumable/cum/plant
	name = "Floral reproductive juice"
	description = "A strange sap like liquid produced by plants... Used to crossbreed, also has tiny healing properties. Good for genital health somehow."
	color = "#ffc157"
	taste_description = "sweet slime"
	glass_name = "glass of floral reproductive juice"

/datum/reagent/consumable/cum/plant/on_transfer(atom/A, method, trans_volume)
	. = ..()
	if(istype(A, /obj/item/organ/filling_organ/vagina) && virile)
		var/obj/item/organ/filling_organ/vagina/forgan = A
		if(forgan.fertility && !forgan.pregnant)
			if(prob(trans_volume))
				forgan.be_itempregnated(/obj/item/maneaterseed, 4) //boom

/datum/reagent/consumable/cum/plant/on_mob_life(mob/living/carbon/M)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!HAS_TRAIT(H, TRAIT_NOHUNGER))
			H.adjust_hydration(4)
			H.adjust_nutrition(4)
	var/list/wCount = M.get_wounds()
	if(M.blood_volume < BLOOD_VOLUME_NORMAL) //can not overfill
		M.blood_volume = min(M.blood_volume+3, BLOOD_VOLUME_MAXIMUM)
	if(wCount.len > 0)
		M.heal_wounds(10)
		M.update_damage_overlays()
	M.adjustBruteLoss(-1, 0)
	M.adjustFireLoss(-1, 0)
	M.adjustToxLoss(-1, 0)
	for(var/obj/item/organ/filling_organ/organny in M.internal_organs)
		if(organny.damage && prob(5))
			to_chat(M, span_green("I feel a  soothing chill on my [pick(organny.altnames)] due to the floral juice."))
		M.adjustOrganLoss(organny.slot, -1) //genital repair juice
	. = 1
	..()

/obj/item/reagent_containers/glass/bottle/milk
	list_reagents = list(/datum/reagent/consumable/milk = 45)

/obj/item/reagent_containers/glass/bottle/cum
	list_reagents = list(/datum/reagent/consumable/cum = 45)

/obj/item/reagent_containers/glass/bottle/pussyjuice
	list_reagents = list(/datum/reagent/water/pussjuice = 45)

/datum/reagent/consumable/cum/sterile
	virile = FALSE

/datum/reagent/consumable/cum/sterile/old //used in statue fountain.
	name = "Old Semen"
	description = "Disgusting... smelly slime... And somewhat yellow. This was magically, barely preserved through decades... It used to be fine, even clear as water until I severed it from it's home."
	color = "#c7c49e"
	taste_description = "salty, disgusting moldy slime"
	glass_icon_state = "glass_white"
	glass_name = "glass of old semen"

/datum/reagent/consumable/cum/sterile/old/on_mob_life(mob/living/carbon/M)
	if(M.getBruteLoss() && prob(20))
		M.heal_bodypart_damage(1,0, 0)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!HAS_TRAIT(H, TRAIT_NOHUNGER))
			H.adjust_hydration(5)
			H.adjust_nutrition(5)
		if(!HAS_TRAIT(H, TRAIT_ROT_EATER))
			H.adjustToxLoss(2, TRUE) //this shit is toxic.
			H.add_nausea(3)
			if(prob(5))
				to_chat(M, span_notice("[pick("God, I am going to puke...","My stomach is crying for help...","I feel sick...","That was disgusting... I feel sick...")]"))

	. = 1
	..()


//some stockpile and food shit
/obj/item/reagent_containers/food/snacks/raisins/solvent
	name = "solvent bar"
	icon = 'modular_whisper/icons/items/produce.dmi'
	icon_state = "solvent"
	base_icon_state = "solvent"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_NUTRITIOUS)
	tastes = list("dog shit" = 1)
	foodtype = MEAT //Not tagged cannibal since its sorta meant to be a trick.
	faretype = FARE_IMPOVERISHED

/datum/stock/stockpile/solvent
	name = "solvent bar"
	desc = "an edible bar, tastes terrible but it is nutritious."
	item_type = /obj/item/reagent_containers/food/snacks/raisins/solvent
	held_items = 2
	payout_price = 3
	withdraw_price = 6
	export_price = 6
	importexport_amt = 12

/datum/stock/stockpile/bloodbag
	name = "blood bag"
	desc = "life essence that saves life."
	item_type = /obj/item/reagent_containers/blood
	held_items = 5
	payout_price = 10
	withdraw_price = 14
	export_price = 12
	importexport_amt = 10
	oversupply_amount = 25

/obj/item/weapon/hammer/stone
	name = "stone hammer"
	icon_state = "stonehammer"
	force = 8
	smeltresult = null
	max_integrity = 20

/obj/item/natural/sand
	name = "sand"
	desc = "A piece of rough sand."
	icon_state = "infernalash"
	color = "#ffcd87"
	item_state = "infernalash"
	experimental_inhand = FALSE
	gripped_intents = null
	dropshrink = 0.75
	possible_item_intents = list(INTENT_GENERIC)
	force = 1
	throwforce = 1
	slot_flags = ITEM_SLOT_MOUTH
	w_class = WEIGHT_CLASS_SMALL
	resistance_flags = FIRE_PROOF

/turf/closed/mineral/sand
	icon = MAP_SWITCH('icons/turf/smooth/walls/mineral.dmi', 'icons/turf/mining.dmi')
	icon_state = MAP_SWITCH("mineral", "salt")
	mineralType = /obj/item/natural/sand
	rockType = /obj/item/natural/rock/sand
	spreadChance = 12
	spread = 3
	max_integrity = 200

/obj/item/natural/rock/sand
	mineralType = /obj/item/natural/rock/sand
