//by vide noir
//old world powered tech that needs identification.
/obj/item/basic_power
	name = "Power requiring item."
	desc = ""
	var/toggled = FALSE
	var/self_powering = FALSE
	var/charge_amt = 4000
	var/charge_max = 4000

/obj/item/basic_power/examine(mob/user)
	. = ..()
	if(ident_comp && !ident_comp.identified)
		return
	. += span_notice("It's power gauge reads [round((charge_amt/charge_max)*100)]%.")

/obj/item/basic_power/Initialize()
	. = ..()
	ident_comp = AddComponent(/datum/component/identifiable)
	if(!pre_identified)
		charge_amt = rand(0, charge_max)
	else
		ident_comp.unmysterize(src)
	if(!toggled)
		STOP_PROCESSING(SSprocessing, src)

/obj/item/basic_power/process()
	if(self_powering || !toggled)
		return
	if(charge_amt)
		charge_amt = max(0,charge_amt-1)
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
	. = ..()
	if(!toggled)
		user.balloon_alert(user, "Not on.")
		return

//healthscanner

/obj/item/basic_power/health_analyzer
	name = "health analyzer"
	desc = "A salvaged old world tech which tells about someone's detailed health status, unfortunately it is in an ancient language."
	icon = 'modular_whisper/icons/obj/misc.dmi'
	icon_state = "health_scanner"
	sellprice = 200

/obj/item/basic_power/health_analyzer/identified
	pre_identified = TRUE

/obj/item/basic_power/health_analyzer/attack(mob/living/carbon/human/M, mob/living/user, params)
	. = ..()
	if(!ishuman(M))
		return
	if(user.has_language(/datum/language/ancient_english) && user.can_read(src))
		M.check_for_injuries(user, TRUE, FALSE, TRUE)
	else
		to_chat(user, span_notice("I can't make sense of the language but can tell basic information through images."))
		M.check_for_injuries(user, FALSE, FALSE, FALSE)
