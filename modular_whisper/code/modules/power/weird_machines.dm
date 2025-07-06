/obj/machinery/fake_powered/biofabricator
	name = "Fake Fabricator"
	icon = 'modular_whisper/icons/misc/machines.dmi'
	var/biomass_amount = 0
	var/obj/item/produced_thing = null

/obj/machinery/fake_powered/attack_hand(mob/living/user)
	if(Adjacent(user) && user.pulling)
		if(isliving(user.pulling))
			var/mob/living/pushed_mob = user.pulling
			if(pushed_mob.buckled)
				to_chat(user, "<span class='warning'>[pushed_mob] is on [pushed_mob.buckled]!</span>")
				return
			if(user.used_intent.type == INTENT_GRAB)
				if(user.grab_state < GRAB_AGGRESSIVE)
					to_chat(user, "<span class='warning'>I need a better grip to do that!</span>")
					return
			if(user.used_intent.type == INTENT_HELP)
				pushed_mob.visible_message("<span class='notice'>[user] begins to place [pushed_mob] onto [src]...</span>", \
									"<span class='danger'>[user] begins to place [pushed_mob] onto [src]...</span>")
				if(do_after(user, 3.5 SECONDS, pushed_mob))
					pushed_mob.forceMove(loc)
					pushed_mob.set_resting(TRUE, TRUE)
					pushed_mob.visible_message("<span class='notice'>[user] places [pushed_mob] onto [src].</span>", \
												"<span class='notice'>[user] places [pushed_mob] onto [src].</span>")
					log_combat(user, pushed_mob, "places", null, "onto [src]")
				else
					return
			user.stop_pulling()
		else if(user.pulling.pass_flags & PASSTABLE)
			user.Move_Pulled(src)
			if (user.pulling.loc == loc)
				user.visible_message("<span class='notice'>[user] places [user.pulling] onto [src].</span>",
					"<span class='notice'>I place [user.pulling] onto [src].</span>")
				user.stop_pulling()
	return ..()

/obj/machinery/fake_powered/biofabricator/examine(mob/user)
	. = ..()
	. += "This produces [produced_thing.name] per biomass, and has [biomass_amount] biomass stored."

//solvent fab, takes various goods and gives out solvent bars.
/obj/machinery/fake_powered/biofabricator/solvent
	name = "Solvent Fabricator"
	icon_state = "biofab_solvent"
	desc = "A horrible machine of old desperativeness, turns natural matter into yucky but edible paste for the masses... right button dispenses solvent bars."
	produced_thing = /obj/item/reagent_containers/food/snacks/raisins/solvent

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
	name = "bloodbag"
	desc = "life essence that saves life."
	item_type = /obj/item/reagent_containers/blood
	held_items = 5
	payout_price = 8
	withdraw_price = 12
	export_price = 10
	importexport_amt = 20

/obj/item/reagent_containers/food/snacks/raisins/Initialize(mapload)
	. = ..()
	color = pick(COLOR_GREEN,COLOR_RED,COLOR_BLUE,COLOR_PURPLE,COLOR_BEIGE,COLOR_ORANGE,null)

/obj/machinery/fake_powered/biofabricator/solvent/attackby(obj/item/I, mob/user, params)
	. = ..()
	user.changeNext_move(CLICK_CD_FAST)
	if(toggled)
		if (istype(I, /obj/item/natural/poo))
			biomass_amount += 1
			qdel(I)
		else if (istype(I, /obj/item/compost))
			biomass_amount += 2
			qdel(I)
		else if (istype(I, /obj/item/reagent_containers/food))
			var/obj/item/reagent_containers/food/foodie = I
			biomass_amount += foodie.faretype
			qdel(I)
		else if (istype(I, /obj/item/organ))
			if(istype(I, /obj/item/organ/brain))
				biomass_amount += 1
			biomass_amount += 3
			qdel(I)
		else if (istype(I, /obj/item/bodypart))
			biomass_amount += 4
			qdel(I)
		else
			say("Not workable.", language = /datum/language/ancient_english)
			playsound(loc, 'sound/misc/machineno.ogg', 100, FALSE, -1)
	else
		balloon_alert_to_viewers("Unpowered.")

