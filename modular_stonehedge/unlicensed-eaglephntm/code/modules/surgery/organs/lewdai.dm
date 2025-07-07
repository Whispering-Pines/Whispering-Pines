//By Vide Noir https://github.com/EaglePhntm.
//probably janky as fuck but it is what it is, all mobs having this stuff enabled will stunlock poor warriors with defiant off and monster hunter quirk, likely.


//The funny itself... Works with retaliate simple mobs and non simple human mobs.
//To set up proper you need to change seeksfuck var to TRUE
/mob/living

	//You can use this with any living.
	///Will this mob be given genitals and sexcontroller, therefore enabling erp panel, and basically enables everything else, key variable. Does not make em aggressively seek it.
	var/erpable = TRUE

	//You can not use the vars below with anything less than retaliate simple mobs, anything less dont have retaliate ai and required vars.
	///Is this a horny goober that periodically tries to get in people.
	var/seeksfuck = FALSE
	///percent chance at initialize to enable seeksfuck, if normally not enabled in type.
	var/hornychance = 0
	///dumdumdumdum, use for not so smart mobs like goblins for dumb horny talk. "I smell a mate."
	var/lewd_talk = FALSE
	//Customizable speech for chasing and when starting to seek a mate.
	var/male_lewdtalk = list("Come here, mate!", "I smell a mate..!", "I'm going to get in you!",  "You will breed with me!")
	var/female_lewdtalk = list("Come here, mate!", "I smell a mate..!", "I'm going to get you in me!", "You will breed with me!")

	//stuff related to auto sex stuff
	///Dont touch or change those manually, those are set automatically with the process.
	var/fuckcd = 0
	var/chasesfuck = FALSE
	var/seekboredom = 0

	///npc organs to use
	var/ball_organ = /obj/item/organ/filling_organ/testicles
	var/ball_min = MIN_TESTICLES_SIZE
	var/ball_max = MAX_TESTICLES_SIZE
	var/breast_organ = /obj/item/organ/filling_organ/breasts
	var/breast_min = MIN_BREASTS_SIZE
	var/breast_max = MAX_BREASTS_SIZE
	var/ass_organ = /obj/item/organ/butt
	var/ass_min = MIN_BUTT_SIZE
	var/ass_max = MAX_BUTT_SIZE
	var/penis_organ = /obj/item/organ/penis
	var/penis_min = MIN_PENIS_SIZE
	var/penis_max = MAX_PENIS_SIZE
	var/butt_organ = /obj/item/organ/butt
	var/butt_min = MIN_BUTT_SIZE
	var/butt_max = MAX_BUTT_SIZE
	var/vagina_organ = /obj/item/organ/filling_organ/vagina
	var/show_genitals = FALSE
	var/no_random_gender = FALSE

//--------------simple mobs ----------------
//sex stuff brainrot for things like werevolves --vide noir
//talking is not optional here for show of sentience.

/mob/living/simple_animal/hostile/retaliate/proc/Lewd_Tick()
	if(client)
		return
	if(!erpable)
		return
	if(fuckcd > 0)
		fuckcd -= 1
	if(fuckcd)
		return
	if(sexcon?.current_action)
		return
	if(retreating)
		return
	if(handcuffed || legcuffed || !(mobility_flags & MOBILITY_STAND))
		return
	if(sexcon && !chasesfuck)
		for(var/mob/living/carbon/human/fucktarg in oview(aggro_vision_range, src))
			if(fucktarg == src)
				continue
			if(!target && fucktarg.cmode) //skip if the target has cmode on and the mob is not targeting anyone so probably not aggressive...
				continue
			if(fucktarg.age == AGE_CHILD)
				continue
			if(fucktarg.alpha <= 100)
				continue
			if(gender == MALE && !fucktarg.has_quirk(/datum/quirk/monsterhuntermale))
				continue
			if(gender == FEMALE && !fucktarg.has_quirk(/datum/quirk/monsterhunterfemale))
				continue
			chasesfuck = TRUE
			if(gender == MALE)
				visible_message(span_boldwarning("[src] has his eyes on [fucktarg], cock throbbing!"))
				say(pick(male_lewdtalk), language = /datum/language/common)
			else
				visible_message(span_boldwarning("[src] has her eyes on [fucktarg], cunt dripping!"))
				say(pick(female_lewdtalk), language = /datum/language/common)
			break
	if(chasesfuck) //until fuck is acquired, keep chasing.
		seekboredom += 1
		enemies = list()
		target = null
		if(prob(10))
			if(gender == MALE)
				visible_message(span_warning("[src] seeks his mate, cock throbbing!"))
				say(pick(male_lewdtalk), language = /datum/language/common)
			else
				visible_message(span_warning("[src] seeks her mate, cunt dripping!"))
				say(pick(female_lewdtalk), language = /datum/language/common)
		seeklewd()
	if(seekboredom > 25) //give up after a while and go dormant again, this should also help them get unstuck.
		stoppedfucking(timedout = TRUE)
	if(retreating && chasesfuck) //we are outta here
		stoppedfucking(timedout = TRUE)

