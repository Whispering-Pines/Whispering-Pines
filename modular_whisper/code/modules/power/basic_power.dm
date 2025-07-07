GLOBAL_LIST_EMPTY(fake_powered_machines)

//this is just cosmetic since i cant possibly return power code.
//this has a toggle which sets area as a ghetto powered state to be checked rather than having to search every tile of an area by machines.
/obj/machinery/mini_nuclear_generator
	name = "Nuclear generator"
	icon = 'modular_whisper/icons/misc/machines.dmi'
	icon_state = "nuclear"
	desc = "A mysterious old world machine capable of remotely making every ancient tech in the area start working again."
	var/toggled = FALSE

/obj/machinery/mini_nuclear_generator/Destroy()
	if(toggled)
		var/area/current_area = get_area(src)
		current_area.fake_power -= 1
		for(var/obj/machinery/fake_powered/power_checker in GLOB.fake_powered_machines)
			if(get_area(power_checker) == current_area)
				power_checker.check_fake_power()
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
		current_area.fake_power += 1 //hopefully should handle multiples
		playsound(loc, 'sound/foley/industrial/loadin.ogg', 100)
		icon_state = "[initial(icon_state)]_on"
		for(var/obj/machinery/fake_powered/power_checker in GLOB.fake_powered_machines)
			if(get_area(power_checker) == current_area)
				power_checker.check_fake_power()

	else
		current_area.fake_power -= 1
		playsound(loc, 'sound/foley/industrial/loadout.ogg', 100)
		icon_state = "[initial(icon_state)]_off"
		for(var/obj/machinery/fake_powered/power_checker in GLOB.fake_powered_machines)
			if(get_area(power_checker) == current_area)
				power_checker.check_fake_power()

//fake powered machine
/obj/machinery/fake_powered
	name = "Template fake power machine"
	icon = 'modular_whisper/icons/misc/machines.dmi'
	anchored = TRUE
	var/toggled = TRUE
	var/self_powered = FALSE

/obj/machinery/fake_powered/Initialize()
	. = ..()
	if(!self_powered)
		GLOB.fake_powered_machines += src
		check_fake_power()
	update_icon()

/obj/machinery/fake_powered/Destroy()
	if(!self_powered)
		GLOB.fake_powered_machines -= src
	. = ..()

/obj/machinery/fake_powered/proc/check_fake_power()
	var/area/current_area = get_area(src)
	if(current_area.fake_power)
		toggled = TRUE
		playsound(loc, 'sound/foley/industrial/loadin.ogg', 100)
		balloon_alert_to_viewers("whirrs to life.")
		icon_state = "[initial(icon_state)]_on"
	else
		toggled = FALSE
		playsound(loc, 'sound/foley/industrial/loadout.ogg', 100)
		balloon_alert_to_viewers("dies down.")
		icon_state = "[initial(icon_state)]_off"


//coffin type for lids
/obj/structure/closet/crate/coffin/fake_powered
	name = "Template lidded fake power machine"
	icon = 'modular_whisper/icons/misc/machines.dmi'
	anchored = TRUE
	var/toggled = TRUE
	var/working = FALSE
	var/self_powered = FALSE

/obj/structure/closet/crate/coffin/fake_powered/Initialize()
	. = ..()
	if(!self_powered)
		GLOB.fake_powered_machines += src
		check_fake_power()
	else
		toggled = TRUE
	update_icon()

/obj/structure/closet/crate/coffin/fake_powered/Destroy()
	if(!self_powered)
		GLOB.fake_powered_machines -= src
	. = ..()

/obj/structure/closet/crate/coffin/fake_powered/proc/check_fake_power()
	var/area/current_area = get_area(src)
	if(current_area.fake_power)
		toggled = TRUE
		playsound(loc, 'sound/foley/industrial/loadin.ogg', 100)
		balloon_alert_to_viewers("whirrs to life.")
	else
		toggled = FALSE
		playsound(loc, 'sound/foley/industrial/loadout.ogg', 100)
		balloon_alert_to_viewers("dies down.")

//chair type
/obj/structure/chair/fake_powered
	name = "Template chair fake power machine"
	icon = 'modular_whisper/icons/misc/machines.dmi'
	anchored = TRUE
	item_chair = null
	var/toggled = TRUE
	var/working = FALSE
	var/self_powered = FALSE

/obj/structure/chair/fake_powered/Initialize()
	. = ..()
	if(!self_powered)
		GLOB.fake_powered_machines += src
		check_fake_power()
	else
		toggled = TRUE
	update_icon()

/obj/structure/chair/fake_powered/Destroy()
	if(!self_powered)
		GLOB.fake_powered_machines -= src
	. = ..()

/obj/structure/chair/fake_powered/proc/check_fake_power()
	var/area/current_area = get_area(src)
	if(current_area.fake_power)
		toggled = TRUE
		playsound(loc, 'sound/foley/industrial/loadin.ogg', 100)
		balloon_alert_to_viewers("whirrs to life.")
	else
		toggled = FALSE
		playsound(loc, 'sound/foley/industrial/loadout.ogg', 100)
		balloon_alert_to_viewers("dies down.")
