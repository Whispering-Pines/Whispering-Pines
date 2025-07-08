//new stuff ghettoified for rt
/datum/reagent/medicine/inaprovaline
	name = "Inaprovaline"
	description = "Inaprovaline is a synaptic stimulant and cardiostimulant. Commonly used to stabilize patients."
	color = COLOR_CYAN
	overdose_threshold = 60

/datum/reagent/medicine/inaprovaline/on_mob_add(mob/living/L, metabolism)
	ADD_TRAIT(L, TRAIT_NOBREATH, "[type]")
	var/mob/living/carbon/human/H = L
	if(TIMER_COOLDOWN_RUNNING(L, name) || L.stat == DEAD)
		return
	if(L.health < H.crit_threshold && volume > 14) //If you are in crit, and someone injects at least 15u into you at once, you will heal 30% of your physical damage instantly.
		to_chat(L, span_userdanger("You feel a rush of energy through your veins!"))
		L.adjustBruteLoss(-L.getBruteLoss(TRUE) * 0.30)
		L.adjustFireLoss(-L.getFireLoss(TRUE) * 0.30)
		if(H.blood_volume < BLOOD_VOLUME_SURVIVE) //stabilize if in crit.
			H.blood_volume = BLOOD_VOLUME_SURVIVE+5
		L.do_jitter_animation(5)
		TIMER_COOLDOWN_START(L, name, 300 SECONDS)

/datum/reagent/medicine/inaprovaline/on_mob_delete(mob/living/L, metabolism)
	REMOVE_TRAIT(L, TRAIT_NOBREATH, "[type]")
	return ..()

/datum/reagent/medicine/inaprovaline/on_mob_life(mob/living/L, metabolism)
	var/mob/living/carbon/human/H = L
	if(L.health < H.crit_threshold && volume >= 1)
		if(H.blood_volume < BLOOD_VOLUME_SURVIVE) //stabilize if in crit.
			H.blood_volume = BLOOD_VOLUME_SURVIVE+5
	return ..()

/datum/reagent/medicine/inaprovaline/overdose_process(mob/living/L, metabolism)
	L.do_jitter_animation(5) //Overdose causes a spasm
	L.Unconscious(40 SECONDS)
	var/obj/item/organ/heart/E = L.getorganslot(ORGAN_SLOT_HEART)
	E.take_damage(0.5, TRUE)

/datum/reagent/medicine/soporpot/fast_acting
	name = "Fast acting soporific poison"
	description = "Quick working sedative, but also quicker to metabolize off."
	reagent_state = LIQUID
	color = "#22a383"
	taste_description = "sleepiness"
	overdose_threshold = 0
	metabolization_rate = 1 * REAGENTS_METABOLISM
	alpha = 225

/datum/reagent/medicine/soporpot/fast_acting/on_mob_life(mob/living/carbon/M)
	M.confused += 4
	M.dizziness += 4
	M.adjust_energy(-50)
	if(M.stamina > 75)
		M.drowsyness += 8
	else
		M.adjust_stamina(15)
	..()
	. = 1
