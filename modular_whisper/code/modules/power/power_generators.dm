//GENERATORS
//NUCLEAR GENERATOR, FREE ENERGY
/obj/machinery/mini_nuclear_generator
	name = "Nuclear generator"
	icon = 'modular_whisper/icons/misc/machines.dmi'
	icon_state = "nuclear"
	desc = "A mysterious old world machine capable of remotely making every ancient tech in the area start working again."
	var/toggled = FALSE
	var/datum/looping_sound/streetlamp1/soundloop

/obj/machinery/mini_nuclear_generator/Initialize(mapload, ...)
	. = ..()
	soundloop = new(src, FALSE)
	GLOB.nuclear_generators += src
	if(mapload)
		toggle_power() //turn on by yourself at roundstart ig.

/obj/machinery/mini_nuclear_generator/Destroy()
	GLOB.nuclear_generators -= src
	if(toggled)
		var/area/current_area = get_area(src)
		current_area.basic_power = max(0, current_area.basic_power-1)
		SEND_SIGNAL(current_area, COMSIG_POWER_UPDATE)
		for(var/obj/machinery/power_relay/power_checker in GLOB.power_relays)
			power_checker.power_available = max(0, power_checker.power_available-1)
			power_checker.on_power_update(power_checker, get_area(power_checker))
	if(soundloop)
		QDEL_NULL(soundloop)
	explosion(loc, GLOB.MAX_EX_DEVESTATION_RANGE, GLOB.MAX_EX_HEAVY_RANGE, GLOB.MAX_EX_LIGHT_RANGE, GLOB.MAX_EX_FLASH_RANGE)
	. = ..()

/obj/machinery/mini_nuclear_generator/can_be_unfasten_wrench(mob/user, silent)
	to_chat(user, "<span class='warning'>[src] is too complex to move!</span>")
	return FAILED_UNFASTEN

/obj/machinery/mini_nuclear_generator/attack_hand(mob/living/user)
	. = ..()
	toggle_power()

/obj/machinery/mini_nuclear_generator/proc/toggle_power()
	toggled = !toggled
	var/area/current_area = get_area(src)
	if(toggled)
		soundloop.start()
		current_area.basic_power += 1 //hopefully should handle multiples
		playsound(loc, 'sound/foley/industrial/loadin.ogg', 100)
		icon_state = "[initial(icon_state)]_on"
		for(var/obj/machinery/power_relay/power_checker in GLOB.power_relays)
			power_checker.power_available += 1
			power_checker.on_power_update(power_checker, get_area(power_checker))
	else
		soundloop.stop()
		current_area.basic_power = max(0, current_area.basic_power-1)
		playsound(loc, 'sound/foley/industrial/loadout.ogg', 100)
		icon_state = "[initial(icon_state)]_off"
		for(var/obj/machinery/power_relay/power_checker in GLOB.power_relays)
			power_checker.power_available = max(0, power_checker.power_available-1)
			power_checker.on_power_update(power_checker, get_area(power_checker))
	SEND_SIGNAL(current_area, COMSIG_POWER_UPDATE)

//RELAYS FOR NUCLEAR GENERATORS
//relay
/obj/machinery/power_relay
	name = "Power Relay"
	icon = 'modular_whisper/icons/misc/machines.dmi'
	icon_state = "relay_off"
	desc = "A power relay capable of sending nuclear power to other parts of the land."
	var/toggled = TRUE
	var/power_available = 0
	var/last_power = 0

/obj/machinery/power_relay/can_be_unfasten_wrench(mob/user, silent)
	to_chat(user, "<span class='warning'>[src] is too complex to move!</span>")
	return FAILED_UNFASTEN

/obj/machinery/power_relay/update_icon_state()
	. = ..()
	if(power_available && toggled)
		icon_state = "relay_on"
	else if(!power_available || !toggled)
		icon_state = "relay_off"

/obj/machinery/power_relay/Initialize()
	. = ..()
	GLOB.power_relays += src
	on_power_update(src, get_area(src))
	update_appearance(UPDATE_ICON_STATE)

