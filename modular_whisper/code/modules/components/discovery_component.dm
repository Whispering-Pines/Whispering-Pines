//By Vide Noir https://github.com/EaglePhntm.
///Discoverable component, makes items unknown
//and unusable with some more effort on the item type used using checks for the discovered var here and doing early returns like on powered.dm
//examining an unknown item has a chance based on int and lore skill to reveal it, examining identified items, or having identified an item-
//makes you memorize it for future of identifying the same kind of item, making it much easier.
//take powered.dm for a prime example of use.
/datum/component/discoverable
	var/discovered = FALSE
	var/last_identify_attempt = 0
	var/identify_difficulty = 0

/datum/component/discoverable/RegisterWithParent()
	. = ..()
	mysterize(parent)
	RegisterSignal(parent, COMSIG_PARENT_EXAMINE, PROC_REF(on_examine))

/datum/component/discoverable/UnregisterFromParent()
	UnregisterSignal(parent, COMSIG_PARENT_EXAMINE)

/datum/component/discoverable/proc/mysterize(obj/item/parent)
	parent.name = "Unidentified item"
	parent.desc = "Some strange old world technology."
	parent.icon = 'modular_whisper/icons/misc/mystery_item.dmi'
	parent.icon_state = "unknown_[rand(1,5)]" //make those
	discovered = FALSE

/datum/component/discoverable/proc/unmysterize(obj/item/parent)
	parent.name = initial(parent.name)
	parent.desc = initial(parent.desc)
	parent.icon = initial(parent.icon)
	parent.icon_state = initial(parent.icon_state)
	parent.update_appearance(UPDATE_ICON)
	discovered = TRUE

/datum/component/discoverable/proc/on_examine(datum/source, mob/living/carbon/human/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/huser = user
	var/obj/item/parenti = parent
	if(parenti)
		if(!discovered)
			if(in_range(source, user))
				if(world.time > last_identify_attempt + 3 MINUTES)
					last_identify_attempt = world.time
					var/the_roll = 2*huser.STAINT*max(1,huser.get_skill_level(/datum/skill/misc/lore))-identify_difficulty
					if(type in huser.identified_items)
						to_chat(huser, span_green("I think I have seen this before..."))
						the_roll += 70
						identify_difficulty = 0 //eliminate exp bonus.
					if(prob(min(the_roll,100)))
						unmysterize(parent)
						to_chat(huser, span_green("I figure that this should be a [parenti.name]."))
						huser.adjust_experience(/datum/skill/misc/lore, huser.STAINT * 5 + identify_difficulty, FALSE, TRUE)
						if(!(type in huser.identified_items))
							huser.identified_items += type
					else
						to_chat(huser, span_red("I can't quite figure out what this is, I should ponder again later... [the_roll]%"))
				else
					to_chat(huser, span_red("I should inspect this thing again in [round((world.time - last_identify_attempt + 3 MINUTES)/10)] seconds."))
		else
			if(!(type in huser.identified_items))
				huser.identified_items += type
				to_chat(huser, span_green("I might recognize this strange device in the future..."))
				huser.adjust_experience(/datum/skill/misc/lore, huser.STAINT * 5, FALSE, TRUE)
