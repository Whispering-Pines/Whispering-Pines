/datum/component/basic_power
	var/area/current_area
	var/datum/callback/on_power_update
	var/self_powered = FALSE

/datum/component/basic_power/Initialize(datum/callback/on_power_update)
	. = ..()
	src.on_power_update = on_power_update

/datum/component/basic_power/Destroy(force, silent)
	QDEL_NULL(on_power_update)
	return ..()

/datum/component/basic_power/RegisterWithParent()
	link_to_area(get_area(parent))
	RegisterSignal(parent, COMSIG_ENTER_AREA, PROC_REF(on_area_enter))
	RegisterSignal(parent, COMSIG_EXIT_AREA, PROC_REF(on_area_exit))
	RegisterSignal(parent, COMSIG_ATOM_WRENCH_ACT, PROC_REF(on_wrench_act))
	on_power_update()

/datum/component/basic_power/UnregisterFromParent()
	UnregisterSignal(parent, list(COMSIG_POWER_UPDATE, COMSIG_EXIT_AREA))
	unlink_area()

/datum/component/basic_power/proc/on_wrench_act(mob/living/user, obj/item/I)
	on_power_update()

/datum/component/basic_power/proc/link_to_area(area/area_linked)
	current_area = area_linked
	RegisterSignal(current_area, COMSIG_POWER_UPDATE, PROC_REF(on_power_update))

/datum/component/basic_power/proc/unlink_area()
	if(!current_area)
		return
	UnregisterSignal(current_area, COMSIG_POWER_UPDATE)
	current_area = null

/datum/component/basic_power/proc/on_power_update()
	SIGNAL_HANDLER
	if(!current_area)
		return
	if(on_power_update) //not null
		on_power_update.Invoke(parent, current_area)

/datum/component/basic_power/proc/on_area_enter(datum/source, area/area_entered)
	SIGNAL_HANDLER
	link_to_area(area_entered)
	on_power_update()

/datum/component/basic_power/proc/on_area_exit(datum/source, area/area_exited)
	SIGNAL_HANDLER
	unlink_area()
	on_power_update()
