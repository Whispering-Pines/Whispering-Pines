/* *
 * Deranged Knight
 * A miniboss for quest system, designed to be a high-level challenge for multiple players.
 * Uses fuckoff gear that should not be looted - hence snowflake dismemberment code.
 */

/*
GLOBAL_LIST_INIT(matthios_aggro, world.file2list("strings/rt/matthiosaggrolines.txt"))
GLOBAL_LIST_INIT(zizo_aggro, world.file2list("strings/rt/zizoaggrolines.txt"))
GLOBAL_LIST_INIT(graggar_aggro, world.file2list("strings/rt/graggaraggrolines.txt"))
GLOBAL_LIST_INIT(hedgeknight_aggro, world.file2list("strings/rt/hedgeknightaggrolines.txt"))
*/

/mob/living/carbon/human/species/human/northern/deranged_knight
	faction = list("dundead")
	ambushable = FALSE
	dodgetime = 30
	flee_in_pain = TRUE
	possible_rmb_intents = list(
		/datum/rmb_intent/feint,\
		/datum/rmb_intent/aimed,\
		/datum/rmb_intent/strong,\
		/datum/rmb_intent/riposte,\
		/datum/rmb_intent/weak
	)
	var/is_silent = FALSE /// Determines whether or not we will scream our funny lines at people.
	var/preset = "matthios"
	ai_controller = /datum/ai_controller/human_npc
	dodgetime = 15 //they can dodge easily, but have a cooldown on it
	wander = TRUE
	canparry = TRUE
	erpable = TRUE

//idk how to implement this to the ai
/*
/mob/living/carbon/human/species/human/northern/deranged_knight/retaliate()
	. = ..()
	if(!is_silent)
		if(preset == "matthios")
			emote_see = GLOB.matthios_aggro
		else if(preset == "zizo")
			emote_see = GLOB.zizo_aggro
		else if(preset == "graggar")
			emote_see = GLOB.graggar_aggro
		else if(preset == "hedgeknight")
			emote_see = GLOB.hedgeknight_aggro
*/

/mob/living/carbon/human/species/human/northern/deranged_knight/Initialize()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)
	is_silent = TRUE
	var/head = get_bodypart(BODY_ZONE_HEAD)
	RegisterSignal(head, COMSIG_MOB_DISMEMBER, PROC_REF(handle_drop_limb))

/mob/living/carbon/human/species/human/northern/deranged_knight/Destroy()
	var/head = get_bodypart(BODY_ZONE_HEAD)
	if(head)
		UnregisterSignal(head, COMSIG_MOB_DISMEMBER)
	return ..()

/// Snowflake DK behavior for decaps. Yes, they turn to dust prior to decaps.
/mob/living/carbon/human/species/human/northern/deranged_knight/proc/handle_drop_limb(obj/item/bodypart/bodypart, special)
	if(!istype(bodypart, /obj/item/bodypart/head))
		return

	death(FALSE, TRUE) // No, you won't loot that tasty helmet.
	return COMPONENT_CANCEL_DISMEMBER

/mob/living/carbon/human/species/human/northern/deranged_knight/after_creation()
	..()
	job = "Ascendant Knight"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOSTAMINA, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_STUCKITEMS, TRAIT_GENERIC)
	switch(rand(0, 100))
		if(0 to 25)
			preset = "graggar"
			equipOutfit(new /datum/outfit/job/quest_miniboss/graggar)
		if(26 to 49)
			preset = "matthios"
			equipOutfit(new /datum/outfit/job/quest_miniboss/matthios)
		if(50 to 75)
			preset = "zizo"
			equipOutfit(new /datum/outfit/job/quest_miniboss/zizo)
		else
			preset = "hedgeknight"
			if(prob(50))
				equipOutfit(new /datum/outfit/job/quest_miniboss/hedge_knight)
			else
				equipOutfit(new /datum/outfit/job/quest_miniboss/blacksteel)
	gender = pick(MALE,FEMALE)
	regenerate_icons()

	var/obj/item/organ/eyes/organ_eyes = getorgan(/obj/item/organ/eyes)
	var/obj/item/organ/ears/organ_ears = getorgan(/obj/item/organ/ears)
	var/obj/item/bodypart/head/head = get_bodypart(BODY_ZONE_HEAD)
	var/hairf = pick(list(/datum/sprite_accessory/hair/head/himecut,
						/datum/sprite_accessory/hair/head/countryponytailalt,
						/datum/sprite_accessory/hair/head/stacy,
						/datum/sprite_accessory/hair/head/kusanagi_alt))
	var/hairm = pick(list(/datum/sprite_accessory/hair/head/ponytailwitcher,
						/datum/sprite_accessory/hair/head/dave,
						/datum/sprite_accessory/hair/head/emo,
						/datum/sprite_accessory/hair/head/sabitsuki))

	var/datum/bodypart_feature/hair/head/new_hair = new()

	if(gender == FEMALE)
		new_hair.set_accessory_type(hairf, null, src)
	else
		new_hair.set_accessory_type(hairm, null, src)

	new_hair.accessory_colors = "#DDDDDD"
	new_hair.hair_color = "#DDDDDD"

	head.add_bodypart_feature(new_hair)

	dna.update_ui_block(DNA_HAIR_COLOR_BLOCK)
	dna.species.handle_body(src)

	if(organ_eyes)
		organ_eyes.eye_color = "#FFBF00"
		organ_eyes.accessory_colors = "#FFBF00#FFBF00"

	if(organ_ears)
		organ_ears.accessory_colors = "#5f5f70"

	skin_tone = "5f5f70"

	if(prob(1))
		real_name = "Taras Mura"
	update_body()
	update_body_parts(TRUE)

	var/list/possible_turfs = list()
	for(var/turf/open/T in oview(2, src))
		possible_turfs += T

	for(var/i in 1 to rand(2, 5))
		var/turf/open/spawn_turf = pick_n_take(possible_turfs)
		if(!spawn_turf)
			break

		new /mob/living/carbon/human/species/human/northern/highwayman/dk_goon(spawn_turf)

	def_intent_change(INTENT_PARRY)

