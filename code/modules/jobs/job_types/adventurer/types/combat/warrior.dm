//shield sword
/datum/advclass/combat/sfighter
	name = "Warrior"
	tutorial = "Wandering sellswords, foolhardy gloryhounds, deserters... many and varied folk turn to the path of the warrior. Very few meet anything greater than the bottom of a tankard or the wrong end of a noose."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_PLAYER_ALL
	outfit = /datum/outfit/job/adventurer/sfighter
	category_tags = list(CTAG_ADVENTURER)
	min_pq = 0
	cmode_music = 'sound/music/cmode/adventurer/CombatWarrior.ogg'


/datum/outfit/job/adventurer/sfighter/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list("Veteran","Duelist","Berserker","Monster Hunter")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)

		if("Veteran")
			to_chat(H, span_warning("You are a seasoned weapon specialist, clad in maille, with years of experience in warfare and battle under your belt."))
			H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()
			H.set_blindness(0)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			var/weapons = list("Longsword","Mace","Billhook","Battle Axe","Short Sword & Heater Shield")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if("Longsword")
					H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
					backr = /obj/item/weapon/sword/long
				if("Mace")
					H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
					beltr = /obj/item/weapon/mace
				if("Billhook")
					H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
					r_hand = /obj/item/weapon/polearm/spear/billhook
				if("Battle Axe")
					H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
				if("Short Sword & Heater Shield")
					H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
					H.adjust_skillrank(/datum/skill/combat/shields, 1, TRUE)
					backr = /obj/item/weapon/shield/heater
					beltr = /obj/item/weapon/sword/short
			var/armors = list("Chainmaille Set","Iron Breastplate","Gambeson & Helmet")
			var/armor_choice = input("Choose your armor.", "TAKE UP ARMOR") as anything in armors
			switch(armor_choice)
				if("Chainmaille Set")
					shirt = /obj/item/clothing/armor/chainmail/iron
					pants = /obj/item/clothing/pants/chainlegs/iron
					neck = /obj/item/clothing/neck/chaincoif/iron
					gloves = /obj/item/clothing/gloves/chain/iron
				if("Iron Breastplate")
					armor = /obj/item/clothing/armor/cuirass/iron
					pants = /obj/item/clothing/pants/trou/leather
					gloves = /obj/item/clothing/gloves/angle
				if("Gambeson & Helmet")
					shirt = /obj/item/clothing/armor/gambeson
					pants = /obj/item/clothing/pants/trou/leather
					head = /obj/item/clothing/head/helmet/kettle
					gloves = /obj/item/clothing/gloves/angle
			H.change_stat(STATKEY_STR, 2)
			H.change_stat(STATKEY_END, 1)
			H.change_stat(STATKEY_CON, 2)
			belt = /obj/item/storage/belt/leather
			backl = /obj/item/storage/backpack/satchel
			beltl = /obj/item/storage/belt/pouch/coins/poor
			wrists = /obj/item/clothing/wrists/bracers/leather
			shoes = /obj/item/clothing/shoes/boots
			cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1, /obj/item/weapon/knife/hunting = 1, /obj/item/recipe_book/survival = 1)

		if("Duelist")
			to_chat(H, span_warning("You are an esteemed swordsman who foregoes armor in exchange for a more nimble fighting style."))
			H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_DECEIVING_MEEKNESS, TRAIT_GENERIC)
			H.set_blindness(0)
			var/weapons = list("Rapier","Dagger")
			var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
			switch(weapon_choice)
				if("Rapier")
					H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
					beltr = /obj/item/weapon/sword/rapier
				if("Dagger")
					H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
					beltr = /obj/item/weapon/knife/dagger/steel
			H.change_stat(STATKEY_STR, 2)
			H.change_stat(STATKEY_END, 1)
			H.change_stat(STATKEY_SPD, 2)
			armor = /obj/item/clothing/armor/leather
			head = /obj/item/clothing/head/fancyhat
			cloak = /obj/item/clothing/cloak/half
			wrists = /obj/item/clothing/wrists/bracers/leather
			shirt = /obj/item/clothing/shirt/undershirt/black
			pants = /obj/item/clothing/pants/trou/leather
			beltl = /obj/item/storage/belt/pouch/coins/poor
			shoes = /obj/item/clothing/shoes/boots
			neck = /obj/item/clothing/neck/gorget
			gloves = /obj/item/clothing/gloves/leather
			backl = /obj/item/storage/backpack/satchel
			backr = /obj/item/weapon/shield/tower/buckleriron
			belt = /obj/item/storage/belt/leather
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1, /obj/item/weapon/knife/dagger/steel/parrying = 1, /obj/item/recipe_book/survival = 1)

		if("Berserker")
			to_chat(H, span_warning("You are a brutal warrior who foregoes armor in order to showcase your raw strength. You specialize in unarmed combat and wrestling."))
			H.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)  //funger reference
			H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
			H.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
			H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			H.add_spell(/datum/action/cooldown/spell/undirected/barbrage)
			belt = /obj/item/storage/belt/leather
			shoes = /obj/item/clothing/shoes/boots/leather
			wrists = /obj/item/clothing/wrists/bracers/leather
			head = /obj/item/clothing/head/helmet/horned
			cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
			armor = /obj/item/clothing/armor/leather/hide
			beltr = /obj/item/weapon/axe/iron
			if(prob(50))
				backr = /obj/item/storage/backpack/satchel
			H.change_stat(STATKEY_STR, 3)
			H.change_stat(STATKEY_END, 2)
			H.change_stat(STATKEY_CON, 2)
			H.change_stat(STATKEY_INT, -2)
			H.change_stat(STATKEY_SPD, -1)
			ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
			if(H.dna?.species)
				H.dna.species.soundpack_m = new /datum/voicepack/male/warrior()

		if("Monster Hunter")
			to_chat(H, span_warning("You specialize in hunting down monsters and the undead, carrying two blades - one of silver, one of steel."))
			H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
			H.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
			H.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			H.cmode_music = 'sound/music/cmode/church/CombatInquisitor.ogg'
			H.change_stat(STATKEY_STR, 2)
			H.change_stat(STATKEY_END, 1)
			H.change_stat(STATKEY_CON, 1)
			H.change_stat(STATKEY_INT, 1)
			beltr = /obj/item/weapon/sword/silver
			backr = /obj/item/weapon/sword
			backl = /obj/item/storage/backpack/satchel/black
			wrists = /obj/item/clothing/neck/psycross/silver
			armor = /obj/item/clothing/shirt/undershirt/puritan
			shirt = /obj/item/clothing/armor/chainmail
			belt = /obj/item/storage/belt/leather/knifebelt/black/steel
			shoes = /obj/item/clothing/shoes/boots
			pants = /obj/item/clothing/pants/tights/black
			cloak = /obj/item/clothing/cloak/cape/puritan
			neck = /obj/item/storage/belt/pouch/coins/poor
			head = /obj/item/clothing/head/leather/inqhat
			gloves = /obj/item/clothing/gloves/angle
			backpack_contents = list(/obj/item/flashlight/flare/torch = 1, /obj/item/weapon/knife/hunting = 1, /obj/item/recipe_book/survival = 1)
			beltl = pick(/obj/item/reagent_containers/glass/bottle/healthpot)
