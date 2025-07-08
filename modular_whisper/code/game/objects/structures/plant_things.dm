/obj/structure/glowshroom
	name = "glowshroom"
	desc = "the actually liked sibling of kneestingers."
	anchored = TRUE
	opacity = 0
	max_integrity = 10
	density = FALSE
	icon = 'icons/roguetown/misc/foliage.dmi'
	icon_state = "glowshroom1" //replaced in New
	color = "#00fffb"
	layer = ABOVE_NORMAL_TURF_LAYER
	max_integrity = 30
	blade_dulling = DULLING_CUT
	resistance_flags = FLAMMABLE
	debris = list(/obj/item/natural/fibers = 1)

/obj/structure/glowshroom/fire_act(added, maxstacks)
	visible_message(span_warning("[src] catches fire!"))
	var/turf/T = get_turf(src)
	qdel(src)
	new /obj/effect/hotspot(T)

/obj/structure/glowshroom/New(loc, obj/item/neuFarm/seed/newseed, mutate_stats)
	..()
	set_light(1.5, 1.5, "#00fffb")
	if(icon_state == "glowshroom1" )
		icon_state = "glowshroom[rand(1,3)]"
		pixel_x = rand(-4, 4)
		pixel_y = rand(0,5)
	else
		pixel_x = rand(-2, 2)
		pixel_y = rand(0,2)

/obj/structure/glowshroom/play_attack_sound(damage_amount, damage_type = BRUTE, damage_flag = 0)
	if(damage_type == BURN && damage_amount)
		playsound(src.loc, 'sound/blank.ogg', 100, TRUE)

/obj/structure/glowshroom/temperature_expose(exposed_temperature, exposed_volume)
	if(exposed_temperature > 300)
		take_damage(5, BURN, 0, 0)

/obj/structure/glowshroom/acid_act(acidpwr, acid_volume)
	. = 1
	visible_message(span_danger("[src] melts away!"))
	var/obj/effect/decal/cleanable/molten_object/I = new (get_turf(src))
	I.desc = ""
	qdel(src)

/obj/structure/glowshroom/Destroy()
	var/datum/reagents/R = new/datum/reagents(25)
	R.my_atom = src
	R.add_reagent(/datum/reagent/toxin/berrypoison, 25)
	var/datum/effect_system/smoke_spread/chem/smoke = new
	smoke.set_up(R, 6, get_turf(src), FALSE)
	smoke.start()
	. = ..()

/obj/structure/glowshroom/decaying
/obj/structure/glowshroom/decaying/Initialize()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(stingers_decay)), 5 MINUTES)
	icon_state = "glowshroom_A[rand(1,3)]"

/obj/structure/glowshroom/decaying/proc/stingers_decay()
	playsound(src,"plantcross", 100, FALSE)
	icon_state = "[icon_state]_dying"
	sleep(5)
	Destroy()


//maneater but sex
/obj/structure/flora/grass/maneater/elfbane
	color = "#9fe5ff"

/obj/structure/flora/grass/maneater/real/elfbane
	color = "#9fe5ff"
	var/is_fucking = FALSE

/obj/structure/flora/grass/maneater/real/elfbane/update_icon()
	. = ..()
	if(obj_broken)
		name = "ELFBANE"
		desc = "This cunning creature is thankfully defeated." // i think this might break, dunno
		icon_state = "maneater-dead"
		return
	if(aggroed)
		name = "ELFBANE"
		desc = "Rare even more mutated maneater that feeds on fluids of people rather than meat. Named after elves' ironic hate towards it."
		icon_state = "maneater"
	else
		name = "grass"
		desc = initial(desc)
		icon_state = "maneater-hidden"