/obj/machinery/fake_powered/biofabricator/solvent/attack_right(mob/user)
	. = ..()
	if(!toggled)
		balloon_alert_to_viewers("Unpowered.")
		return
	if(!biomass_amount)
		playsound(loc, 'sound/misc/machineno.ogg', 100, FALSE, -1)
		say("Nothing found in compartment.", language = /datum/language/ancient_english)
		return
	playsound(loc, 'sound/misc/keyboard_enter.ogg', 100, TRUE, -1)
	sleep(0.5 SECONDS)
	start_processing_solvent()

/obj/machinery/fake_powered/biofabricator/solvent/proc/start_processing_solvent()
	playsound(loc, 'sound/misc/guillotine.ogg', 50, TRUE, -1)
	sleep(1.5 SECONDS)
	playsound(loc, 'sound/misc/guillotine.ogg', 50, TRUE, -1)
	sleep(1.5 SECONDS)
	playsound(loc, 'sound/misc/guillotine.ogg', 50, TRUE, -1)
	sleep(1.5 SECONDS)
	playsound(loc, 'sound/misc/guillotine.ogg', 50, TRUE, -1)
	sleep(1.5 SECONDS)
	playsound(src, 'sound/combat/vite.ogg', 100, FALSE, -1)
	say("Process complete.", language = /datum/language/ancient_english)
	playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
	for(var/index in 1 to biomass_amount)
		biomass_amount -= 1
		new /obj/item/reagent_containers/food/snacks/raisins/solvent(loc)


//biomass recycler, to make it easier for me i'll make this unpowered
GLOBAL_VAR_INIT(global_biomass_storage, 0.5)

/obj/structure/closet/crate/coffin/biomass_recycler
	name = "Biomass Recycler"
	icon = 'modular_whisper/icons/misc/machines.dmi'
	icon_state = "biomass_recycler"
	desc = "Another byproduct of world ending war, generally used to turn emptied corpses or food etc into material for recloning or limb regrowers."
	anchored = TRUE
	var/working = FALSE
	open_sound = 'sound/foley/doors/shittyopen.ogg'
	close_sound = 'sound/foley/doors/shittyclose.ogg'

/obj/structure/closet/crate/coffin/biomass_recycler/examine(mob/user)
	. = ..()
	. += "<span class='warning'>There is enough biomass to make [GLOB.global_biomass_storage] bodies.</span>"

/obj/structure/closet/crate/coffin/biomass_recycler/open(mob/living/user)
	if(working)
		balloon_alert_to_viewers("Working.")
		return
	. = ..()
	update_icon_state()