/mob/living/simple_animal/hostile/retaliate/proc/seeklewd()
	if(!erpable)
		return
	if(retreating)
		return
	if(sexcon.current_action)
		return
	if(fuckcd > 0)
		return
	if(!(mobility_flags & MOBILITY_STAND))
		return
	var/mob/living/carbon/human/L
	var/list/foundfuckmeat = list()
	for(var/mob/living/carbon/human/fucktarg in oview(aggro_vision_range, src))
		if(fucktarg.has_quirk(/datum/quirk/monsterhuntermale) || fucktarg.has_quirk(/datum/quirk/monsterhunterfemale))
			foundfuckmeat += fucktarg
		if(foundfuckmeat.len)
			L = pick(foundfuckmeat)
			if(Adjacent(L) || loc == L.loc)
				if(iscarbon(L))
					chasesfuck = FALSE
					if(attack_sound)
						playsound(src, pick(attack_sound), 100, TRUE, -1)
					ai_controller.PauseAi(8 MINUTES)
					if(L.cmode)
						L.SetStun(40)
						L.SetKnockdown(40)
					else //sneak attacked i guess.
						L.SetStun(60)
						L.SetKnockdown(60)
					if((L.mobility_flags & MOBILITY_STAND))
						L.emote("gasp")
					if(L.wear_pants)
						if(L.wear_pants.flags_inv & HIDECROTCH && !L.wear_pants.genital_access)
							if(!L.cmode) //pants off if not in cmode
								visible_message(span_danger("[src] manages to rip [L]'s [L.wear_pants.name] off!"))
								var/obj/item/clothing/thepants = L.wear_pants
								L.dropItemToGround(thepants)
								thepants.throw_at(orange(2, get_turf(L)), 2, 1, src, TRUE)
							else if(L.cmode)
								visible_message(span_danger("[src] manages to tug [L]'s [L.wear_pants.name] out of the way!"))
					enemies = list()
					target = null
					if(health < maxHealth)
						sexcon.force = SEX_FORCE_MAX
					else
						sexcon.force = SEX_FORCE_MID
					if(!Adjacent(L) || loc != L.loc) //are we at the same tile?
						walk_to(src, get_turf(Adjacent(L)), 1, move_to_delay) //get on them.
					visible_message(span_danger("[src] starts to breed [L]!"))
					if(sexcon.force == SEX_FORCE_MAX)
						visible_message(span_danger("[src] pins [L] down for a savage fucking!"))
					else
						visible_message(span_info("[src] climbs on [L] to breed."))
					sexcon.speed = SEX_SPEED_MAX
					log_admin("[src] is trying to init sex on [L]")
					var/current_action = /datum/sex_action/npc_rimming
					if(gender == FEMALE && L.gender == MALE)
						switch(rand(1,2))
							if(1) //anal
								current_action = /datum/sex_action/npc_anal_ride_sex
							if(2) //vaginal
								current_action = /datum/sex_action/npc_vaginal_ride_sex
					if(gender == MALE && L.gender == MALE)
						switch(rand(1,2))
							if(1) //oral
								current_action = /datum/sex_action/npc_throat_sex
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_sex
					if(gender == MALE && L.gender == FEMALE)
						switch(rand(1,3))
							if(1) //oral
								current_action = /datum/sex_action/npc_throat_sex
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_sex
							if(3) //vaginal
								current_action = /datum/sex_action/npc_vaginal_sex
					if(gender == FEMALE && L.gender == FEMALE)
						switch(rand(1,3))
							if(1) //oral
								current_action = /datum/sex_action/npc_facesitting
							if(2) //anal
								current_action = /datum/sex_action/npc_rimming
							if(3) //vaginal
								current_action = /datum/sex_action/npc_cunnilingus
					sexcon.do_until_finished = TRUE
					sexcon.target = L
					sexcon.try_start_action(current_action)
			else
				var/turf/T = get_turf(L)
				walk_to(src, T, move_to_delay)

