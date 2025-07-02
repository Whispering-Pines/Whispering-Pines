/datum/migrant_role/grenzelhoft/count
	name = "Frozen Empire Count"
	greet_text = "A Count hailing from the Frozen Empire, here on an official visit to the Peninsula of Phantom Kingdom alongside his beloved convoy and spouse."
	allowed_sexes = list(MALE)
	allowed_races = RACES_PLAYER_GRENZ
	outfit = /datum/outfit/job/grenzelhoft_migration/count
	grant_lit_torch = TRUE
	is_foreigner = FALSE

/datum/outfit/job/grenzelhoft_migration/count/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/grenzelhoft
	gloves = /obj/item/clothing/gloves/angle/grenzel
	wrists = /obj/item/clothing/neck/psycross/g
	head = /obj/item/clothing/head/helmet/skullcap/grenzelhoft
	armor = /obj/item/clothing/armor/brigandine
	belt = /obj/item/storage/belt/leather/plaquesilver
	beltl = /obj/item/weapon/sword/sabre/dec
	beltr = /obj/item/flashlight/flare/torch/lantern
	backr = /obj/item/storage/backpack/satchel
	ring = /obj/item/clothing/ring/gold
	shirt = /obj/item/clothing/shirt/grenzelhoft
	pants = /obj/item/clothing/pants/grenzelpants
	neck = /obj/item/clothing/neck/gorget
	backpack_contents = list(/obj/item/storage/belt/pouch/coins/veryrich)
	if(H.mind)
		H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/music, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.adjust_skillrank(/datum/skill/labor/mathematics, 3, TRUE)
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/honorary = "Count"
		H.real_name = "[honorary] [prev_real_name]"
		H.name = "[honorary] [prev_name]"
		H.change_stat(STATKEY_INT, 1)
		H.change_stat(STATKEY_END, 2)
		ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
		H.cmode_music = 'sound/music/cmode/combat_grenzelhoft.ogg'

/datum/migrant_role/grenzelhoft/countess
	name = "Frozen Empire Countess"
	greet_text = "A Countess hailing from the Frozen Empire, here on an official visit to the eastern continent alongside her beloved convoy and husband."
	allowed_sexes = list(FEMALE)
	allowed_races = list(
		"Human",
		"Dwarf"
	)
	outfit = /datum/outfit/job/grenzelhoft_migration/countess
	grant_lit_torch = TRUE
	is_foreigner = FALSE

/datum/outfit/job/grenzelhoft_migration/countess/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/grenzelhoft
	gloves = /obj/item/clothing/gloves/angle/grenzel
	wrists = /obj/item/clothing/neck/psycross/g
	head = /obj/item/clothing/head/helmet/skullcap/grenzelhoft
	armor = /obj/item/clothing/armor/gambeson/heavy/dress/alt
	belt = /obj/item/storage/belt/leather/plaquesilver
	beltl = /obj/item/weapon/sword/rapier/dec
	beltr = /obj/item/flashlight/flare/torch/lantern
	backr = /obj/item/storage/backpack/satchel
	ring = /obj/item/clothing/ring/gold
	shirt = /obj/item/clothing/shirt/grenzelhoft
	pants = /obj/item/clothing/pants/grenzelpants
	neck = /obj/item/clothing/neck/gorget
	backpack_contents = list(/obj/item/storage/belt/pouch/coins/veryrich)
	if(H.mind)
		H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/music, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/honorary = "Countess"
		H.real_name = "[honorary] [prev_real_name]"
		H.name = "[honorary] [prev_name]"
		H.change_stat(STATKEY_INT, 1)
		H.change_stat(STATKEY_END, 2)
		ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
		H.cmode_music = 'sound/music/cmode/nobility/combat_noble.ogg'

/datum/migrant_role/grenzelhoft/grenzelhoft_knight
	name = "Frozen Empire Knight"
	greet_text = "Your liege, the count and the countess have both took the duty gaved by the Kaiser itself to voyage to the eastern continents, ensure their survival and obey their orders."
	allowed_sexes = list(MALE)
	allowed_races = list("Human")
	outfit = /datum/outfit/job/grenzelhoft_migration/grenzelhoft_knight
	is_foreigner = FALSE