/obj/structure/closet/crate/coffin/biomass_recycler/close(mob/living/user)
	. = ..()
	update_icon_state()
	working = TRUE
	for(var/content in contents)
		if(ishuman(content))
			var/mob/living/carbon/human/victim = content
			sleep(2 SECONDS)
			playsound(loc, 'sound/misc/guillotine.ogg', 100, TRUE, -1)
			victim.emote("scream")
			victim.flash_fullscreen("redflash3")
			sleep(2 SECONDS)
			playsound(loc, 'sound/misc/guillotine.ogg', 100, TRUE, -1)
			victim.emote("scream")
			victim.flash_fullscreen("redflash3")
			sleep(2 SECONDS)
			playsound(loc, 'sound/misc/guillotine.ogg', 100, TRUE, -1)
			victim.emote("scream")
			victim.flash_fullscreen("redflash3")
			sleep(2 SECONDS)
		else
			sleep(2 SECONDS)
			playsound(loc, 'sound/misc/guillotine.ogg', 100, TRUE, -1)
			sleep(2 SECONDS)
			playsound(loc, 'sound/misc/guillotine.ogg', 100, TRUE, -1)
			sleep(2 SECONDS)
			playsound(loc, 'sound/misc/guillotine.ogg', 100, TRUE, -1)
			sleep(2 SECONDS)
		if(ishuman(content))
			var/mob/living/carbon/human/victim = content
			var/points_to_give = 0.1 //for emptied torso alone base.
			for(var/obj/item/bodypart/skellybones in victim.bodyparts)
				if(skellybones.skeletonized || skellybones.rotted)
					points_to_give -= 0.05 //fucked ass limb takes from quality.
					playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
					say("Bad [skellybones], some biomass was lost due contamination.", language = /datum/language/ancient_english)
				else
					points_to_give += 0.05 //healthy limb in there.
				continue
			for(var/obj/item/organ/organie in victim.internal_organs)
				points_to_give += 0.05 //organ in there.
				if(istype(organie, /obj/item/organ/brain))
					points_to_give += 0.05 //double
				qdel(content)
				continue
			GLOB.global_biomass_storage += max(points_to_give,0.1)
			victim.gib(TRUE,TRUE,TRUE)
			continue
		else if(istype(content,/obj/item/bodypart))
			var/obj/item/bodypart/bodypartening = content
			if(bodypartening.skeletonized || bodypartening.rotted)
				GLOB.global_biomass_storage -= 0.05 //fucked ass limb takes from quality.
				playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
				say("Bad [bodypartening.name], some biomass was lost due contamination.", language = /datum/language/ancient_english)
			else
				GLOB.global_biomass_storage += 0.05 //healthy limb in there.
			qdel(content)
			continue
		else if(istype(content,/obj/item/organ))
			GLOB.global_biomass_storage += 0.05
			if(istype(content, /obj/item/organ/brain))
				GLOB.global_biomass_storage += 0.05 //double
			qdel(content)
			continue
		else if(istype(content, /obj/item/reagent_containers/food))
			var/obj/item/reagent_containers/food/victim = content
			GLOB.global_biomass_storage += victim.faretype * 0.03 //it takes alot to remake a man.
			qdel(victim)
			continue
		else if(istype(content, /obj/item/grown/log/tree/small))
			GLOB.global_biomass_storage += 0.05
			qdel(content)
			continue
		else if(istype(content, /obj/item/grown/log/tree/stick))
			GLOB.global_biomass_storage += 0.01
			qdel(content)
			continue
		else if(istype(content, /obj/item/natural/bundle/stick))
			var/obj/item/natural/bundle/stick/stickening = content
			GLOB.global_biomass_storage += 0.01*stickening.amount
			qdel(content)
			continue
		else if(istype(content, /mob/living/simple_animal))
			var/mob/living/simple_animal/victim = content
			victim.gib(TRUE,TRUE,TRUE)
			GLOB.global_biomass_storage += 0.3 //Animals dont translate that well.
			playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
			say("Animal matter is difficult to process and yields less therefore.", language = /datum/language/ancient_english)
			continue
		for(var/obj/machinery/fake_powered/cloning_pod/clonebays in GLOB.cloning_bays)
			clonebays.update_icon()
	working = FALSE

/obj/structure/closet/crate/coffin/liquid_drainer
	name = "Blood drainer"
	icon = 'modular_whisper/icons/misc/machines.dmi'
	icon_state = "blood_drainer"
	desc = "Likely used to supply blood for the warriors of the great war of old, now it has other purposes aswell, thanks to modifications. Drains all of the blood and other fluids of living and the dead, leaving them weakened and likely to die without aid."
	anchored = TRUE
	var/working = FALSE

/obj/structure/closet/crate/coffin/liquid_drainer/open(mob/living/user)
	if(working)
		balloon_alert_to_viewers("Working.")
		return
	. = ..()
	update_icon_state()

/obj/structure/closet/crate/coffin/liquid_drainer/Initialize()
	. = ..()
	create_reagents(2000)

/obj/structure/closet/crate/coffin/liquid_drainer/close(mob/living/user)
	. = ..()
	update_icon_state()
	for(var/mob/living/carbon/human/victim in contents)
		working = TRUE
		if(victim.age == AGE_CHILD)
			say("ALERT! War crime detected: Harvesting of Children... Process halted... Error, Failed to send alert to united nations confederation, no connection available.", language = /datum/language/ancient_english)
			open()
			return
		if(victim.stat != DEAD)
			playsound(loc, 'sound/misc/machinelong.ogg', 100, FALSE, -1)
			say("Live subject detected, Government identification database connection unavailable, foreigner precautionary pacification measures activated alongside stimulative blood-pumping increasers.", language = /datum/language/ancient_english)
			playsound(src.loc, 'sound/items/beartrap.ogg', 100, TRUE, -1)
			to_chat(victim, span_red("A metal restraint snap to my neck and limbs, holding me in place!"))
			victim.SetParalyzed(3 SECONDS)
			sleep(0.5 SECONDS)
			to_chat(victim, span_red("I feel several stings on my back!"))
			sleep(0.3 SECONDS)
			to_chat(victim, span_red("something starts working my [victim.gender == MALE ? "shaft" : "pussy"] violently..!"))
			if(victim.gender == MALE)
				start_obj_sex(MALE, victim, /datum/sex_action/npc_blowjob, SEX_FORCE_EXTREME, SEX_FORCE_MAX)
			else
				start_obj_sex(FEMALE, victim, /datum/sex_action/npc_vaginal_sex, SEX_FORCE_EXTREME, SEX_FORCE_MAX)
		sleep(1 SECONDS)
		working = FALSE
		suckening_cycle(victim)