/mob/living/simple_animal/hostile/retaliate/proc/stoppedfucking(mob/living/carbon/target, timedout = FALSE)
	walk_away(src, get_turf(loc), 1, move_to_delay)
	sexcon.current_action = null
	chasesfuck = FALSE
	seekboredom = 0
	ai_controller.PauseAi(8 SECONDS) //You get some time to get up.
	if(sexcon.just_ejaculated() || timedout) //is it satisfied or given up
		fuckcd = rand(50,150)
	else
		fuckcd = rand(20,40)
		if(health < maxHealth)
			//if its in combat and unsatisfied by prey slipping off, it will wanna try again. But with some delay so the person can actually get up
			// and if they are taking turns with multiple seeksfuck mobs around this may help a bit.
			fuckcd = rand(10,20)

/mob/living/simple_animal/hostile/retaliate/Life()
	if(seeksfuck && stat == CONSCIOUS)
		Lewd_Tick()
	. = ..()

/mob/living/simple_animal/hostile/retaliate/apply_damage(damage, damagetype, def_zone, blocked, forced, spread_damage)
	. = ..()
	if(sexcon)
		if(sexcon.current_action)
			stoppedfucking()
			if(!ai_controller.able_to_run())
				ai_controller.PauseAi(1) //override pauses.

/mob/living/simple_animal/Initialize()
	. = ..()
	if(erpable)
		if(!no_random_gender)
			gender = pick(MALE, FEMALE)
		addtimer(CALLBACK(src, PROC_REF(give_genitals)), 1) //stupid should_not_sleep on init and organ removal death sleep issues.
	if(prob(hornychance))
		seeksfuck = TRUE
		fuckcd = rand(0,20)

//--------------not so simple mobs ----------------
//gonna be conversion of the simple mob stuff i made before somehow -videnoir
//those should not tackle down but only pounce laying mobs.
//those mobs may instantly refresh their cooldown if a mob is laying or is handcuffed nearby while seeking targets.

/mob/living/carbon/human/proc/Lewd_Tick()
	if(client)
		return
	if(!erpable)
		return
	if(fuckcd > 0)
		fuckcd -= 1
	if(fuckcd)
		return
	if(sexcon.current_action)
		return
	if(sexcon && !chasesfuck)
		var/list/around = oview(7, src)
		for(var/mob/living/carbon/human/fucktarg in around)
			if(fucktarg == src)
				continue
			if(fucktarg.age == AGE_CHILD)
				continue
			if(fucktarg.alpha <= 100)
				continue
			if(gender == MALE && !fucktarg.has_quirk(/datum/quirk/monsterhuntermale))
				continue
			if(gender == FEMALE && !fucktarg.has_quirk(/datum/quirk/monsterhunterfemale))
				continue
			chasesfuck = TRUE
			if(lewd_talk)
				if(gender == MALE)
					visible_message(span_boldwarning("[src] has his eyes on [fucktarg], cock throbbing!"))
					say(pick(male_lewdtalk), language = /datum/language/common)
				else
					visible_message(span_boldwarning("[src] has her eyes on [fucktarg], cunt dripping!"))
					say(pick(female_lewdtalk), language = /datum/language/common)
			break
	if(chasesfuck) //until fuck is acquired, keep chasing.
		seekboredom += 1
		if(prob(10) && lewd_talk)
			if(gender == MALE)
				visible_message(span_warning("[src] seeks his mate, cock throbbing!"))
				say(pick(male_lewdtalk), language = /datum/language/common)
			else
				visible_message(span_warning("[src] seeks her mate, cunt dripping!"))
				say(pick(female_lewdtalk), language = /datum/language/common)
		seeklewd()
	if(seekboredom > 25) //give up after a while and go dormant again, this should also help them get unstuck.
		stoppedfucking(timedout = TRUE)

