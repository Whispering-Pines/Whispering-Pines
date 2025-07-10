/datum/sex_action/npc_throat_sex
	name = "NPC Fuck their throat"
	stamina_cost = 0
	check_same_tile = FALSE

/datum/sex_action/npc_throat_sex/shows_on_menu(mob/living/user, mob/living/target)
	return FALSE

/datum/sex_action/npc_throat_sex/can_perform(mob/living/user, mob/living/target)
	return TRUE

/datum/sex_action/npc_throat_sex/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] slides their cock into [target]'s throat!"))
	playsound(target, list('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)


/datum/sex_action/npc_throat_sex/on_perform(mob/living/user, mob/living/target)
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fucks [target]'s throat."))
	if(user.rogue_sneaking || user.alpha <= 100)
		segsovolume *= 0.5
	playsound(target, 'sound/misc/mat/segso.ogg', segsovolume, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 8, 0, TRUE)
	if(user.sexcon.check_active_ejaculation())
		user.visible_message(span_love("[user] cums into [target]'s throat!"))
		user.sexcon.cum_into(oral = TRUE)

	target.heal_overall_damage(3,3,0, updating_health = TRUE)
	if(user.sexcon.considered_limp())
		user.sexcon.perform_sex_action(target, 0, 2, FALSE)
	else
		user.sexcon.perform_sex_action(target, 0, 7, FALSE)
		user.sexcon.perform_deepthroat_oxyloss(target, 1.3)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/npc_throat_sex/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] pulls their cock out of [target]'s throat."))
	if(issimple(user))
		var/mob/living/simple_animal/hostile/retaliate/simpleuser = user
		simpleuser.stoppedfucking(target)
	else
		var/mob/living/carbon/human/humanuser = user
		humanuser.stoppedfucking(target)

/datum/sex_action/npc_throat_sex/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		if(issimple(user))
			var/mob/living/simple_animal/hostile/retaliate/simpleuser = user
			simpleuser.stoppedfucking(target)
		else
			var/mob/living/carbon/human/humanuser = user
			humanuser.stoppedfucking(target)

		return TRUE
	return FALSE

//blowies
/datum/sex_action/npc_blowjob
	name = "NPC Suck them off"
	stamina_cost = 0
	check_same_tile = FALSE
	check_incapacitated = FALSE
	gags_user = TRUE

/datum/sex_action/npc_blowjob/shows_on_menu(mob/living/user, mob/living/target)
	return FALSE
/datum/sex_action/npc_blowjob/can_perform(mob/living/user, mob/living/target)
	return TRUE

/datum/sex_action/npc_blowjob/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] starts sucking [target]'s cock..."))

/datum/sex_action/npc_blowjob/on_perform(mob/living/user, mob/living/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] sucks [target]'s cock..."))
	user.make_sucking_noise()
	do_thrust_animate(user, target)

	user.sexcon.perform_sex_action(target, 4, 0, TRUE)

	if(target.sexcon.check_active_ejaculation())
		target.visible_message(span_lovebold("[target] cums into [user]!"))
		target.sexcon.cum_into(oral = TRUE)

/datum/sex_action/npc_blowjob/on_finish(mob/living/user, mob/living/target)
	..()
	user.visible_message(span_warning("[user] stops sucking [target]'s cock ..."))
	if(issimple(user))
		var/mob/living/simple_animal/hostile/retaliate/simpleuser = user
		simpleuser.stoppedfucking(target)
	else
		var/mob/living/carbon/human/humanuser = user
		humanuser.stoppedfucking(target)

/datum/sex_action/npc_blowjob/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		if(issimple(user))
			var/mob/living/simple_animal/hostile/retaliate/simpleuser = user
			simpleuser.stoppedfucking(target)
		else
			var/mob/living/carbon/human/humanuser = user
			humanuser.stoppedfucking(target)

		return TRUE
	return FALSE
