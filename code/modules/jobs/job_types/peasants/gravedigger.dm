/datum/job/undertaker
	title = "Mortician"
	tutorial = "While you are not directly connected to the church, as any mortician you are taught prayers \
	and have a certain degree of religious connection to the Last Death, in order to properly perform your duties. \
	You haul bodies off the streets and gutter, process them in the processing chamber, or give them a burial depending on the situation. \
	...Sometimes there is need for live donors for the machines.. And you know how to use your hands. Good thing you are paid handsomely by the keep."
	flag = MORTICIAN
	department_flag = SERFS
	display_order = JDO_MORTICIAN
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	faction = FACTION_TOWN
	total_positions = 2
	spawn_positions = 2
	min_pq = -10
	bypass_lastclass = TRUE

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_PLAYER_NONHERETICAL
	allowed_patrons = list(/datum/patron/divine/last_death)

	outfit = /datum/outfit/job/undertaker
	give_bank_account = TRUE
	cmode_music = 'sound/music/cmode/church/CombatGravekeeper.ogg'

/datum/outfit/job/undertaker
	allowed_patrons = list(/datum/patron/divine/last_death)
	job_bitflag = BITFLAG_CHURCH

/datum/outfit/job/undertaker/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/padded/deathshroud
	neck = /obj/item/clothing/neck/psycross/silver/last_death
	pants = /obj/item/clothing/pants/trou/leather/mourning
	shirt = /obj/item/clothing/armor/gambeson
	armor = /obj/item/clothing/armor/chainmail
	cloak = /obj/item/clothing/shirt/robe/last_death
	wrists = /obj/item/clothing/wrists/bracers/iron
	shoes = /obj/item/clothing/shoes/boots
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/storage/keyring/mortician
	beltr = /obj/item/storage/belt/pouch/coins/mid
	backr = /obj/item/weapon/shovel
	backl = /obj/item/storage/backpack/satchel/surgbag/shit
	ring = /obj/item/scomstone/bad
	H.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE) // these are basically the acolyte skills with a bit of other stuff
	H.adjust_skillrank(/datum/skill/misc/medicine, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.adjust_skillrank(/datum/skill/magic/holy, 3, TRUE)
	H.adjust_skillrank(/datum/skill/labor/mathematics, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/engineering, 3, TRUE) //they work da machines
	H.change_stat(STATKEY_STR, 2)
	H.change_stat(STATKEY_CON, 1)
	H.change_stat(STATKEY_INT, 1)
	H.change_stat(STATKEY_END, 2)
	H.change_stat(STATKEY_PER, -1)
	H.change_stat(STATKEY_LCK, -1) // Tradeoff for never being cursed when unearthing graves.
	if(!H.has_language(/datum/language/ancient_english)) // to understand old world machines.
		H.grant_language(/datum/language/ancient_english)
		to_chat(H, "<span class='info'>I can speak Ancient English with ,n before my speech.</span>")
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC) // Operating with corpses every day.
	ADD_TRAIT(H, TRAIT_GRAVEROBBER, TRAIT_GENERIC) // In case they need to move tombs or anything.

	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	C.grant_spells(H)
