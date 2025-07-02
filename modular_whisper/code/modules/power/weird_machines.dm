/obj/machinery/fake_powered/biofabricator
	name = "Fake Fabricator"
	icon = 'modular_whisper/icons/misc/machines.dmi'
	var/biomass_amount = 0
	var/produced_thing = null

/obj/machinery/fake_powered/biofabricator/examine(mob/user)
	. = ..()
	user.visible_message("This produces [produced_thing] per biomass, and has [biomass_amount] biomass stored.")

//solvent fab
/obj/machinery/fake_powered/biofabricator/solvent
	name = "Solvent Fabricator"
	icon_state = "biofab_solvent"
	desc = "A horrible machine of old desperativeness, turns natural matter into yucky but edible paste for the masses..."
	produced_thing = /obj/item/reagent_containers/food/snacks/raisins/solvent

/obj/item/reagent_containers/food/snacks/raisins/solvent
	name = "solvent bar"
	icon = 'modular_whisper/icons/items/produce.dmi'
	icon_state = "solvent"
	base_icon_state = "solvent"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_NUTRITIOUS)
	tastes = list("dog shit" = 1)
	foodtype = MEAT | CANNIBAL
	faretype = FARE_IMPOVERISHED

/obj/item/reagent_containers/food/snacks/raisins/Initialize(mapload)
	. = ..()
	color = pick(COLOR_GREEN,COLOR_RED,COLOR_BLUE,COLOR_PURPLE,COLOR_BEIGE,COLOR_ORANGE,null)

/obj/machinery/fake_powered/biofabricator/solvent_fabricator/attackby(obj/item/I, mob/user, params)
	. = ..()
	user.changeNext_move(CLICK_CD_FAST)
	if(toggled)
		if (istype(I, /obj/item/natural/poo))
			biomass_amount += 2
			qdel(I)
		else if (istype(I, /obj/item/compost))
			biomass_amount += 3
			qdel(I)
		else if (istype(I, /obj/item/reagent_containers/food))
			var/obj/item/reagent_containers/food/foodie = I
			biomass_amount += foodie.faretype
			qdel(I)
		else if (istype(I, /obj/item/organ))
			biomass_amount += 5
			qdel(I)
		else if (istype(I, /obj/item/bodypart))
			biomass_amount += 6
			qdel(I)
		else
			say("Not workable.", language = /datum/language/ancient_english)
			playsound(loc, 'sound/misc/machineno.ogg', 100, FALSE, -1)
	else
		balloon_alert_to_viewers("Unpowered.")

/obj/machinery/fake_powered/biofabricator/solvent_fabricator/attack_right(mob/user)
	. = ..()
	if(!toggled)
		balloon_alert_to_viewers("Unpowered.")
		return
	if(!biomass_amount)
		playsound(loc, 'sound/misc/machineno.ogg', 100, FALSE, -1)
		say("Nothing found in compartment.", language = /datum/language/ancient_english)
		return
	playsound(loc, 'sound/misc/keyboard_enter.ogg', 100, TRUE, -1)
	start_processing_solvent()

/obj/machinery/fake_powered/biofabricator/solvent_fabricator/proc/start_processing_solvent()
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
GLOBAL_LIST_EMPTY(global_biomass_storage)

/obj/structure/closet/crate/coffin/biomass_recycler
	name = "Biomass Recycler"
	icon_state = "biomass_recycler"
	desc = "Another byproduct of world ending war, generally used to turn emptied corpses or food into material for recloning or limb regrowers."
	anchored = TRUE

/obj/structure/closet/crate/coffin/biomass_recycler/close(mob/living/user)
	. = ..()
	for(var/content in contents)
		sleep(2 SECONDS)
		playsound(loc, 'sound/misc/guillotine.ogg', 50, TRUE, -1)
		sleep(2 SECONDS)
		playsound(loc, 'sound/misc/guillotine.ogg', 50, TRUE, -1)
		sleep(2 SECONDS)
		playsound(loc, 'sound/misc/guillotine.ogg', 50, TRUE, -1)
		sleep(2 SECONDS)
		if(istype(content, /mob/living/carbon/human))
			var/mob/living/carbon/human/victim = content
			var/points_to_give = 0.5 //for emptied torso alone base.
			for(var/obj/item/bodypart/skellybones in victim.bodyparts)
				if(skellybones.skeletonized || skellybones.rotted)
					points_to_give -= 0.1 //fucked ass limb takes from quality.
					playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
					say("Bad [skellybones], some biomass was lost due contamination.", language = /datum/language/ancient_english)
				else
					points_to_give += 0.1 //healthy limb in there.
			for(var/obj/item/organ/organie in victim.internal_organs)
				points_to_give += 0.1 //organ in there.
			GLOB.global_biomass_storage += max(points_to_give,0.1)
			victim.gib(TRUE,TRUE,TRUE)
			continue
		else if(istype(content, /obj/item/reagent_containers/food))
			var/obj/item/reagent_containers/food/victim = content
			GLOB.global_biomass_storage += victim.faretype * 0.05 //it takes alot to remake a man.
			qdel(victim)
			continue
		else if(istype(content, /obj/item/grown/log/tree/small))
			GLOB.global_biomass_storage += 0.075
			qdel(content)
			continue
		else if(istype(content, /obj/item/grown/log/tree/stick))
			GLOB.global_biomass_storage += 0.025
			qdel(content)
			continue
		else if(istype(content, /mob/living/simple_animal))
			var/mob/living/simple_animal/victim = content
			victim.gib(TRUE,TRUE,TRUE)
			GLOB.global_biomass_storage += 0.3 //Animals dont translate that well.
			playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
			say("Animal matter is difficult to process and yields less therefore.", language = /datum/language/ancient_english)
			continue
		else
			playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
			say("Nothing processable is left.", language = /datum/language/ancient_english)
			break

