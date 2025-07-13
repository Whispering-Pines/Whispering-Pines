GLOBAL_VAR(lordsurname)
GLOBAL_LIST_EMPTY(lord_titles)

/datum/job/lord
	title = "Monarch"
	var/ruler_title = "Monarch"
	tutorial = "Elevated to your 'throne' through being filthy rich and grasping post apocalyptic monopoly, you own this entire island, the one next to it and the people \
	within it which you must tolerate to keep the casings flowing through taxation for nearly no services you provide. Though they may try for your life for the earliest inconvenience, majority of your spending has been going \
	for yourself rather than anyone else. Show them the error of their ways."
	flag = LORD
	department_flag = NOBLEMEN
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_LORD
	faction = FACTION_TOWN
	total_positions = 1
	spawn_positions = 1
	min_pq = 10

	spells = list(
		/datum/action/cooldown/spell/undirected/list_target/grant_title,
		/datum/action/cooldown/spell/undirected/list_target/grant_nobility,
	)

	allowed_races = RACES_PLAYER_NONDISCRIMINATED

	outfit = /datum/outfit/job/lord
	bypass_lastclass = TRUE
	give_bank_account = 500
	selection_color = "#7851A9"

	cmode_music = 'sound/music/cmode/nobility/combat_noble.ogg'
	can_have_apprentices = FALSE

/datum/job/lord/get_informed_title(mob/mob)
	return "[ruler_title]"

//TODO: MOVE THIS INTO TICKER INIT
/datum/job/lord/after_spawn(mob/living/spawned, client/player_client)
	..()
	SSticker.rulermob = spawned
	var/mob/living/carbon/human/H = spawned
	addtimer(CALLBACK(H, TYPE_PROC_REF(/mob, lord_color_choice)), 5 SECONDS)
	if(spawned.gender == MALE)
		SSfamilytree.AddRoyal(H, FAMILY_FATHER)
		ruler_title = "[SSmapping.config.monarch_title]"
	else
		SSfamilytree.AddRoyal(H, FAMILY_MOTHER)
		ruler_title = "[SSmapping.config.monarch_title_f]"
	to_chat(world, "<b>[span_notice(span_big("[H.real_name] is [ruler_title] of [SSmapping.config.map_name]."))]</b>")
	to_chat(world, "<br>")
	if(GLOB.keep_doors.len > 0)
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(know_keep_door_password), H), 7 SECONDS)

/datum/outfit/job/lord
	job_bitflag = BITFLAG_ROYALTY

/datum/outfit/job/lord/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/crown/serpcrown
	backr = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/plaquegold
	backpack_contents = list(/obj/item/weapon/knife/dagger/steel/special = 1, /obj/item/scomstone = 1)
	ring = /obj/item/clothing/ring/active/nomag
	l_hand = /obj/item/weapon/lordscepter
	H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
	H.adjust_skillrank(/datum/skill/labor/mathematics, 3, TRUE)
	if(H.age == AGE_OLD)
		H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.change_stat(STATKEY_STR, 2) //to beat your wife efficently.
	H.change_stat(STATKEY_INT, 3)
	if(H.gender == MALE)
		pants = /obj/item/clothing/pants/tights/black
		shirt = /obj/item/clothing/shirt/undershirt/black
		armor = /obj/item/clothing/armor/gambeson/arming
		shoes = /obj/item/clothing/shoes/boots
		cloak = /obj/item/clothing/cloak/lordcloak
		if(H.dna?.species)
			if(H.dna.species.id == "human")
				H.dna.species.soundpack_m = new /datum/voicepack/male/evil()
	else
		pants = /obj/item/clothing/pants/tights/random
		armor = /obj/item/clothing/shirt/dress/royal
		shirt = /obj/item/clothing/armor/gambeson/heavy
		shoes = /obj/item/clothing/shoes/shortboots
		cloak = /obj/item/clothing/cloak/lordcloak/ladycloak
		wrists = /obj/item/clothing/wrists/royalsleeves

		if(H.wear_mask)
			if(istype(H.wear_mask, /obj/item/clothing/face/eyepatch))
				qdel(H.wear_mask)
				mask = /obj/item/clothing/face/lordmask
			if(istype(H.wear_mask, /obj/item/clothing/face/eyepatch/left))
				qdel(H.wear_mask)
				mask = /obj/item/clothing/face/lordmask/l

	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNOWKEEPPLANS, TRAIT_GENERIC)

	var/classes = list(
	"Monarch",
	)
	if(isresurgentis(H))
		classes += "Ancestor"
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes
	switch(classchoice)
		if("Monarch")
			Monarch(H)
		if("Ancestor") //the TRUE ruler of the land.
			Ancestor(H)

/datum/outfit/job/lord/proc/Monarch(mob/living/carbon/human/H)
	//literally what you get from the parent

/datum/outfit/job/lord/proc/Ancestor(mob/living/carbon/human/H)
	H.dna.species.species_traits |= DRINKSBLOOD
	H.dna.species.liked_food = CANNIBAL
	H.dna.species.disliked_food = GROSS
	H.dna.species.toxic_food = VEGETABLES|GRAIN|FRUIT|DAIRY|FRIED|PINEAPPLE|CLOTH
	ADD_TRAIT(H, TRAIT_NOBREATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_UGLY, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DARKVISION, TRAIT_GENERIC)
	if(H.wear_mask)
		qdel(H.wear_mask)
		mask = /obj/item/clothing/face/facemask/goldmask
	to_chat(H, span_notice("I am ancient, one of the first Resurgentis to ever exist and rightful owner of the throne, I witnessed with my very own eyes when the Last Death himself made me out of whatever husk I was in my previous life. Unfortunately this semi undead body of mine rotted in time and is hideous... Also unfortunately, I am forced in a cannibal diet due to my strange body."))
	H.AddComponent(/datum/component/rot/stinky_person)
	//The true ruler, likely to have many idiots rising up against him for being so hideous and an undead. vro is basically vlord.
	H.change_stat(STATKEY_STR, 2) //4 after parent
	H.change_stat(STATKEY_INT, 2) //5 after parent
	H.change_stat(STATKEY_LCK, 2) //1 Compensation for ugly luck debuff + being chosen of last death
	H.change_stat(STATKEY_END, 3)
	H.change_stat(STATKEY_CON, 3)

/datum/job/exlord //just used to change the lords title
	title = "Ex-Monarch"
	flag = LORD
	department_flag = NOBLEMEN
	faction = FACTION_TOWN
	total_positions = 0
	spawn_positions = 0
	display_order = JDO_LORD

/proc/give_lord_surname(mob/living/carbon/human/family_guy, preserve_original = FALSE)
	if(!GLOB.lordsurname)
		return
	if(preserve_original)
		family_guy.fully_replace_character_name(family_guy.real_name, family_guy.real_name + " " + GLOB.lordsurname)
		return family_guy.real_name
	var/list/chopped_name = splittext(family_guy.real_name, " ")
	if(length(chopped_name) > 1)
		family_guy.fully_replace_character_name(family_guy.real_name, chopped_name[1] + " " + GLOB.lordsurname)
	else
		family_guy.fully_replace_character_name(family_guy.real_name, family_guy.real_name + " " + GLOB.lordsurname)
	return family_guy.real_name
