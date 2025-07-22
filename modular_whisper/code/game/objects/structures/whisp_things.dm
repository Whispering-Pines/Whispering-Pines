/obj/structure/stairs/slope
	name = "stone slope"
	icon = 'modular_whisper/icons/obj/slopes.dmi'
	icon_state = "rocky"

/obj/item/ore/coal/charcoal
	grind_results = list(/datum/reagent/charcoal = 15)

/obj/item/ore/iron
	grind_results = list(/datum/reagent/iron = 15)

/obj/item/ingot/iron
	grind_results = list(/datum/reagent/iron = 15)

//grass into dirt
/turf/open/floor/grass/attack_hand_secondary(mob/user, params)
	. = ..()
	if(user.cmode)
		return
	visible_message(span_notice("[user] starts removing the patch of grass from the dirt."), span_notice("I start removing the patch of grass from the dirt."))
	if(do_after(user, 8 SECONDS, user))
		visible_message(span_notice("[user] cleared up the grass from the ground."), span_notice("I clear up the grass from the ground."))
		turf_destruction()
