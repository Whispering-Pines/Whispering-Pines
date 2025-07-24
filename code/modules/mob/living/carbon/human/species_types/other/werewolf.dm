/mob/living/carbon/human/species/werewolf
	race = /datum/species/werewolf
	footstep_type = FOOTSTEP_MOB_HEAVY
	var/datum/language_holder/stored_language
	var/list/stored_skills
	var/list/stored_experience
	flags_1 = PREVENT_CONTENTS_EXPLOSION_1

/mob/living/carbon/human/species/werewolf/male
	gender = MALE

/mob/living/carbon/human/species/werewolf/female
	gender = FEMALE

/mob/living/carbon/human/species/werewolf/child
	age = AGE_CHILD
	erpable = FALSE

/datum/species/werewolf
	name = "werewolf"
	id = "werewolf"

	species_traits = list(NO_UNDERWEAR, NOEYESPRITES)
	inherent_traits = list(TRAIT_NOSTAMINA, TRAIT_RESISTHEAT, TRAIT_RESISTCOLD, TRAIT_RESISTHIGHPRESSURE, TRAIT_RESISTLOWPRESSURE, TRAIT_RADIMMUNE, TRAIT_NODISMEMBER, TRAIT_DEATHBYSNOOSNOO)
	inherent_biotypes = MOB_HUMANOID

	no_equip = list(ITEM_SLOT_SHIRT, ITEM_SLOT_HEAD, ITEM_SLOT_MASK, ITEM_SLOT_ARMOR, ITEM_SLOT_GLOVES, ITEM_SLOT_SHOES, ITEM_SLOT_PANTS, ITEM_SLOT_CLOAK, ITEM_SLOT_BELT, ITEM_SLOT_BACK_R, ITEM_SLOT_BACK_L)

	offset_features_m = list(OFFSET_HANDS = list(0,2))
	offset_features_f = list(OFFSET_HANDS = list(0,2))

	soundpack_m = /datum/voicepack/werewolf
	soundpack_f = /datum/voicepack/werewolf

	specstats_m = list(STATKEY_STR = 5, STATKEY_PER = 5, STATKEY_INT = -3, STATKEY_CON = 5, STATKEY_END = 5, STATKEY_SPD = 3, STATKEY_LCK = 0)
	specstats_f = list(STATKEY_STR = 5, STATKEY_PER = 5, STATKEY_INT = -3, STATKEY_CON = 5, STATKEY_END = 5, STATKEY_SPD = 3, STATKEY_LCK = 0)

	enflamed_icon = "widefire"

	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes/night_vision/werewolf,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_GUTS = /obj/item/organ/filling_organ/guts,
	)

	changesource_flags = WABBAJACK
	bleed_mod = 0.2
	pain_mod = 0.2

	var/wwbreastsize = 2

/datum/species/halforc/get_span_language(datum/language/message_language)
	if(!message_language)
		return
	if(message_language.type == /datum/language/beast)
		return list(SPAN_BEAST)
	return message_language.spans

/datum/species/werewolf/send_voice(mob/living/carbon/human/H)
	playsound(get_turf(H), pick('sound/vo/mobs/wwolf/wolftalk1.ogg', 'sound/vo/mobs/wwolf/wolftalk2.ogg'), 100, TRUE, -1)