/datum/outfit/job/grenzelhoft_migration/grenzelhoft_knight/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.change_stat(STATKEY_STR, 2)
		H.change_stat(STATKEY_END, 2)
		H.change_stat(STATKEY_CON, 2)
		H.change_stat(STATKEY_SPD, -1)
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/honorary = "Ritter"
		if(H.gender == FEMALE)
			honorary = "Ritterin"
		H.real_name = "[honorary] [prev_real_name]"
		H.name = "[honorary] [prev_name]"

	pants = /obj/item/clothing/pants/tights/black
	backr = /obj/item/weapon/sword/long/greatsword/flamberge
	beltl = /obj/item/storage/belt/pouch/coins/mid
	shoes = /obj/item/clothing/shoes/boots/rare/grenzelplate
	gloves = /obj/item/clothing/gloves/rare/grenzelplate
	belt = /obj/item/storage/belt/leather
	shirt = /obj/item/clothing/armor/gambeson
	armor = /obj/item/clothing/armor/rare/grenzelplate
	backl = /obj/item/storage/backpack/satchel
	head = /obj/item/clothing/head/rare/grenzelplate
	wrists = /obj/item/clothing/wrists/bracers
	neck = /obj/item/clothing/neck/chaincoif

	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	H.cmode_music = 'sound/music/cmode/combat_grenzelhoft.ogg'

/datum/migrant_role/grenzelhoft/grenzelhoft_men_at_arms
	name = "Frozen Empire Men-at-Arms"
	greet_text = "You and your fellows are men at arms from Frozen Empire, except your local liege has been sent to the eastern continents, obey the Ritter and make sure the nobles goes home."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Human",
		"Dwarf"
	)
	outfit = /datum/outfit/job/grenzelhoft_migration/grenzelhoft_men_at_arms
	is_foreigner = FALSE

/datum/outfit/job/grenzelhoft_migration/grenzelhoft_men_at_arms/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/whipsflails, pick(1,1,2), TRUE)
		H.adjust_skillrank(/datum/skill/combat/axesmaces, pick(2,3), TRUE)
		H.adjust_skillrank(/datum/skill/combat/shields, pick(0,0,1), TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)

	beltr = /obj/item/storage/belt/pouch/coins/poor
	neck = /obj/item/clothing/neck/chaincoif
	pants = /obj/item/clothing/pants/grenzelpants
	shoes = /obj/item/clothing/shoes/grenzelhoft
	gloves = /obj/item/clothing/gloves/angle/grenzel
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/weapon/mace/cudgel
	shirt = /obj/item/clothing/shirt/grenzelhoft
	head = /obj/item/clothing/head/helmet/skullcap/grenzelhoft
	armor = /obj/item/clothing/armor/cuirass/grenzelhoft
	backl = /obj/item/storage/backpack/satchel
	backr = /obj/item/weapon/sword/long/greatsword/zwei
	H.change_stat(STATKEY_STR, 2)
	H.change_stat(STATKEY_END, 1)
	H.change_stat(STATKEY_CON, 2)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	H.cmode_music = 'sound/music/cmode/combat_grenzelhoft.ogg'

/datum/migrant_wave/grenzelhoft_visit
	name = "The Frozen Empire visit"
	max_spawns = 1
	shared_wave_type = list(/datum/migrant_wave/grenzelhoft_visit,/datum/migrant_wave/zalad_wave,/datum/migrant_wave/rockhill_wave,/datum/migrant_wave/heartfelt)
	weight = 25
	downgrade_wave = /datum/migrant_wave/grenzelhoft_visit_down
	roles = list(
		/datum/migrant_role/grenzelhoft/count = 1,
		/datum/migrant_role/grenzelhoft/countess = 1,
		/datum/migrant_role/grenzelhoft/grenzelhoft_knight = 1,
		/datum/migrant_role/grenzelhoft/grenzelhoft_men_at_arms = 2)
	greet_text = "The Kaiser of the Frozen Empire Imperiate has sent a diplomatic envoy to engage into diplomacy within the Kingdom of Phantom Kingdom."

/datum/migrant_wave/grenzelhoft_visit_down
	name = "The Frozen Empire visit"
	max_spawns = 1
	shared_wave_type = list(/datum/migrant_wave/grenzelhoft_visit,/datum/migrant_wave/zalad_wave,/datum/migrant_wave/rockhill_wave,/datum/migrant_wave/heartfelt)
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/grenzelhoft/count = 1,
		/datum/migrant_role/grenzelhoft/countess = 1,
		/datum/migrant_role/grenzelhoft/grenzelhoft_knight = 1)
	greet_text = "The Kaiser of the Frozen Empire Imperiate has sent a diplomatic envoy to engage into diplomacy within the Kingdom of Phantom Kingdom."
