/datum/job/guardsman
	title = "Lawbringer"
	tutorial = "You are a member of the Lawbringers. \
	It is not nobility, or anything extraordinary, You don't decide the laws either... It's just a name,\
	likely to make it sound more appealing than a town guard..., \
	The Monarch hired you after brigands and lowlifes caused more damage to his land than your wage would cost him.\
	So you are to make order in the town and protect the land of the Monarch."
	flag = GUARDSMAN
	department_flag = GARRISON
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_CITYWATCHMEN
	faction = FACTION_TOWN
	total_positions = 3
	spawn_positions = 3
	min_pq = 4
	bypass_lastclass = TRUE

	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_IMMORTAL)
	allowed_races = RACES_PLAYER_GUARD

	outfit = /datum/outfit/job/guardsman	//Default outfit.
	advclass_cat_rolls = list(CTAG_GARRISON = 20)	//Handles class selection.
	give_bank_account = 30
	cmode_music = 'sound/music/cmode/garrison/CombatGarrison.ogg'

//................. Lawbringermen Base .............. //
/datum/outfit/job/guardsman/pre_equip(mob/living/carbon/human/H)
	. = ..()
	cloak = pick(/obj/item/clothing/cloak/half/guard, /obj/item/clothing/cloak/half/guardsecond)
	pants = /obj/item/clothing/pants/trou/leather
	wrists = /obj/item/rope/chain
	shoes = /obj/item/clothing/shoes/boots
	belt = /obj/item/storage/belt/leather
	gloves = /obj/item/clothing/gloves/leather
	if(H.dna && !(H.dna.species.id in RACES_PLAYER_NONDISCRIMINATED)) // to prevent examine stress
		mask = /obj/item/clothing/face/shepherd

/datum/outfit/job/guardsman/post_equip(mob/living/carbon/human/H)
	. = ..()
	if(H.cloak)
		if(!findtext(H.cloak.name,"([H.real_name])"))
			H.cloak.name = "[H.cloak.name]"+" "+"([H.real_name])"

// EVERY TOWN GUARD SHOULD HAVE AT LEAST THREE CLUB SKILL

//................. Axes, Maces, Swords, Shields .............. //
/datum/advclass/garrison/footman
	name = "Lawbringer Footman"
	tutorial = "You are a member of the Lawbringer. \
	You are well versed in holding the line with a shield while wielding a trusty sword, axe, or mace in the other hand. You are the shield of the Lawbringers."
	outfit = /datum/outfit/job/guardsman/footman
	category_tags = list(CTAG_GARRISON)

/datum/outfit/job/guardsman/footman/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/helmet/townwatch
	neck = /obj/item/clothing/neck/gorget
	armor = /obj/item/clothing/armor/cuirass
	shirt = /obj/item/clothing/armor/chainmail
	backr = /obj/item/weapon/shield/heater
	backl = /obj/item/storage/backpack/satchel
	wrists = /obj/item/clothing/wrists/bracers
	beltr = /obj/item/weapon/sword/short
	beltl = /obj/item/weapon/mace/cudgel
	scabbards = list(/obj/item/weapon/scabbard/sword)
	backpack_contents = list(/obj/item/storage/keyring/guard, /obj/item/weapon/knife/dagger/steel/special)


	H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE) // Guards should be going for less than lethal in reality. Unarmed would be a primary thing.
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.change_stat(STATKEY_STR, 1)
	H.change_stat(STATKEY_END, 2)
	H.change_stat(STATKEY_CON, 2)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell

//................. Archer .............. //
/datum/advclass/garrison/archer
	name = "Lawbringer Archer"
	tutorial = "You are a member of the Lawbringers. Your training with bows makes you a formidable threat when perched atop the walls or rooftops, raining arrows down upon foes with impunity."
	outfit = /datum/outfit/job/guardsman/archer
	category_tags = list(CTAG_GARRISON)

/datum/outfit/job/guardsman/archer/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/helmet/townwatch/alt
	neck = /obj/item/clothing/neck/chaincoif
	armor = /obj/item/clothing/armor/gambeson/heavy
	shirt = pick(/obj/item/clothing/shirt/undershirt/colored/guard, /obj/item/clothing/shirt/undershirt/colored/guardsecond)
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
	backl = /obj/item/storage/backpack/satchel
	beltr = /obj/item/ammo_holder/quiver/arrows
	beltl = /obj/item/weapon/mace/cudgel
	backpack_contents = list(/obj/item/storage/keyring/guard, /obj/item/weapon/knife/dagger/steel/special)
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE) // Main Weapons
		H.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE) // Backup
		H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE) //sidearm
		H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE) // Getting up onto vantage points is common for archers.
		H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.change_stat(STATKEY_PER, 2)
		H.change_stat(STATKEY_END, 1)
		H.change_stat(STATKEY_SPD, 2)
		ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
		H.verbs |= /mob/proc/haltyell

/datum/advclass/garrison/pikeman
	name = "Lawbringer Pikeman"
	tutorial = "You are a pikeman in the Lawbringers. You are less fleet of foot compared to the rest, but you are strong and well practiced with spears, pikes, billhooks - all the various polearms for striking enemies from a distance."
	outfit = /datum/outfit/job/guardsman/pikeman

	category_tags = list(CTAG_GARRISON)

/datum/outfit/job/guardsman/pikeman/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/helmet/townwatch
	armor = /obj/item/clothing/armor/chainmail
	shirt = /obj/item/clothing/armor/gambeson
	neck = /obj/item/clothing/neck/gorget
	backl = /obj/item/storage/backpack/satchel
	backr = /obj/item/weapon/polearm/spear
	beltl = /obj/item/weapon/sword/short
	beltr = /obj/item/weapon/mace/cudgel
	scabbards = list(/obj/item/weapon/scabbard/sword)
	backpack_contents = list(/obj/item/storage/keyring/guard, /obj/item/weapon/knife/dagger/steel/special)

	//Stats for class
	H.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.change_stat(STATKEY_STR, 2)
	H.change_stat(STATKEY_END, 1)
	H.change_stat(STATKEY_CON, 1)
	H.change_stat(STATKEY_SPD, -1) // Stronk and gets training in hard hitting polearms, but slower
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell

/mob/proc/haltyell()
	set name = "HALT!"
	set category = "Noises"
	emote("haltyell")

/datum/advclass/garrison/claymore
	name = "Lawbringer Claymorer"
	tutorial = "You are pretty much the signature of the Lawbringers. An Intimidating hulking presence with a massive sword."
	outfit = /datum/outfit/job/guardsman/claymore

	category_tags = list(CTAG_GARRISON)

/datum/outfit/job/guardsman/claymore/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/helmet/townwatch
	armor = /obj/item/clothing/armor/cuirass
	shirt = /obj/item/clothing/armor/chainmail
	neck = /obj/item/clothing/neck/gorget
	backl = /obj/item/storage/backpack/satchel
	backr = /obj/item/weapon/sword/long/greatsword/steelclaymore
	beltl = /obj/item/weapon/sword/short
	beltr = /obj/item/weapon/mace/cudgel
	backpack_contents = list(/obj/item/storage/keyring/guard, /obj/item/weapon/knife/dagger/steel/special)

	//Stats for class
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.change_stat(STATKEY_STR, 3)
	H.change_stat(STATKEY_CON, 1)
	H.change_stat(STATKEY_SPD, -1) // Stronk but slower
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_KNOWBANDITS, TRAIT_GENERIC)
	H.verbs |= /mob/proc/haltyell