/obj/machinery/power_relay/Destroy()
	GLOB.power_relays -= src
	var/area/current_area = get_area(src)
	if(power_available && toggled)
		current_area.basic_power = max(0, current_area.basic_power-1)
	SEND_SIGNAL(current_area, COMSIG_POWER_UPDATE)
	. = ..()

/obj/machinery/power_relay/attack_hand(mob/living/user)
	. = ..()
	toggled = !toggled
	if(toggled)
		balloon_alert_to_viewers("toggled on")
		playsound(loc, 'sound/foley/industrial/loadin.ogg', 100)
	else
		balloon_alert_to_viewers("toggled off")
		playsound(loc, 'sound/foley/industrial/loadout.ogg', 100)
	on_power_update(src, get_area(src))

/obj/machinery/power_relay/on_power_update(datum/sauce, area/current_area)
	//We dont add more than one unit of power even if we got more than 1 available. In case of some cursed situation where we got two reactors or something.
	if(!power_available && last_power && toggled) //looks like we lost power from the reactor, but we had power and were giving it out.
		current_area.basic_power = max(0, current_area.basic_power-1)
	else if(power_available) //we got power, now toggles determine if we emit power.
		if(last_power >= power_available && !toggled && (power_available < 2 && last_power < 2)) //toggled off, we got less power than before.
			current_area.basic_power = max(0, current_area.basic_power-1)
		else if(last_power <= power_available && toggled && (power_available < 2 && last_power < 2)) //toggled on, we got more power than before
			current_area.basic_power += 1
	update_appearance(UPDATE_ICON_STATE)
	last_power = power_available
	SEND_SIGNAL(current_area, COMSIG_POWER_UPDATE)


//SEX GENERATOR
/obj/structure/chair/sexgenerator
	name = "Senerator"
	icon = 'modular_whisper/icons/misc/chairs.dmi'
	icon_state = "milker_gen"
	desc = "Looks like a one of a kind fire painted, battery attached milker-generator hybrid rigged into a shitty sex power machine, \
	a sick invention of someone horny that somehow works... \
	...However it does NOT look waterproof...."
	anchored = TRUE
	item_chair = null
	var/toggled = FALSE
	var/charge_stored = 0
	var/max_charge = 10000
	var/charge_amt
	var/datum/looping_sound/streetlamp1/soundloop

/obj/structure/chair/sexgenerator/Initialize(mapload, ...)
	. = ..()
	soundloop = new(src, FALSE)

/obj/structure/chair/sexgenerator/examine(mob/user)
	. = ..()
	. += "The power gauge shows it is [(charge_stored/max_charge)*100]% charged."

/obj/structure/chair/sexgenerator/process()
	if(!toggled)
		return
	charge_stored -= 1
	if(!charge_stored)
		balloon_alert_to_viewers("Powers down.")
		toggle_power()

/obj/structure/chair/sexgenerator/Destroy()
	if(toggled)
		var/area/current_area = get_area(src)
		current_area.basic_power = max(0, current_area.basic_power-1)
		SEND_SIGNAL(current_area, COMSIG_POWER_UPDATE)
	if(soundloop)
		QDEL_NULL(soundloop)
	. = ..()

/obj/structure/chair/sexgenerator/attack_hand_secondary(mob/user)
	if(!charge_stored)
		balloon_alert_to_viewers("No charge.")
		playsound(loc, 'sound/foley/industrial/loadout.ogg', 100)
		return
	toggle_power()

/obj/structure/chair/sexgenerator/proc/toggle_power()
	toggled = !toggled
	var/area/current_area = get_area(src)
	if(toggled)
		START_PROCESSING(SSprocessing, src)
		soundloop.start()
		current_area.basic_power += 1 //hopefully should handle multiples
		playsound(loc, 'sound/foley/industrial/loadin.ogg', 100)
		icon_state = "milker_gen_on"
	else
		STOP_PROCESSING(SSprocessing, src)
		soundloop.stop()
		current_area.basic_power = max(0, current_area.basic_power-1)
		playsound(loc, 'sound/foley/industrial/loadout.ogg', 100)
		icon_state = "milker_gen"
	SEND_SIGNAL(current_area, COMSIG_POWER_UPDATE)

