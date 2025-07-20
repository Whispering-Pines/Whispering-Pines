/datum/advclass/mercenary/zalad
	name = "Red Sands"
	tutorial = "A cutthroat from the western countries, you've headed into foreign lands to make even greater coin than you had prior."
	outfit = /datum/outfit/job/mercenary/zalad
	category_tags = list(CTAG_MERCENARY)
	maximum_possible_slots = 5

	cmode_music = 'sound/music/cmode/adventurer/CombatOutlander.ogg' //Forgive me, Combat_DesertRider, I'm sorry, I'll miss you.

/datum/outfit/job/mercenary/zalad/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/shalal
	head = /obj/item/clothing/head/helmet/sallet/zalad
	gloves = /obj/item/clothing/gloves/angle
	belt = /obj/item/storage/belt/leather/mercenary/shalal
	armor = /obj/item/clothing/armor/brigandine/coatplates
	beltr = /obj/item/weapon/sword/long/rider
	beltl= /obj/item/flashlight/flare/torch/lantern
	shirt = /obj/item/clothing/shirt/undershirt/black
	pants = /obj/item/clothing/pants/tights/red
	neck = /obj/item/clothing/neck/keffiyeh/red
	backl = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/storage/belt/pouch/coins/poor)
	if(H.mind)
		H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/lockpicking, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)

		H.merctype = 1

		H.change_stat(STATKEY_STR, 1)
		H.change_stat(STATKEY_END, 2)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DUALWIELDER, TRAIT_GENERIC)
