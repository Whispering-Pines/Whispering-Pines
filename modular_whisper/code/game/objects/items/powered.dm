//by vide noir
//old world powered tech that needs identification.
/mob/living/carbon/human
	var/list/identified_items = list()

/obj/item/basic_power
	name = "Power requiring item."
	desc = ""
	var/discovered = TRUE
	var/toggled = FALSE
	var/self_powering = FALSE
	var/charge_amt = 0
	var/charge_max = 0
	var/last_identify_attempt = 0
	var/identify_difficulty = 0

/obj/item/basic_power/examine(mob/user)
	. = ..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/huser = user
	if(!discovered)
		if(world.time > last_identify_attempt + 3 MINUTES)
			last_identify_attempt = world.time
			var/the_roll = 2*huser.STAINT*max(1,huser.get_skill_level(/datum/skill/misc/lore))-identify_difficulty
			if(type in huser.identified_items)
				to_chat(huser, span_green("I seen this before..."))
				the_roll += 50
				identify_difficulty = 0 //eliminate exp bonus.
			if(prob(min(the_roll,100)))
				name = initial(name)
				desc = initial(desc)
				icon_state = initial(icon_state)
				discovered = TRUE
				update_appearance(UPDATE_ICON_STATE)
				to_chat(huser, span_green("I figure that this should be a [name]."))
				huser.adjust_experience(/datum/skill/misc/lore, huser.STAINT * 2 + identify_difficulty, FALSE, TRUE)
				if(!(type in huser.identified_items))
					huser.identified_items += type
			else
				to_chat(huser, span_red("I can't quite figure out what this is, I should ponder again later... [the_roll]%"))
		return
	else
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
