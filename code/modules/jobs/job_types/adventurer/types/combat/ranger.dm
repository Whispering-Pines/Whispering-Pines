/datum/advclass/combat/ranger
	name = "Ranger"
	tutorial = "Human and elf rangers often live among each other, as these bow-wielding \
	adventurers are often scouting the lands for the same purpose."
	outfit = /datum/outfit/job/adventurer/ranger
	min_pq = 0
	category_tags = list(CTAG_ADVENTURER)
	cmode_music = 'sound/music/cmode/adventurer/CombatWarrior.ogg'

/datum/outfit/job/adventurer/ranger/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list("Wilder")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)

		if("Wilder")
			to_chat(H, span_warning("You are a ranger well-versed in traversing untamed lands, with years of experience taking odd jobs as a pathfinder and bodyguard in areas of wilderness untraversable to common soldiery."))
			shoes = /obj/item/clothing/shoes/boots/leather
			shirt = /obj/item/clothing/shirt/undershirt
			neck = /obj/item/storage/belt/pouch/coins/poor
			pants = /obj/item/clothing/pants/trou/leather
			gloves = /obj/item/clothing/gloves/leather
			wrists = /obj/item/clothing/wrists/bracers/leather
			belt = /obj/item/storage/belt/leather
			armor = /obj/item/clothing/armor/leather/hide
			cloak = /obj/item/clothing/cloak/raincloak/green
			backl = /obj/item/storage/backpack/satchel
			beltr = /obj/item/flashlight/flare/torch/lantern
			backpack_contents = list(/obj/item/bait = 1, /obj/item/weapon/knife/hunting = 1, /obj/item/recipe_book/survival = 1)
			H.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
			H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
			H.adjust_skillrank(/datum/skill/craft/tanning, 2, TRUE)
			H.adjust_skillrank(/datum/skill/labor/fishing, 2, TRUE)
			H.adjust_skillrank(/datum/skill/labor/butchering, 2, TRUE)
			H.adjust_skillrank(/datum/skill/craft/traps, 2, TRUE)
			H.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/tracking, 2, TRUE)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			var/weapons = list("Recurve Bow","Crossbow")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			H.set_blindness(0)
			switch(weapon_choice)
				if("Recurve Bow")
					H.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
					backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve
					beltl = /obj/item/ammo_holder/quiver/arrows
				if("Crossbow")
					H.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
					backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
					beltl = /obj/item/ammo_holder/quiver/bolts
			H.change_stat(STATKEY_PER, 3)
			H.change_stat(STATKEY_SPD, 2)
