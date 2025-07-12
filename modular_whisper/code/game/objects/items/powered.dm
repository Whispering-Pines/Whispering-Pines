//wip make charging docks for those and other stuff
//WIP AS FUCK
/obj/item/basic_power
	name = "Power requiring item."
	desc = ""
	var/discovered = TRUE
	var/toggled = FALSE
	var/self_powering = FALSE
	var/charge_amt = 0
	var/charge_max = 0

/obj/item/basic_power/examine(mob/user)
	. = ..()
	. += "It's power gauge reads [(charge_amt/charge_max)*100]%."

/obj/item/basic_power/Initialize()
	. = ..()
	if(!discovered)
		name = "Unidentified item."
		desc = "Some strange old world technology."
		icon_state = "Unknown[rand(1,3)]"
		charge_amt = rand(0, charge_max)
	if(!toggled)
		STOP_PROCESSING(SSprocessing, src)

/obj/item/basic_power/process()
	. = ..()
	if(self_powering || !toggled)
		return
	if(charge_amt)
		charge_amt -= max(0,charge_amt-1)
	else
		balloon_alert_to_viewers("Powers down.")
		toggle()

/obj/item/basic_power/update_icon_state()
	. = ..()
	icon_state = "[initial(icon_state)][toggled ? "_on":""]"

/obj/item/basic_power/proc/toggle()
	if(!toggled && charge_amt == 0)
		balloon_alert_to_viewers("No power.")
		return
	toggled = !toggled
	playsound(loc, 'sound/misc/keyboard_type (1).ogg', 100, TRUE, -1)
	update_appearance(UPDATE_ICON_STATE)
	if(toggled)
		START_PROCESSING(SSprocessing, src)
	else
		STOP_PROCESSING(SSprocessing, src)

/obj/item/basic_power/attack_self(mob/user, params)
	. = ..()
	toggle()

/obj/item/basic_power/attack(mob/living/M, mob/living/user, params)
	if(!discovered)
		user.balloon_alert(user, "Don't know how to use this.")
		return
	if(!toggled)
		user.balloon_alert(user, "Not on.")
		return
	. = ..()

//healthscanner

/obj/item/basic_power/health_analyzer
	name = "health analyzer"
	desc = "A salvaged old world tech which tells about someone's detailed health status, unfortunately it is in an ancient language."
	icon = 'modular_whisper/icons/obj/misc.dmi'
	icon_state = "health_scanner"
	sellprice = 200

/obj/item/basic_power/health_analyzer/attack(mob/living/carbon/human/M, mob/living/user, params)
	. = ..()
	if(!ishuman(M))
		return
	if(user.has_language(/datum/language/ancient_english) && user.can_read(src))
		M.check_for_injuries(user, TRUE, FALSE, TRUE)
	else
		to_chat(user, span_notice("I can't make sense of the language but can tell basic information through images."))
		M.check_for_injuries(user, FALSE, FALSE, FALSE)