/mob/living/carbon/human/proc/seeklewd()
	if(sexcon.current_action)
		return
	if(fuckcd > 0)
		return
	if(!(mobility_flags & MOBILITY_STAND))
		return
	var/mob/living/carbon/human/L
	var/list/foundfuckmeat = list()
	for(var/mob/living/carbon/human/fucktarg in oview(7, src))
		if(fucktarg.has_quirk(/datum/quirk/monsterhuntermale) || fucktarg.has_quirk(/datum/quirk/monsterhunterfemale))
			foundfuckmeat += fucktarg
		if(foundfuckmeat.len)
			L = pick(foundfuckmeat)
			ai_controller.PauseAi(8 MINUTES)
			if(Adjacent(L) || loc == L.loc)
				if(iscarbon(L))
					chasesfuck = FALSE
					if(L.cmode)
						L.SetStun(40)
						L.SetKnockdown(40)
					else //sneak attacked i guess.
						L.SetStun(60)
						L.SetKnockdown(60)
					if((L.mobility_flags & MOBILITY_STAND)) //i guess if already targeted but got up somehow.
						L.emote("gasp")
					if(L.wear_pants)
						if(L.wear_pants.flags_inv & HIDECROTCH && !L.wear_pants.genital_access)
							if(!L.cmode) //pants off if not in cmode
								visible_message(span_danger("[src] manages to rip [L]'s [L.wear_pants.name] off!"))
								var/obj/item/clothing/thepants = L.wear_pants
								L.dropItemToGround(thepants)
								thepants.throw_at(orange(2, get_turf(L)), 2, 1, src, TRUE)
							else if(L.cmode)
								visible_message(span_danger("[src] manages to tug [L]'s [L.wear_pants.name] out of the way!"))
					if(health < maxHealth)
						sexcon.force = SEX_FORCE_MAX
					else
						sexcon.force = SEX_FORCE_MID
					if(!Adjacent(L) || loc != L.loc) //are we at the same tile?
						walk_towards(src, L.loc, 1)
					if(!pulling)
						start_pulling(L)
					visible_message(span_danger("[src] starts to breed [L]!"))
					if(sexcon.force == SEX_FORCE_MAX)
						visible_message(span_danger("[src] pins [L] down for a savage fucking!"))
					else
						visible_message(span_info("[src] climbs on [L] to breed."))
					sexcon.speed = SEX_SPEED_MAX
					log_admin("[src] is trying to init sex on [L]")
					var/current_action = /datum/sex_action/npc_rimming
					if(gender == FEMALE && L.gender == MALE)
						switch(rand(1,2))
							if(1) //anal
								current_action = /datum/sex_action/npc_anal_ride_sex
							if(2) //vaginal
								current_action = /datum/sex_action/npc_vaginal_ride_sex
					if(gender == MALE && L.gender == MALE)
						switch(rand(1,2))
							if(1) //oral
								current_action = /datum/sex_action/npc_throat_sex
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_sex
					if(gender == MALE && L.gender == FEMALE)
						switch(rand(1,3))
							if(1) //oral
								current_action = /datum/sex_action/npc_throat_sex
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_sex
							if(3) //vaginal
								current_action = /datum/sex_action/npc_vaginal_sex
					if(gender == FEMALE && L.gender == FEMALE)
						switch(rand(1,3))
							if(1) //oral
								current_action = /datum/sex_action/npc_facesitting
							if(2) //anal
								current_action = /datum/sex_action/npc_rimming
							if(3) //vaginal
								current_action = /datum/sex_action/npc_cunnilingus
					sexcon.do_until_finished = TRUE
					sexcon.target = L
					sexcon.try_start_action(current_action)
			else
				var/turf/T = get_turf(L)
				walk_towards(src, T, 1)

/mob/living/carbon/human/proc/stoppedfucking(mob/living/carbon/target, timedout = FALSE)
	//try to bind after sex.
	if(target && Adjacent(target))
		if(health < maxHealth && !target.handcuffed && !(target.mobility_flags & MOBILITY_STAND)) //aggro mob, not handcuffed, lying.
			for(var/obj/item/rope/ropey in held_items)
				if(target.cmode)
					visible_message(span_info("[src] struggles with [target]!"))
					adjust_energy(-50, TRUE)
					target.adjust_energy(-50, TRUE)
				else
					ropey.apply_cuffs(target, src)
					visible_message(span_info("[src] ties up [target] with a rope!"))
					start_pulling(target)
				emote("laugh")
				break
		else if(health < maxHealth && target.handcuffed) //already cuffed.
			emote("laugh")
			target.adjust_energy(-25, TRUE)
			adjust_energy(-25, TRUE)
	else if(target)
		walk_away(src, get_turf(loc), 1, 1)
	sexcon.current_action = null
	chasesfuck = FALSE
	seekboredom = 0
	ai_controller.PauseAi(1)
	if(sexcon.just_ejaculated() || timedout) //is it satisfied or given up
		fuckcd = rand(50,150)
	else
		fuckcd = rand(20,40)
		if(health < maxHealth)
			//if its in combat and unsatisfied by prey slipping off, it will wanna try again. But with some delay so the person can actually get up
			// and if they are taking turns with multiple seeksfuck mobs around this may help a bit.
			fuckcd = rand(10,20)

