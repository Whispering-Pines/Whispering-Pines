/datum/sex_action/masturbate_other_vagina_finger
	name = "Finger their pussy"
	check_same_tile = FALSE

/datum/sex_action/masturbate_other_vagina_finger/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE

	if(user == target)
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_VAGINA))
		if(issimple(target) && target.gender == FEMALE && target.sexcon)
		else
			return FALSE
	return TRUE

/datum/sex_action/masturbate_other_vagina_finger/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(target))
		var/mob/living/carbon/human/targethuman = target
		if(targethuman.wear_pants)
			var/obj/item/clothing/pants/pantsies = targethuman.wear_pants
			if(pantsies.flags_inv & HIDECROTCH)
				if(!pantsies.genital_access)
					return FALSE
	if(!target.getorganslot(ORGAN_SLOT_VAGINA))
		if(issimple(target) && target.gender == FEMALE && target.sexcon)
		else
			return FALSE
	return TRUE

/datum/sex_action/masturbate_other_vagina_finger/on_start(mob/living/user, mob/living/target)
	..()
	if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY))) //Fairy on non-fairy will be fucking, otherwise normal
		//Stroking becomes finger fucking instead
		user.visible_message(span_warning("[user] starts fucking [target]'s [pick("slit","cunt","pussy","snatch")] with their finger..."))
	else
		user.visible_message(span_warning("[user] starts fingering [target]'s [pick("slit","cunt","pussy","snatch")]..."))

/datum/sex_action/masturbate_other_vagina_finger/on_perform(mob/living/user, mob/living/target)
	if(user.sexcon.do_message_signature("[type]"))
		if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY))) //Fairy on non-fairy will be fucking, otherwise normal
			//Stroking becomes finger fucking instead
			user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fucks [target]'s [pick("slit","cunt","pussy","snatch")] with their finger..."))
		else
			user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fingers [target]'s [pick("slit","cunt","pussy","snatch")]..."))
	if(user.rogue_sneaking || user.alpha <= 100)
		segsovolume *= 0.5
	playsound(user, 'sound/misc/mat/fingering.ogg', segsovolume, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(target, 2, 4, TRUE)

	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/masturbate_other_vagina_finger/on_finish(mob/living/user, mob/living/target)
	..()
	if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY))) //Fairy on non-fairy will be fucking, otherwise normal
		user.visible_message(span_warning("[user] stops fucking [target]'s cunt with their finger."))
	else
		user.visible_message(span_warning("[user] stops fingering [target]'s clit."))


/datum/sex_action/masturbate_other_vagina_finger/is_finished(mob/living/user, mob/living/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE
