/datum/job/undertaker
	title = "Mortician"
	tutorial = "While you are not directly connected to the church, as any mortician you are taught the burial rite incase you need it, \
	You haul bodies off the streets and gutter, process them in the processing chamber, or give them a burial depending on the situation. \
	...Sometimes there is need for live donors for the machines.. And you know how to use your hands. Good thing you are paid handsomely by the keep.\
	You are also expected to clean the streets, or hire someone to do it for you."
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

	outfit = /datum/outfit/job/undertaker
	give_bank_account = 50
	cmode_music = 'sound/music/cmode/church/CombatGravekeeper.ogg'
	spells = list(/obj/effect/proc_holder/spell/targeted/burialrite)

/datum/outfit/job/undertaker
	job_bitflag = BITFLAG_CHURCH

/datum/outfit/job/undertaker/pre_equip(mob/living/carbon/human/H)
	..()
	switch(H.patron?.type)
		if(/datum/patron/divine/astrata)
			neck = /obj/item/clothing/neck/psycross/silver/astrata
		if(/datum/patron/divine/dendor)	// good helmet but no money
			neck = /obj/item/clothing/neck/psycross/silver/dendor
		if(/datum/patron/divine/necra)
			neck = /obj/item/clothing/neck/psycross/silver/necra
		if(/datum/patron/divine/eora)
			neck = /obj/item/clothing/neck/psycross/silver/eora
			H.virginity = FALSE
		if(/datum/patron/divine/ravox)
			neck = /obj/item/clothing/neck/psycross/silver/ravox
		if(/datum/patron/divine/noc)
			neck = /obj/item/clothing/neck/psycross/noc
		if(/datum/patron/divine/pestra)
			neck = /obj/item/clothing/neck/psycross/silver/pestra
		if(/datum/patron/divine/abyssor)
			neck = /obj/item/clothing/neck/psycross/silver/abyssor
		if(/datum/patron/divine/malum)
			neck = /obj/item/clothing/neck/psycross/silver/malum
		if(/datum/patron/divine/xylix)
			neck = /obj/item/clothing/neck/psycross/silver/xylix
		if(/datum/patron/inhumen/graggar) // Heretical Patrons
			neck = /obj/item/clothing/neck/chaincoif/iron
			H.change_stat(STATKEY_LCK, -1)
			GLOB.heretical_players += H.real_name
		if(/datum/patron/inhumen/zizo)
			neck = /obj/item/clothing/neck/chaincoif/iron
			H.change_stat(STATKEY_LCK, -1)
			GLOB.heretical_players += H.real_name
		if(/datum/patron/inhumen/matthios)
			neck = /obj/item/clothing/neck/chaincoif/iron
			H.change_stat(STATKEY_LCK, -1)
			GLOB.heretical_players += H.real_name
		if(/datum/patron/inhumen/baotha)
			neck = /obj/item/clothing/neck/chaincoif/iron
			H.change_stat(STATKEY_LCK, -1)
			H.virginity = FALSE
			GLOB.heretical_players += H.real_name
		else // Failsafe
			neck = /obj/item/clothing/neck/psycross

	head = /obj/item/clothing/head/padded/deathshroud
	pants = /obj/item/clothing/pants/trou/leather/mourning
	shirt = /obj/item/clothing/armor/gambeson
	armor = /obj/item/clothing/armor/chainmail
	cloak = /obj/item/clothing/shirt/robe/necra
	wrists = /obj/item/clothing/wrists/bracers/iron
	shoes = /obj/item/clothing/shoes/boots
	gloves = /obj/item/clothing/gloves/angle
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/storage/keyring/mortician
	beltr = /obj/item/weapon/mace/cudgel
	backr = /obj/item/weapon/shovel
	backl = /obj/item/storage/backpack/satchel/black
	ring = /obj/item/scomstone/bad
	backpack_contents = list(/obj/item/weapon/knife/dagger/steel = 1, /obj/item/rope = 1, /obj/item/clothing/head/sack = 1)
	H.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE) // these are basically the acolyte skills with a bit of other stuff
	H.adjust_skillrank(/datum/skill/misc/medicine, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
	H.adjust_skillrank(/datum/skill/labor/mathematics, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/engineering, 3, TRUE) //they work da machines
	H.adjust_skillrank(/datum/skill/labor/butchering, 3, TRUE)
	H.change_stat(STATKEY_STR, 2)
	H.change_stat(STATKEY_CON, 1)
	H.change_stat(STATKEY_END, 2)
	H.change_stat(STATKEY_LCK, -1) // Tradeoff for never being cursed when unearthing graves.
	if(!H.has_language(/datum/language/ancient_english)) // to understand old world machines.
		H.grant_language(/datum/language/ancient_english)
		to_chat(H, "<span class='info'>I can speak Ancient English with ,n before my speech.</span>")
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC) // Operating with corpses every day.
	ADD_TRAIT(H, TRAIT_GRAVEROBBER, TRAIT_GENERIC) // In case they need to move tombs or anything.
	ADD_TRAIT(H, TRAIT_DEATHSIGHT, TRAIT_GENERIC)

	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

/obj/item/book/mortus
	name = "Guide of Mortus"
	desc = "For the butcher of mankind."
	icon_state ="book6_0"
	base_icon_state = "book6"
	bookfile = "mortus.json"
