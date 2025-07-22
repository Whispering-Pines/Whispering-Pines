//By Vide Noir https://github.com/EaglePhntm.
///identifiable component, makes items unknown
//examining an unknown item has a chance based on int and lore skill to reveal it, examining identified items, or having identified an item-
//makes you memorize it for future of identifying the same kind of item, making it much easier.
/datum/mind
	var/list/identified_items = list()

/datum/component/identifiable
	var/identified = FALSE
	var/last_identify_attempt = 0
	var/identify_difficulty = 0
	var/prev_icon_state

/datum/component/identifiable/RegisterWithParent()
	. = ..()
	if(!identified)
		mysterize(parent)
	RegisterSignal(parent, COMSIG_PARENT_EXAMINE, PROC_REF(on_examine))
	RegisterSignal(parent, list(COMSIG_ITEM_ATTACK,COMSIG_ITEM_ATTACK_SELF,COMSIG_ITEM_ATTACK_SELF_SECONDARY,COMSIG_ITEM_ATTACK_SECONDARY,COMSIG_ITEM_ATTACK_OBJ), PROC_REF(on_attack))
	RegisterSignal(parent, COMSIG_ATOM_UPDATE_ICON_STATE, PROC_REF(on_update_icon))

/datum/component/identifiable/UnregisterFromParent()
	UnregisterSignal(parent, list(COMSIG_PARENT_EXAMINE,COMSIG_ITEM_ATTACK,COMSIG_ITEM_ATTACK_SELF,COMSIG_ITEM_ATTACK_SELF_SECONDARY,COMSIG_ITEM_ATTACK_SECONDARY,COMSIG_ITEM_ATTACK_OBJ))

/datum/component/identifiable/proc/mysterize(obj/item/parent)
	parent.name = "Unidentified item"
	parent.desc = "Some strange old world technology."
	parent.icon = 'modular_whisper/icons/misc/mystery_item.dmi'
	prev_icon_state = parent.icon_state //in case it was changed after initialize.
	parent.icon_state = "unknown_[rand(1,5)]"
	identified = FALSE

/datum/component/identifiable/proc/unmysterize(obj/item/parent)
	parent.name = initial(parent.name)
	parent.desc = initial(parent.desc)
	parent.icon = initial(parent.icon)
	parent.icon_state = prev_icon_state
	identified = TRUE
	parent.update_appearance(UPDATE_ICON)

/datum/component/identifiable/proc/on_update_icon(datum/source)
	if(!identified) //prevents stuff from returning to their initial icons
		return FALSE

/datum/component/identifiable/proc/on_attack(datum/source, mob/living/carbon/human/user)
	if(!identified) //stops using an item if not identified
		user.balloon_alert(user, "I don't know how to use this.")
		return FALSE

/datum/component/identifiable/proc/on_examine(datum/source, mob/living/carbon/human/user)
	if(!ishuman(user))
		return
	if(!user.mind)
		return
	var/mob/living/carbon/human/huser = user
	var/obj/item/parenti = parent
	if(!parenti)
		return
	if(!identified)
		if(in_range(source, user))
			if(world.time > last_identify_attempt + 3 MINUTES)
				last_identify_attempt = world.time
				var/the_roll = 2*huser.STAINT*max(1,huser.get_skill_level(/datum/skill/misc/lore))-identify_difficulty
				if(type in huser.mind.identified_items)
					to_chat(huser, span_green("I think I have seen this before..."))
					the_roll += 70
					identify_difficulty = 0 //eliminate exp bonus.
				if(prob(min(the_roll,100)))
					unmysterize(parent)
					to_chat(huser, span_green("I figure that this should be a [parenti.name]."))
					huser.adjust_experience(/datum/skill/misc/lore, huser.STAINT * 5 + identify_difficulty, FALSE, TRUE)
					if(!(type in huser.mind.identified_items))
						huser.mind.identified_items += type
				else
					to_chat(huser, span_red("I can't quite figure out what this is, I should ponder again later... [the_roll]%"))
			else
				to_chat(huser, span_red("I should inspect this thing again in [round((world.time - last_identify_attempt + 3 MINUTES)/10)] seconds."))
	else
		if(!(type in huser.mind.identified_items))
			huser.mind.identified_items += type
			to_chat(huser, span_green("I might recognize this strange device in the future..."))
			huser.adjust_experience(/datum/skill/misc/lore, huser.STAINT * 5, FALSE, TRUE)