/obj/structure/closet/crate/coffin/liquid_drainer/proc/suckening_cycle(mob/living/carbon/human/victim)
	if(victim.blood_volume >= 0 && !opened)
		if(victim.stat != DEAD)
			victim.SetParalyzed(4 SECONDS)
			sleep(2 SECONDS)
		else
			sleep(4 SECONDS) //corpses have no heartbeat to help
		if(victim.loc != contents) //incase they moved while sleep.
			working = FALSE
			return
		victim.transfer_blood_to(src, 50, TRUE)
		suckening_cycle()
	else if(reagents.total_volume >= reagents.maximum_volume)
		playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
		say("Blood tank is full and must be emptied before proceeding.", language = /datum/language/ancient_english)
		if(!opened)
			open()
	else if(victim.blood_volume <= 0)
		victim.apply_status_effect(/datum/status_effect/debuff/blood_drained)
		victim.add_stress(/datum/mood_event/blood_drained)
		playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
		say("No blood remaining in subject.", language = /datum/language/ancient_english)
		if(!opened)
			open()
	else if(!victim.loc == loc)
		playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
		say("Stopping, Subject not found.", language = /datum/language/ancient_english)
		if(!opened)
			open()

/obj/structure/closet/crate/coffin/liquid_drainer/attack_right(mob/user)
	. = ..()
	playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
	say("Dispensing blood pack.", language = /datum/language/ancient_english)
	sleep(1 SECONDS)
	if(reagents.total_volume >= 300)
		var/obj/item/reagent_containers/blood/bloodpack = new /obj/item/reagent_containers/blood(src.loc)
		reagents.trans_to(bloodpack, 300, FALSE, TRUE, FALSE)
	else
		playsound(loc, 'sound/misc/machineno.ogg', 100, FALSE, -1)
		say("Insufficent blood stored.", language = /datum/language/ancient_english)

/datum/status_effect/debuff/blood_drained
	id = "blood_drained"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/blood_drained
	effectedstats = list(STATKEY_SPD = -2, STATKEY_STR = -2, STATKEY_CON = -2, STATKEY_END = -2, STATKEY_PER = -2, STATKEY_LCK = -2)
	duration = 10 MINUTES

/atom/movable/screen/alert/status_effect/debuff/blood_drained
	name = "Drained of lifeblood."
	desc = "<span class='warning'>They took all I had, I feel horrible.</span>\n"
	icon_state = "muscles"

/datum/mood_event/blood_drained
	description = "<span class='nicered'>All my blood was taken....</span>\n"
	mood_change = -4
	timeout = 7 MINUTES

//cloning pod
/obj/machinery/fake_powered/cloning_pod
	name = "Automated Cloning Pod"
	desc = "Used to reclone people and defy old gods' way. Recloning is costly and tend to put people in debt to the kingdom."
	icon = 'modular_whisper/icons/misc/cloning.dmi'
	icon_state = "cell_0"
	density = FALSE
	anchored = TRUE
	layer = BELOW_MOB_LAYER
	light_outer_range = 2
	light_power = 1
	light_color = "#0d7f00"
	var/last_alert = 0

/obj/machinery/fake_powered/cloning_pod/check_fake_power()
	//no icon changes but instead emit green light
	var/area/current_area = get_area(src)
	if(current_area.fake_power)
		toggled = TRUE
		playsound(loc, 'sound/foley/industrial/loadin.ogg', 100)
		balloon_alert_to_viewers("whirrs to life.")
		set_light_on(TRUE)
	else
		toggled = FALSE
		playsound(loc, 'sound/foley/industrial/loadout.ogg', 100)
		balloon_alert_to_viewers("dies down.")
		set_light_on(FALSE)

/obj/machinery/fake_powered/cloning_pod/update_icon(updates)
	. = ..()
	switch(GLOB.global_biomass_storage)
		if(0 to 0.24)
			icon_state = "cell_0"
		if(0.25 to 0.49)
			icon_state = "cell_25"
		if(0.50 to 0.74)
			icon_state = "cell_50"
		if(0.75 to 0.99)
			icon_state = "cell_75"
		if(1 to INFINITY)
			icon_state = "cell_100"