/mob/living/carbon/human/Life()
	. = ..()
	if(seeksfuck && stat == CONSCIOUS)
		Lewd_Tick()

/mob/living/carbon/human/Initialize()
	. = ..()
	if(erpable)
		gender = pick(MALE, FEMALE)
		addtimer(CALLBACK(src, PROC_REF(give_genitals)), 1) //stupid should_not_sleep on init and organ removal death sleep issues.
	if(prob(hornychance))
		seeksfuck = TRUE
		fuckcd = rand(0,20)

//Call this proc to give genitals automatically where needed.
//hidden organs are on by default due to coloring issues, otherwise set on each mob.
/mob/living/proc/give_genitals()
	erpable = TRUE
	if(!sexcon)
		sexcon = new /datum/sex_controller(src)
	if(!issimple(src))
		var/mob/living/carbon/human/species/user = src
		if(gender == MALE)
			var/obj/item/organ/filling_organ/testicles/testicles = user.getorganslot(ORGAN_SLOT_TESTICLES)
			if(testicles)
				testicles.Remove(src,1)
				QDEL_NULL(testicles)
			if(!show_genitals)
				testicles = new /obj/item/organ/filling_organ/testicles/internal
			else
				testicles = new ball_organ
			testicles.organ_size = rand(ball_min, ball_max)
			testicles.Insert(user, TRUE)
			var/obj/item/organ/penis/penis = user.getorganslot(ORGAN_SLOT_PENIS)
			if(penis)
				penis.Remove(src,1)
				QDEL_NULL(penis)
			if(!show_genitals)
				penis = new /obj/item/organ/penis/internal
			else
				penis = new penis_organ
			penis.organ_size = rand(penis_min, penis_max)
			penis.Insert(user, TRUE)
		if(gender == FEMALE)
			var/obj/item/organ/butt/buttie = user.getorganslot(ORGAN_SLOT_BUTT)
			if(buttie)
				buttie.Remove(src,1)
				QDEL_NULL(buttie)
			if(!show_genitals)
				buttie = new /obj/item/organ/butt/internal
			else
				buttie = new butt_organ
			buttie.organ_size = rand(butt_min, butt_max)
			buttie.Insert(user, TRUE)
			var/obj/item/organ/filling_organ/breasts/breasts = user.getorganslot(ORGAN_SLOT_BREASTS)
			if(breasts)
				breasts.Remove(src,1)
				QDEL_NULL(breasts)
			if(!show_genitals)
				breasts = new /obj/item/organ/filling_organ/breasts/internal
			else
				breasts = new breast_organ
			breasts.organ_size = rand(breast_min,breast_max)
			breasts.Insert(user, TRUE)
			var/obj/item/organ/filling_organ/vagina/vagina = user.getorganslot(ORGAN_SLOT_VAGINA)
			if(vagina)
				vagina.Remove(src,1)
				QDEL_NULL(vagina)
			if(!show_genitals)
				vagina = new /obj/item/organ/filling_organ/vagina/internal
			else
				vagina = new vagina_organ
			vagina.Insert(user, TRUE)
			if(prob(5)) //5 chance to be dickgirl.
				var/obj/item/organ/filling_organ/testicles/testicles = user.getorganslot(ORGAN_SLOT_TESTICLES)
				if(testicles)
					testicles.Remove(src,1)
					QDEL_NULL(testicles)
				if(!show_genitals)
					testicles = new /obj/item/organ/filling_organ/testicles/internal
				else
					testicles = new ball_organ
				testicles.organ_size = rand(ball_min, ball_max)
				testicles.Insert(user, TRUE)
				var/obj/item/organ/penis/penis = user.getorganslot(ORGAN_SLOT_PENIS)
				if(penis)
					penis.Remove(src,1)
					QDEL_NULL(penis)
				if(!show_genitals)
					penis = new /obj/item/organ/penis/internal
				else
					penis = new penis_organ
				penis.organ_size = rand(penis_min, penis_max)
				penis.Insert(user, TRUE)