/datum/species/werewolf/regenerate_icons(mob/living/carbon/human/H)
	H.icon = 'modular_whisper/icons/mob/monster/werewolf.dmi'
	H.base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, /datum/intent/simple/wereclaw, /datum/intent/simple/werebite)

	if(H.age != AGE_CHILD)
		if(!H.sexcon)
			H.sexcon = new /datum/sex_controller(src)
		if(H.stored_mob)
			//checks if the person has genitals, for sprites.
			var/obj/item/organ/penis/penis = H.stored_mob.getorganslot(ORGAN_SLOT_PENIS)
			var/obj/item/organ/filling_organ/breasts/breasts = H.stored_mob.getorganslot(ORGAN_SLOT_BREASTS)
			var/obj/item/organ/filling_organ/vagina/vagina = H.stored_mob.getorganslot(ORGAN_SLOT_VAGINA)
			if(breasts)
				if(breasts.organ_size <= 2)
					wwbreastsize = 1
				else if(breasts.organ_size >= 4)
					wwbreastsize = 3
				else
					wwbreastsize = 2
			if(penis && !breasts && !vagina) //basic male
				if(H.sexcon.arousal >= 20)
					H.icon_state = "wwolf_m-e"
				else if (H.sexcon.arousal >= 10)
					H.icon_state = "wwolf_m-p"
				else
					H.icon_state = "wwolf_m"
			else if(!penis && breasts && vagina) //basic female
				H.icon_state = "wwolf_f-[wwbreastsize]"
			else if (penis && breasts && !vagina) //dicked female without vagina
				if(H.sexcon.arousal >= 20)
					H.icon_state = "wwolf_g-e-[wwbreastsize]"
				else if (H.sexcon.arousal >= 10)
					H.icon_state = "wwolf_g-p-[wwbreastsize]"
				else
					H.icon_state = "wwolf_g-[wwbreastsize]"
			else if(penis && vagina) //dicked female with vagina
				if(H.sexcon.arousal >= 20)
					H.icon_state = "wwolf_g-e-[wwbreastsize]"
				else if (H.sexcon.arousal >= 10)
					H.icon_state = "wwolf_g-p-[wwbreastsize]"
				else
					H.icon_state = "wwolf_g-[wwbreastsize]"
			else //you got no tools, sorry, or you're andro.
				H.icon_state = "wwolf_n"
		else
			if(H.gender == MALE)
				if(H.sexcon.arousal >= 20)
					H.icon_state = "wwolf_m-e"
				else if (H.sexcon.arousal >= 10)
					H.icon_state = "wwolf_m-p"
				else
					H.icon_state = "wwolf_m"
			else if(H.gender == FEMALE)
				H.icon_state = "wwolf_f-3"
				if(H.getorganslot(ORGAN_SLOT_PENIS)) //Dickgirl
					if(H.sexcon.arousal >= 20)
						H.icon_state = "wwolf_g-e-3"
					else if (H.sexcon.arousal >= 10)
						H.icon_state = "wwolf_g-p-3"
					else
						H.icon_state = "wwolf_g-3"
			else if(H.gender == NEUTER)
				H.icon_state = "wwolf_n"
	H.update_damage_overlays()
	return TRUE

/datum/species/werewolf/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.remove_all_languages()
	C.grant_language(/datum/language/beast)

/datum/species/werewolf/update_damage_overlays(mob/living/carbon/human/H)
	H.remove_overlay(DAMAGE_LAYER)
	var/list/hands = list()
	var/mutable_appearance/inhand_overlay = mutable_appearance("[H.icon_state]-dam", layer=-DAMAGE_LAYER)
	var/burnhead = 0
	var/brutehead = 0
	var/burnch = 0
	var/brutech = 0
	var/obj/item/bodypart/affecting = H.get_bodypart(BODY_ZONE_HEAD)
	if(affecting)
		burnhead = (affecting.burn_dam / affecting.max_damage)
		brutehead = (affecting.brute_dam / affecting.max_damage)
	affecting = H.get_bodypart(BODY_ZONE_CHEST)
	if(affecting)
		burnch = (affecting.burn_dam / affecting.max_damage)
		brutech = (affecting.brute_dam / affecting.max_damage)
	var/usedloss = 0
	if(burnhead > usedloss)
		usedloss = burnhead
	if(brutehead > usedloss)
		usedloss = brutehead
	if(burnch > usedloss)
		usedloss = burnch
	if(brutech > usedloss)
		usedloss = brutech
	inhand_overlay.alpha = 255 * usedloss
	hands += inhand_overlay
	H.overlays_standing[DAMAGE_LAYER] = hands
	H.apply_overlay(DAMAGE_LAYER)
	return TRUE

/datum/species/werewolf/random_name(gender,unique,lastname)
	return "WEREWOLF"

/datum/species/werewolf/check_species_weakness(obj/item, mob/living/attacker, mob/living/parent)
	if(parent.has_status_effect(/datum/status_effect/debuff/silver_curse))
		return 0.75
	return 0