/obj/machinery/fake_powered/cloning_pod/examine(mob/user)
	. = ..()
	. += "<span class='warning'>There is enough biomass to make [GLOB.global_biomass_storage] bodies.</span>"

/obj/machinery/fake_powered/cloning_pod/Initialize(mapload, ...)
	. = ..()
	GLOB.cloning_bays += src

/obj/machinery/fake_powered/cloning_pod/Destroy()
	. = ..()
	GLOB.cloning_bays -= src

/obj/machinery/fake_powered/cloning_pod/proc/send_manual_alert()
	if(!toggled)
		return
	update_icon()
	playsound(loc, 'sound/foley/industrial/machineoff.ogg', 50, FALSE, -1)
	say("ALERT. A saved mind is trying to reclone, but there is Insufficent biomass stored!", language = /datum/language/ancient_english)

/obj/machinery/fake_powered/cloning_pod/process()
	. = ..()
	if(!toggled)
		return
	if(world.time < last_alert+30 SECONDS)
		return
	if(GLOB.global_biomass_storage > 1)
		return
	last_alert = world.time
	playsound(loc, 'sound/foley/industrial/pneumatic1.ogg', 50, FALSE, -1)
	say("Warning; Insufficent biomass stored.", language = /datum/language/ancient_english)


//limb regrower (cannibals)
/obj/structure/closet/crate/coffin/limb_regrower
	name = "MEAT GOD"
	icon = 'modular_whisper/icons/misc/machines.dmi'
	icon_state = "regrower"
	desc = "An old world limb-regrower, likely made to assist soldiers who lost their limbs, now a horrible cannibal food machine... Turns one's blood into living tissue, medical care advised. Takes almost all of one's blood for a single limb. Healthy victims can be put here to add into blood storage of the machine."
	anchored = TRUE
	var/blood_stored = 0
	var/working = FALSE

/obj/structure/closet/crate/coffin/limb_regrower/examine(mob/user)
	. = ..()
	user.visible_message("This has [blood_stored] units blood stored, 750 units required for a single limb.")

/obj/structure/closet/crate/coffin/limb_regrower/open(mob/living/user)
	if(working)
		balloon_alert_to_viewers("Working.")
		return
	. = ..()
	update_icon_state()

/obj/structure/closet/crate/coffin/limb_regrower/close(mob/living/user)
	. = ..()
	update_icon_state()
	for(var/mob/living/carbon/human/victim in contents)
		if(victim.stat != DEAD)
			var/cost = 0
			var/static/list/body_zones = list(
				BODY_ZONE_HEAD,
				BODY_ZONE_CHEST,
				BODY_ZONE_L_ARM,
				BODY_ZONE_R_ARM,
				BODY_ZONE_L_LEG,
				BODY_ZONE_R_LEG,
			)
			for(var/body_zone in body_zones)
				var/obj/item/bodypart/bodypart = victim.get_bodypart(body_zone)
				if(!bodypart)
					cost += 750
					continue
			playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
			say("Live subject confirmed, starting operation, approximate blood required for full restoration: [cost]", language = /datum/language/ancient_english)
			playsound(src.loc, 'sound/items/beartrap.ogg', 100, TRUE, -1)
			to_chat(victim, span_red("A metal restraint snap on me!"))
			victim.SetParalyzed(3 SECONDS)
		sleep(1 SECONDS)
		regrowing_cycle(victim)

/obj/structure/closet/crate/coffin/limb_regrower/attackby(obj/item/I, mob/user, params)
	. = ..()
	if(istype(I, /obj/item/reagent_containers/blood))
		var/obj/item/reagent_containers/blood/bpack = I
		blood_stored += bpack.reagents.get_reagent_amount(/datum/reagent/blood)
		qdel(I)
		playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
		say("Added bloodpack into reserves.", language = /datum/language/ancient_english)