/obj/structure/chair/sexgenerator/post_buckle_mob(mob/living/M)
	. = ..()
	charge_amt = 0
	for(var/mob/living/carbon/human/victim in buckled_mobs)
		if(victim.age == AGE_CHILD)
			say("ALERT! too young, aborting...")
			log_admin("Someone tried to milk a child ([victim])!")
			unbuckle_mob(victim)
			return
		playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
		say("Analyzing BITCH specifications...")
		sleep(1 SECONDS)
		if(!length(buckled_mobs)) //incase they moved while sleep.
			return
		if(victim.stat == DEAD)
			playsound(loc, 'sound/misc/machineno.ogg', 100, FALSE, -1)
			say("The BITCH is dead, YOU DUMB FUCK.")
			return
		addtimer(CALLBACK(src, PROC_REF(suckening_cycle), victim), 1 SECONDS, TIMER_STOPPABLE) //so the parent proc can keep going.
		if(!victim.wear_pants || victim.wear_pants.genital_access)
			if(victim.getorganslot(ORGAN_SLOT_PENIS))
				sleep(0.3 SECONDS)
				victim.visible_message(span_love("[victim] starts to thrust into the machine's apparatus."), span_red("I start to thrust into the machine's apparatus."))
				addtimer(CALLBACK(src, PROC_REF(start_obj_sex), victim, SEX_SPEED_EXTREME, SEX_FORCE_MID, FALSE, ORGAN_SLOT_PENIS), 0.1 SECONDS, TIMER_STOPPABLE)
				charge_amt += 20
			if(victim.getorganslot(ORGAN_SLOT_VAGINA))
				sleep(0.3 SECONDS)
				victim.visible_message(span_love("[victim] starts to bounce their pussy on the machine's phallus."), span_red("I start to bounce my pussy on the machine's phallus."))
				addtimer(CALLBACK(src, PROC_REF(start_obj_sex), victim, SEX_SPEED_EXTREME, SEX_FORCE_MID, FALSE, ORGAN_SLOT_VAGINA), 0.2 SECONDS, TIMER_STOPPABLE)
				charge_amt += 20
			if(victim.gender == FEMALE)
				sleep(0.3 SECONDS)
				victim.visible_message(span_love("[victim] starts to bounce their ass on the machine's phallus."), span_red("I start to bounce my ass on the machine's phallus."))
				addtimer(CALLBACK(src, PROC_REF(start_obj_sex), victim, SEX_SPEED_EXTREME, SEX_FORCE_MID, FALSE, ORGAN_SLOT_GUTS), 0.3 SECONDS, TIMER_STOPPABLE)
				charge_amt += 20
		else
			playsound(loc, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
			say("Obstruction on FUCKHOLES detected,  THIS FUCKING THING IS not DOABLE.")

/obj/structure/chair/sexgenerator/proc/suckening_cycle(mob/living/carbon/human/victim)
	if(!length(buckled_mobs)) //incase they moved while sleep.
		return
	if(toggled && prob(10)) //lets go gambling.
		playsound(get_turf(src), pick('sound/misc/elec (1).ogg', 'sound/misc/elec (2).ogg', 'sound/misc/elec (3).ogg'), 50, FALSE)
		balloon_alert_to_viewers("Zaps [victim]!")
		victim.emote("painscream")
		victim.SetParalyzed(2 SECONDS)
		victim.electrocution_animation(2 SECONDS)
		victim.apply_damage(15, BURN, BODY_ZONE_PRECISE_GROIN, FALSE)
		charge_stored = max(0, charge_stored-20)
	charge_stored = min(charge_stored+charge_amt, max_charge)
	if(charge_stored == max_charge)
		balloon_alert_to_viewers("Fully charged!")
	addtimer(CALLBACK(src, PROC_REF(suckening_cycle), victim), 1 SECONDS, TIMER_STOPPABLE)