/mob/living/carbon/human/species/human/northern/deranged_knight/death(gibbed)
	if(preset == "matthios")
		if(prob(95))
			say("Dismas, I have failed you...", forced = TRUE)
		else
			say("Dismas, is this true?!", forced = TRUE)
	else if(preset == "zizo")
		say("Tenebrase, forgive me!", forced = TRUE)
	else if(preset == "graggar")
		say("No more... Blood!")
	emote("painscream")
	. = ..()
	if(!gibbed)
		dust(FALSE, FALSE, TRUE)

/datum/outfit/job/quest_miniboss/pre_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	H.STASTR = 15
	H.STASPD = 14
	H.STACON = 16
	H.STAEND = 20
	H.STAPER = 12
	H.STAINT = 12
	H.STALUC = 12

	H.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axesmaces, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)

/datum/outfit/job/quest_miniboss/matthios/pre_equip(mob/living/carbon/human/H)
	. = ..()

	armor = /obj/item/clothing/armor/plate/full/matthios
	pants = /obj/item/clothing/pants/platelegs/matthios
	shoes = /obj/item/clothing/shoes/boots/armor/matthios
	wrists = /obj/item/clothing/wrists/bracers
	gloves = /obj/item/clothing/gloves/plate/matthios
	head = /obj/item/clothing/head/helmet/heavy/matthios
	neck = /obj/item/clothing/neck/chaincoif/iron
	r_hand = /obj/item/weapon/flail/peasant
	mask = /obj/item/clothing/face/facemask/steel

/datum/outfit/job/quest_miniboss/zizo/pre_equip(mob/living/carbon/human/H)
	. = ..()

	armor = /obj/item/clothing/armor/plate/full/zizo
	pants = /obj/item/clothing/pants/platelegs/zizo
	shoes = /obj/item/clothing/shoes/boots/armor/zizo
	wrists = /obj/item/clothing/wrists/bracers
	gloves = /obj/item/clothing/gloves/plate/zizo
	head = /obj/item/clothing/head/helmet/heavy/zizo
	neck = /obj/item/clothing/neck/bevor
	r_hand = /obj/item/weapon/sword/long/death
	mask = /obj/item/clothing/face/facemask/steel

/datum/outfit/job/quest_miniboss/graggar/pre_equip(mob/living/carbon/human/H)
	. = ..()

	armor = /obj/item/clothing/armor/plate/blkknight
	pants = /obj/item/clothing/pants/platelegs/blk
	shoes = /obj/item/clothing/shoes/boots/armor/blkknight
	gloves = /obj/item/clothing/gloves/plate/blk
	wrists = /obj/item/clothing/wrists/bracers
	head = /obj/item/clothing/head/helmet/heavy/sinistar
	neck = /obj/item/clothing/neck/bevor
	r_hand = /obj/item/weapon/axe/battle
	mask = /obj/item/clothing/face/facemask/steel
	cloak = /obj/item/clothing/cloak/tabard/blkknight

/datum/outfit/job/quest_miniboss/blacksteel/pre_equip(mob/living/carbon/human/H)
	. = ..()

	armor = /obj/item/clothing/armor/plate/blkknight
	pants = /obj/item/clothing/pants/platelegs/blk
	shoes = /obj/item/clothing/shoes/boots/armor/blkknight
	gloves = /obj/item/clothing/gloves/plate/blk
	wrists = /obj/item/clothing/wrists/bracers
	head = /obj/item/clothing/head/helmet/blacksteel/bucket
	neck = /obj/item/clothing/neck/bevor
	r_hand = /obj/item/weapon/sword/long/death
	mask = /obj/item/clothing/face/facemask/steel

/datum/outfit/job/quest_miniboss/hedge_knight/pre_equip(mob/living/carbon/human/H)
	. = ..()

	armor = /obj/item/clothing/armor/plate/full
	pants = /obj/item/clothing/pants/platelegs
	shoes = /obj/item/clothing/shoes/boots/armor
	gloves = /obj/item/clothing/gloves/plate
	head = /obj/item/clothing/head/helmet/heavy
	neck = /obj/item/clothing/neck/bevor
	r_hand = /obj/item/weapon/sword/long/greatsword/steelclaymore
	mask = /obj/item/clothing/face/facemask/steel
	belt = /obj/item/storage/belt/leather/steel
	beltl = /obj/item/flashlight/flare/torch/lantern
	beltr = /obj/item/weapon/sword/long
	wrists = /obj/item/clothing/wrists/bracers
	cloak = /obj/item/clothing/cloak/stabard/dungeon

/*
 * Goon preset
 * Intended to support knight, but should not have any special/overly expensive gear.
*/

/mob/living/carbon/human/species/human/northern/highwayman/dk_goon
	faction = list("dundead")
