/datum/job/innkeep
	title = "Innkeep"
	tutorial = "Liquor, lodging, and lavish meals... your business is the beating heart of Phantom Kingdom slums. \
	You're the one who provides the the hardworking townsfolk with a place to eat and drink their sorrows away, \
	and accommodations for weary travelers passing through. As an ex adventuerer,\
	you can hire aspiring wanderers as mercenaries, your inn has some supplies and a head machine fit for it."
	flag = INNKEEP
	department_flag = SERFS
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_INNKEEP
	faction = FACTION_TOWN
	total_positions = 1
	spawn_positions = 1
	min_pq = -10
	bypass_lastclass = TRUE

	allowed_races = RACES_PLAYER_ALL

	outfit = /datum/outfit/job/innkeep
	give_bank_account = 60
	cmode_music = 'sound/music/cmode/towner/CombatInn.ogg'

/datum/outfit/job/innkeep
	job_bitflag = BITFLAG_CONSTRUCTOR

/datum/outfit/job/innkeep/pre_equip(mob/living/carbon/human/H)
	..()
	//legendary two hand woyer adventurer go
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE) // two handed weapons require a LOT of stamina.
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 3, TRUE)
	H.change_stat(STATKEY_PER, 1)
	H.change_stat(STATKEY_END, 1)
	H.change_stat(STATKEY_CON, 2)
	H.change_stat(STATKEY_STR, 2)
	if(H.age == AGE_OLD)
		H.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
	H.verbs |= /mob/proc/haltyell
	cloak = /obj/item/clothing/cloak/apron/waist
	if(H.gender == MALE)
		pants = /obj/item/clothing/pants/tights/random
		shirt = /obj/item/clothing/shirt/shortshirt/random
	else
		armor = /obj/item/clothing/shirt/dress
	shoes = /obj/item/clothing/shoes/shortboots
	belt = /obj/item/storage/belt/leather
	neck = /obj/item/storage/belt/pouch/coins/mid
	beltl = /obj/item/storage/keyring/innkeep
	beltr = /obj/item/reagent_containers/glass/bottle/beer/blackgoat
	backpack_contents = list(/obj/item/recipe_book/cooking = 1, /obj/item/weapon/knife/dagger/steel/special = 1, /obj/item/rope/chain = 1)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, type)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, type)
	ADD_TRAIT(H, TRAIT_BREADY, type)
	ADD_TRAIT(H, TRAIT_OLDPARTY, type)
	ADD_TRAIT(H, TRAIT_BOOZE_SLIDER, TRAIT_GENERIC)
