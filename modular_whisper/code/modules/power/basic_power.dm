GLOBAL_LIST_EMPTY(nuclear_generators)
GLOBAL_LIST_EMPTY(power_relays)

//this has a toggle which sets area as a ghetto powered state to be checked rather than having to search every tile of an area by machines.
//This might need a rework later but fuck me it was tough I aint gonna do it -vide.
/area
	//basic power related things.
	var/basic_power = 0

/obj/proc/on_power_update(datum/source, area/current_area)
	return

//machinery type
/obj/machinery/basic_power
	name = "Template fake power machine"
	icon = 'modular_whisper/icons/misc/machines.dmi'
	anchored = TRUE
	var/toggled = FALSE

/obj/machinery/basic_power/on_power_update(datum/source, area/current_area)
	if(current_area.basic_power)
		toggled = TRUE
	else
		toggled = FALSE

/obj/machinery/basic_power/Initialize()
	. = ..()
	AddComponent(/datum/component/basic_power, CALLBACK(src, PROC_REF(on_power_update)))
	update_appearance(UPDATE_ICON_STATE)

/obj/machinery/basic_power/Destroy()
	AddComponent(/datum/component/basic_power, CALLBACK(src, PROC_REF(on_power_update)))
	. = ..()

//coffin type for lids
/obj/structure/closet/basic_power
	name = "Template lidded fake power machine"
	icon = 'modular_whisper/icons/misc/machines.dmi'
	anchored = TRUE
	var/toggled = FALSE
	var/working = FALSE

/obj/structure/closet/basic_power/on_power_update(datum/source, area/current_area)
	if(current_area.basic_power)
		toggled = TRUE
	else
		toggled = FALSE

/obj/structure/closet/basic_power/Initialize()
	AddComponent(/datum/component/basic_power, CALLBACK(src, PROC_REF(on_power_update)))
	update_appearance(UPDATE_ICON_STATE)
	. = ..()

//chair type
/obj/structure/chair/basic_power
	name = "Template chair fake power machine"
	icon = 'modular_whisper/icons/misc/machines.dmi'
	anchored = TRUE
	item_chair = null
	var/toggled = FALSE
	var/working = FALSE

/obj/structure/chair/basic_power/on_power_update(datum/source, area/current_area)
	if(current_area.basic_power)
		toggled = TRUE
	else
		toggled = FALSE

/obj/structure/chair/basic_power/Initialize()
	. = ..()
	AddComponent(/datum/component/basic_power, CALLBACK(src, PROC_REF(on_power_update)))
	update_appearance(UPDATE_ICON_STATE)