/obj/structure/flora/grass/maneater/real/elfbane/process()
	if(seednutrition >= max_seednutrition)
		produce_seed()
		seednutrition = 0
	if(!has_buckled_mobs())
		if(world.time > last_eat + 50)
			var/list/around = view(1, src)
			for(var/mob/living/M in around)
				HasProximity(M)
				return
			for(var/obj/item/F in around)
				if(is_type_in_list(F, eatablez))
					aggroed = world.time
					last_eat = world.time
					playsound(src,'sound/misc/eat.ogg', rand(30,60), TRUE)
					qdel(F)
					seednutrition += 10
					return
		if(world.time > aggroed + 30 SECONDS)
			aggroed = 0
			update_icon()
			STOP_PROCESSING(SSobj, src)
			return TRUE
	for(var/mob/living/L in buckled_mobs)
		if(world.time > last_eat + 30)
			last_eat = world.time
			playsound(src.loc, list('sound/vo/mobs/plant/attack (1).ogg','sound/vo/mobs/plant/attack (2).ogg','sound/vo/mobs/plant/attack (3).ogg','sound/vo/mobs/plant/attack (4).ogg'), 100, FALSE, -1)
			if(!L.mind || !iscarbon(L)) // we got no business with mindless fuckos
				maneater_spit_out(L)
				return
			if(!is_fucking)
				var/mob/living/carbon/C = L
				is_fucking = TRUE
				visible_message(span_love("[src]'s injects [L] with a tendril!"), span_red("I feel a sting on my arm!"))
				L.reagents.add_reagent(/datum/reagent/medicine/soporpot, 30)
				if(L.getorganslot(ORGAN_SLOT_BREASTS))
					visible_message(span_love("[src]'s tendrils latch onto [L]'s breasts!"), span_red("I feel tendrils suck on my breasts!"))
				if(L.getorganslot(ORGAN_SLOT_PENIS))
					visible_message(span_love("[src]'s tendrils engulf [L]'s shaft!"), span_red("I feel a wet tendril around my shaft..!"))
					addtimer(CALLBACK(src, PROC_REF(start_obj_sex), L, SEX_SPEED_EXTREME, SEX_FORCE_HIGH, TRUE, ORGAN_SLOT_PENIS, /datum/reagent/consumable/cum/plant, 5), 0.1 SECONDS, TIMER_STOPPABLE)
				if(L.getorganslot(ORGAN_SLOT_VAGINA))
					visible_message(span_love("[src]'s tendrils slam inside [L]'s pussy!"), span_red("a tendril slams in my pussy violently..!"))
					addtimer(CALLBACK(src, PROC_REF(start_obj_sex), L, SEX_SPEED_EXTREME, SEX_FORCE_HIGH, TRUE, ORGAN_SLOT_VAGINA, /datum/reagent/consumable/cum/plant, 5), 0.1 SECONDS, TIMER_STOPPABLE)
				if(L.getorganslot(ORGAN_SLOT_GUTS) && C.gender == FEMALE) //no good way of knowing their prefs so imma just make it non homo.
					visible_message(span_love("[src]'s tendrils slam inside [L]'s ass!"), span_red("a tendril slams in my ass violently..!"))
					addtimer(CALLBACK(src, PROC_REF(start_obj_sex), L, SEX_SPEED_EXTREME, SEX_FORCE_HIGH, TRUE, ORGAN_SLOT_GUTS, /datum/reagent/consumable/cum/plant, 5), 0.1 SECONDS, TIMER_STOPPABLE)
				if(C.gender == FEMALE)
					visible_message(span_love("[src]'s tendrils slam inside [L]'s throat!"), span_red("a tendril slams in my mouth..!"))
					addtimer(CALLBACK(src, PROC_REF(start_obj_sex), L, SEX_SPEED_EXTREME, SEX_FORCE_HIGH, TRUE, "mouth", /datum/reagent/consumable/cum/plant, 5), 0.1 SECONDS, TIMER_STOPPABLE)
			else
				var/liquids_remaining = 0
				for(var/obj/item/organ/filling_organ/forgan in L.internal_organs)
					if(forgan.refilling && forgan.reagents) //gotta not get plant cum here.
						liquids_remaining += forgan.reagents.get_reagent_amount(forgan.reagent_to_make)
				if(liquids_remaining >= 30) //not a pathetic total remaining
					maneater_spit_out(L)
					return
				playsound(src, pick('modular_whisper/sound/gulp.ogg','modular_whisper/sound/slurp.ogg'), 50, TRUE, ignore_walls = FALSE) //funny noises
				var/obj/item/organ/filling_organ/breasts/boobers = L.getorganslot(ORGAN_SLOT_BREASTS)
				if(boobers)
					boobers.reagents.remove_reagent(boobers.reagent_to_make, boobers.reagents.maximum_volume/20)
					seednutrition += boobers.reagents.maximum_volume/20