/obj/structure/closet/crate/coffin/limb_regrower/proc/regrowing_cycle(mob/living/carbon/human/victim)
	if(victim.loc != contents)
		working = FALSE
		return
	var/cost = 0
	var/static/list/body_zones = list(
		BODY_ZONE_HEAD,
		BODY_ZONE_CHEST,
		BODY_ZONE_L_ARM,
		BODY_ZONE_R_ARM,
		BODY_ZONE_L_LEG,
		BODY_ZONE_R_LEG,
	)
	for(var/body_zone in body_zones)
		var/obj/item/bodypart/bodypart = victim.get_bodypart(body_zone)
		if(!bodypart)
			cost += 750
	playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
	say("[cost] units of blood required for full restoration.", language = /datum/language/ancient_english)
	if(victim.blood_volume > BLOOD_VOLUME_SURVIVE)
		victim.SetParalyzed(2.5 SECONDS)
		blood_stored += 125
		victim.blood_volume -= 125
		sleep(2 SECONDS)
		if(victim.loc != contents) //incase they moved while sleep.
			working = FALSE
			return
		regrowing_cycle()
	else if(victim.blood_volume < BLOOD_VOLUME_SURVIVE)
		playsound(loc, 'sound/misc/machineno.ogg', 100, FALSE, -1)
		say("Victim lacks sufficent blood, so does the reserves. Medical care advised.", language = /datum/language/ancient_english)
		if(!opened)
			open()
		victim.SetParalyzed(2 SECONDS)
	if(blood_stored > cost && cost > 0)
		working = TRUE
		victim.SetParalyzed(2.5 SECONDS)
		playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
		say("Attempting restoration.", language = /datum/language/ancient_english)
		sleep(2 SECONDS)
		if(victim.loc != contents) //incase they moved while sleep.
			working = FALSE
			return
		victim.SetParalyzed(2.5 SECONDS)
		for(var/body_zone in body_zones)
			var/obj/item/bodypart/bodypart = victim.get_bodypart(body_zone)
			if(!bodypart)
				if(blood_stored > 750)
					blood_stored -= 750
					say("[bodypart.name] grown, attaching.", language = /datum/language/ancient_english)
					victim.regenerate_limb(bodypart.body_zone, FALSE)
					playsound(loc, 'sound/misc/guillotine.ogg', 50, TRUE, -1)
					sleep(1 SECONDS)
					if(victim.loc != contents) //incase they moved while sleep.
						break
					working = FALSE
				else
					working = FALSE
					regrowing_cycle()
					break

//fluff ice chest
/obj/structure/closet/crate/chest/neu_iron/refrigerated
	name = "refrigerated chest"
	desc = "a refrigerated chest."


//biomass chute
/obj/structure/closet/crate/coffin/bio_chute
	name = "corpse disposal"
	icon = 'modular_whisper/icons/misc/machines.dmi'
	icon_state = "chute"
	desc = "body goes in, money comes out."
	var/working = FALSE

/obj/structure/closet/crate/coffin/bio_chute/open(mob/living/user)
	if(working)
		balloon_alert_to_viewers("Working.")
		return
	. = ..()
	update_icon_state()


/obj/structure/closet/crate/coffin/bio_chute/close(mob/living/user)
	. = ..()
	update_icon_state()
	working = TRUE
	for(var/mob/living/carbon/human/content in contents)
		var/mob/living/carbon/human/victim = content
		var/money_to_give = 10 //for emptied torso alone base.
		for(var/obj/item/bodypart/skellybones in victim.bodyparts)
			if(skellybones.skeletonized || skellybones.rotted)
				money_to_give -= 10
			else
				money_to_give += 10 //healthy limb in there.
			continue
		for(var/obj/item/organ/organie in victim.internal_organs)
			money_to_give += 10 //organ in there.
			continue
		if(!SStreasury.give_money_account(money_to_give, user, "+[money_to_give] from [victim.name] body disposal."))
			say("No bank account, idiot.")
		sleep(2 SECONDS)
		playsound(loc, 'sound/misc/disposalflush.ogg', 100, FALSE, -1)
		var/obj/structure/bio_chute_exit/exit_loc = pick(GLOB.biochute_exit)
		content.Entered(exit_loc)
		playsound(exit_loc.loc, 'sound/misc/disposalflush.ogg', 100, FALSE, -1)
		working = FALSE

//biomass chute exit
/obj/structure/bio_chute_exit
	name = "corpse disposal exit"
	icon = null
	desc = "body comes out."
	density = FALSE

/obj/structure/bio_chute_exit/Initialize()
	. = ..()
	GLOB.biochute_exit += src

/obj/structure/bio_chute_exit/Destroy()
	. = ..()
	GLOB.biochute_exit -= src