/obj/structure/closet/crate/coffin/liquid_drainer
	name = "Liquid Drainer"
	icon_state = "liquid_drainer"
	desc = "Likely used to supply blood for the warriors of the great war of old, now it has other purposes aswell, thanks to modifications. Drains all of the blood and other fluids of living and the dead, leaving them weakened and likely to die without aid."
	anchored = TRUE

/obj/structure/closet/crate/coffin/liquid_drainer/Initialize()
	. = ..()
	create_reagents(2000)

/obj/structure/closet/crate/coffin/liquid_drainer/close(mob/living/user)
	. = ..()
	for(var/mob/living/carbon/human/victim in contents)
		if(victim.age == AGE_CHILD)
			say("ALERT! War crime detected: Harvesting of Children... Process halted... Error, Failed to send alert to united nations confederation, no connection available.", language = /datum/language/ancient_english)
			open()
			return
		if(victim.stat != DEAD)
			playsound(loc, 'sound/misc/machinelong.ogg', 100, FALSE, -1)
			say("Live subject detected, Government identification database connection unavailable, foreigner precautionary pacification measures activated alongside stimulative blood-pumping increasers.", language = /datum/language/ancient_english)
			playsound(src.loc, 'sound/items/beartrap.ogg', 100, TRUE, -1)
			victim.visible_message(span_red("A metal restraint snap to my neck and limbs, holding me in place!"))
			victim.SetParalyzed(3 SECONDS)
			sleep(0.5 SECONDS)
			victim.visible_message(span_red("I feel several stings on my back!"))
			sleep(0.3 SECONDS)
			victim.visible_message(span_red("something starts working my [user.gender == MALE ? "shaft" : "pussy"] violently..!"))
			if(victim.gender == MALE)
				start_obj_sex(MALE, victim, /datum/sex_action/npc_blowjob, SEX_FORCE_EXTREME, SEX_FORCE_MAX)
			else
				start_obj_sex(FEMALE, victim, /datum/sex_action/npc_vaginal_sex, SEX_FORCE_EXTREME, SEX_FORCE_MAX)
			break
		sleep(1 SECONDS)
		suckening_cycle(victim)

/*if all fails try this ghetto way
/obj/structure/closet/crate/coffin/liquid_drainer/process()
	. = ..()
	if(!opened)
		to_chat(host, "<span class='warning'>[host] is rubbed by a skeletal hand!</span>")
		playsound(get_turf(host), pick('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 100, FALSE, -1)
		target.sexcon.perform_sex_action(host, pleasure*mult*3, 0, TRUE)
*/

/obj/structure/closet/crate/coffin/liquid_drainer/proc/suckening_cycle(mob/living/carbon/human/victim)
	if(victim.blood_volume >= 0 && !opened && victim.loc == loc)
		if(victim.stat != DEAD)
			victim.SetParalyzed(4 SECONDS)
			sleep(3 SECONDS)
		else
			sleep(6 SECONDS) //corpses have no heartbeat to help
		victim.transfer_blood_to(src, 50, TRUE)
		suckening_cycle()
	else if(reagents.total_volume >= reagents.maximum_volume)
		playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
		say("Blood tank is full and must be emptied before proceeding.", language = /datum/language/ancient_english)
		stop_obj_sex()
		if(!opened)
			open()
	else if(victim.blood_volume <= 0)
		victim.apply_status_effect(/datum/status_effect/debuff/blood_drained)
		victim.add_stress(/datum/mood_event/blood_drained)
		playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
		say("No blood remaining in subject.", language = /datum/language/ancient_english)
		stop_obj_sex()
		if(!opened)
			open()
	else if(!victim.loc == loc)
		playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
		say("Stopping, Subject not found.", language = /datum/language/ancient_english)
		stop_obj_sex()
		if(!opened)
			open()

/obj/structure/closet/crate/coffin/liquid_drainer/attack_right(mob/user)
	. = ..()
	playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
	say("Dispensing blood pack.", language = /datum/language/ancient_english)
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
//wip
/obj/machinery/fake_powered/cloning_pod
	name = "Automated Cloning Pod"
	desc = "Used to reclone people and defy old gods' way. Recloning is costly and tend to put people in debt to the kingdom."
	icon = 'modular_whisper/icons/misc/machines.dmi'
	icon_state = "clonepod"
	var/last_alert = 0

/obj/machinery/fake_powered/cloning_pod/examine(mob/user)
	. = ..()
	. += "<span class='warning'>There is enough biomass to make [GLOB.global_biomass_storage] bodies.</span>"

/obj/machinery/fake_powered/cloning_pod/Initialize(mapload, ...)
	. = ..()
	GLOB.cloning_bays += src

/obj/machinery/fake_powered/cloning_pod/proc/send_manual_alert()
	if(!toggled)
		return
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
