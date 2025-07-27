//shield
/datum/advclass/combat/cleric
	name = "Cleric"
	tutorial = "Clerics are wandering warriors of the Gods, drawn from the ranks of temple acolytes who demonstrated martial talent. Protected by armor and zeal, they are a force to be reckoned with."
	allowed_races = RACES_PLAYER_NONHERETICAL
	vampcompat = FALSE
	outfit = /datum/outfit/job/adventurer/cleric
	category_tags = list(CTAG_ADVENTURER)
	min_pq = 0
	maximum_possible_slots = 4

/datum/outfit/job/adventurer/cleric
	allowed_patrons = ALL_CLERIC_PATRONS

/datum/outfit/job/adventurer/cleric/pre_equip(mob/living/carbon/human/H)
	..()

	var/datum/devotion/cleric_holder/C = new /datum/devotion/cleric_holder(H, H.patron)
	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Vestal","Paladin")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(H.patron?.type)
		if(/datum/patron/divine/astrata)
			wrists = /obj/item/clothing/neck/psycross/silver/astrata
			cloak = /obj/item/clothing/cloak/stabard/templar/astrata
			H.cmode_music = 'sound/music/cmode/church/CombatAstrata.ogg'
		if(/datum/patron/divine/dendor)
			wrists = /obj/item/clothing/neck/psycross/silver/dendor
			cloak = /obj/item/clothing/cloak/stabard/templar/dendor
			H.cmode_music = 'sound/music/cmode/garrison/CombatForestGarrison.ogg'
		if(/datum/patron/divine/necra)
			wrists = /obj/item/clothing/neck/psycross/silver/necra
			cloak = /obj/item/clothing/cloak/stabard/templar/necra
			H.cmode_music = 'sound/music/cmode/church/CombatGravekeeper.ogg'
		if(/datum/patron/divine/eora)
			wrists = /obj/item/clothing/neck/psycross/silver/eora
			cloak = /obj/item/clothing/cloak/stabard/templar/eora
			H.cmode_music = 'sound/music/cmode/church/CombatEora.ogg'
			H.virginity = FALSE // this is hilarious lol
			ADD_TRAIT(H, TRAIT_BEAUTIFUL, TRAIT_GENERIC)
		if(/datum/patron/divine/ravox)
			wrists = /obj/item/clothing/neck/psycross/silver/ravox
			cloak =  /obj/item/clothing/cloak/stabard/templar/ravox
			H.cmode_music = 'sound/music/cmode/adventurer/CombatOutlander2.ogg'
		if(/datum/patron/divine/noc)
			wrists = /obj/item/clothing/neck/psycross/noc
			cloak = /obj/item/clothing/cloak/stabard/templar/noc
			H.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
		if(/datum/patron/divine/pestra)
			wrists = /obj/item/clothing/neck/psycross/silver/pestra
			cloak = /obj/item/clothing/cloak/stabard/templar/pestra
			H.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
		if(/datum/patron/divine/abyssor)
			wrists = /obj/item/clothing/neck/psycross/silver/abyssor
			cloak = /obj/item/clothing/cloak/tabard/crusader
			H.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
		if(/datum/patron/divine/malum)
			wrists = /obj/item/clothing/neck/psycross/silver/malum
			cloak = /obj/item/clothing/cloak/stabard/templar/malum
			H.cmode_music = 'sound/music/cmode/adventurer/CombatOutlander2.ogg'
		if(/datum/patron/divine/xylix)
			wrists = /obj/item/clothing/neck/psycross/silver/xylix
			cloak = /obj/item/clothing/cloak/tabard/crusader
			H.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
		if(/datum/patron/inhumen/graggar) // Heretical Patrons
			cloak = /obj/item/clothing/cloak/raincloak/mortus
			H.change_stat(STATKEY_LCK, -1)
			H.cmode_music = 'sound/music/cmode/antag/combat_werewolf.ogg'
			GLOB.heretical_players += H.real_name
		if(/datum/patron/inhumen/zizo)
			cloak = /obj/item/clothing/cloak/raincloak/mortus
			H.change_stat(STATKEY_LCK, -1)
			H.cmode_music = 'sound/music/cmode/antag/combat_cult.ogg'
			GLOB.heretical_players += H.real_name
		if(/datum/patron/inhumen/matthios)
			cloak = /obj/item/clothing/cloak/raincloak/mortus
			H.change_stat(STATKEY_LCK, -1)
			H.cmode_music = 'sound/music/cmode/antag/CombatBandit1.ogg'
			GLOB.heretical_players += H.real_name
		if(/datum/patron/inhumen/baotha)
			head = /obj/item/clothing/head/crown/circlet
			mask = /obj/item/clothing/face/spectacles/sglasses
			cloak = /obj/item/clothing/cloak/raincloak/purple
			H.change_stat(STATKEY_LCK, -1)
			H.cmode_music = 'sound/music/cmode/antag/CombatBaotha.ogg'
			GLOB.heretical_players += H.real_name
			H.virginity = FALSE
		else // Failsafe
			cloak = /obj/item/clothing/cloak/tabard/crusader // Give us a generic crusade tabard
			wrists = /obj/item/clothing/neck/psycross/silver // Give us a silver psycross for protection against lickers
			H.cmode_music = 'sound/music/cmode/church/CombatInquisitor.ogg'
	// Add druidic skill for Blissrose followers
	if(istype(H.patron, /datum/patron/divine/dendor))
		H.adjust_skillrank(/datum/skill/magic/druidic, 3, TRUE)
		to_chat(H, span_notice("As a follower of Blissrose, you have innate knowledge of druidic magic."))

	switch(classchoice)

		if("Paladin")
			to_chat(H, span_warning("A holy warrior. Where others of the clergy may have spent their free time studying scriptures, you have instead honed your skills with a blade to defend the holy lands such as the church."))
			switch(H.patron?.type)
				if(/datum/patron/psydon, /datum/patron/psydon/progressive)
					head = /obj/item/clothing/head/helmet/heavy/bucket/gold
					wrists = /obj/item/clothing/neck/psycross/g
					H.cmode_music = 'sound/music/cmode/church/CombatInquisitor.ogg'
				if(/datum/patron/divine/astrata)
					head = /obj/item/clothing/head/helmet/heavy/necked/astrata
					wrists = /obj/item/clothing/neck/psycross/silver/astrata
					H.cmode_music = 'sound/music/cmode/church/CombatAstrata.ogg'
				if(/datum/patron/divine/noc)
					head = /obj/item/clothing/head/helmet/heavy/necked/noc
					wrists = /obj/item/clothing/neck/psycross/noc
					H.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
				if(/datum/patron/divine/dendor)
					head = /obj/item/clothing/head/helmet/heavy/necked/dendorhelm
					wrists = /obj/item/clothing/neck/psycross/silver/dendor
					H.cmode_music = 'sound/music/cmode/garrison/CombatForestGarrison.ogg'
				if(/datum/patron/divine/abyssor)
					head = /obj/item/clothing/head/helmet/heavy/necked // Placeholder
					wrists = /obj/item/clothing/neck/psycross/silver/abyssor
					H.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
				if(/datum/patron/divine/necra)
					head = /obj/item/clothing/head/helmet/heavy/necked/necra
					wrists = /obj/item/clothing/neck/psycross/silver/necra
					H.cmode_music = 'sound/music/cmode/church/CombatGravekeeper.ogg'
				if(/datum/patron/divine/ravox)
					head = /obj/item/clothing/head/helmet/heavy/necked/ravox
					wrists = /obj/item/clothing/neck/psycross/silver/ravox
					H.cmode_music = 'sound/music/cmode/adventurer/CombatOutlander2.ogg'
				if(/datum/patron/divine/xylix)
					head = /obj/item/clothing/head/helmet/heavy/necked/xylix
					wrists = /obj/item/clothing/neck/psycross/silver/xylix
					H.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
				if(/datum/patron/divine/pestra)
					head = /obj/item/clothing/head/helmet/heavy/necked/pestrahelm
					wrists = /obj/item/clothing/neck/psycross/silver/pestra
					H.cmode_music = 'sound/music/cmode/adventurer/CombatMonk.ogg'
				if(/datum/patron/divine/malum)
					head = /obj/item/clothing/head/helmet/heavy/necked/malumhelm
					wrists = /obj/item/clothing/neck/psycross/silver/malum
					H.cmode_music = 'sound/music/cmode/adventurer/CombatOutlander2.ogg'
				if(/datum/patron/divine/eora)
					head = /obj/item/clothing/head/helmet/sallet/eoraite
					wrists = /obj/item/clothing/neck/psycross/silver/eora
					H.cmode_music = 'sound/music/cmode/church/CombatEora.ogg'
					H.virginity = FALSE
					ADD_TRAIT(H, TRAIT_BEAUTIFUL, TRAIT_GENERIC)
				if(/datum/patron/inhumen/graggar) // Heretical Patrons
					head = /obj/item/clothing/head/helmet/heavy/sinistar
					H.cmode_music = 'sound/music/cmode/antag/combat_werewolf.ogg'
					H.change_stat(STATKEY_LCK, -2)
					GLOB.heretical_players += H.real_name
				if(/datum/patron/inhumen/graggar_zizo)
					head = /obj/item/clothing/head/helmet/heavy/sinistar
					H.cmode_music = 'sound/music/cmode/antag/combat_werewolf.ogg'
				if(/datum/patron/inhumen/zizo)
					head = /obj/item/clothing/head/helmet/skullcap/cult
					H.cmode_music = 'sound/music/cmode/antag/combat_cult.ogg'
					H.change_stat(STATKEY_LCK, -2)
					GLOB.heretical_players += H.real_name
				if(/datum/patron/inhumen/matthios)
					head = /obj/item/clothing/head/helmet/heavy/rust
					H.cmode_music = 'sound/music/cmode/antag/CombatBandit1.ogg'
					H.change_stat(STATKEY_LCK, -2)
					GLOB.heretical_players += H.real_name
				if(/datum/patron/inhumen/baotha)
					head = /obj/item/clothing/head/crown/circlet
					mask = /obj/item/clothing/face/spectacles/sglasses
					H.cmode_music = 'sound/music/cmode/antag/CombatBaotha.ogg'
					H.change_stat(STATKEY_LCK, -2)
					GLOB.heretical_players += H.real_name
					H.virginity = FALSE
				if(/datum/patron/godless)
					head = /obj/item/clothing/head/roguehood/green
					H.cmode_music = 'sound/music/cmode/church/CombatInquisitor.ogg'
					H.change_stat(STATKEY_LCK, -2)
					GLOB.heretical_players += H.real_name
				else // Failsafe
					head = /obj/item/clothing/head/helmet/heavy/bucket
					wrists = /obj/item/clothing/neck/psycross/silver
					H.cmode_music = 'sound/music/cmode/church/CombatInquisitor.ogg'

			armor = /obj/item/clothing/armor/plate
			shirt = /obj/item/clothing/armor/chainmail
			pants = /obj/item/clothing/pants/platelegs
			shoes = /obj/item/clothing/shoes/boots/armor
			belt = /obj/item/storage/belt/leather/steel
			beltl = /obj/item/storage/belt/pouch/coins/mid
			ring = /obj/item/clothing/ring/silver/topaz
			cloak = /obj/item/clothing/cloak/tabard/crusader
			neck = /obj/item/clothing/neck/chaincoif
			gloves = /obj/item/clothing/gloves/plate
			backl = /obj/item/weapon/sword/long/judgement
			if(H.mind)
				H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
				H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
				H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
				H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
				H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
				H.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
				H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
				H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
				H.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE)
				H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
				H.adjust_skillrank(/datum/skill/labor/mathematics, 3, TRUE)
				H.change_stat(STATKEY_STR, 2)
				H.change_stat(STATKEY_CON, 2)
				H.change_stat(STATKEY_END, 1)
				H.change_stat(STATKEY_SPD, -1)
				if(!H.has_language(/datum/language/celestial)) // For discussing church matters with the other Clergy
					H.grant_language(/datum/language/celestial)
					to_chat(H, "<span class='info'>I can speak Celestial with ,c before my speech.</span>")
			if(H.dna?.species)
				if(H.dna.species.id == "human")
					H.dna.species.soundpack_m = new /datum/voicepack/male/knight()
			//Paladins, while devout warriors spent WAY too much time studying the blade. No more acolyte+
			C.grant_spells_templar(H)
			H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

			ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
		if("Vestal")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a devout worshipper of the divine with a strong connection to your patron god. You've spent years studying scriptures and serving your deity - Now you wander the land helping the helpless."))
			backl = /obj/item/storage/backpack/satchel
			shirt = /obj/item/clothing/shirt/undershirt/priest
			armor = /obj/item/clothing/armor/medium/scale
			pants = /obj/item/clothing/pants/chainlegs
			shoes = /obj/item/clothing/shoes/boots
			backr = /obj/item/weapon/polearm/woodstaff
			belt = /obj/item/storage/belt/leather
			beltr = /obj/item/flashlight/flare/torch/lantern
			if(H.gender == FEMALE)
				armor = /obj/item/clothing/armor/medium/scale
				pants = /obj/item/clothing/pants/chainlegs/fishnet
			backpack_contents = list(/obj/item/storage/belt/pouch/coins/poor = 1, /obj/item/recipe_book/survival = 1)
			H.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
			H.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
			H.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
			H.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
			H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
			H.change_stat(STATKEY_INT, 2)
			H.change_stat(STATKEY_CON, 1)
			H.change_stat(STATKEY_END, 1)
			H.change_stat(STATKEY_PER, 2)
			H.change_stat(STATKEY_SPD, 1)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			C.grant_spells_cleric(H)

	if(!H.has_language(/datum/language/celestial)) // For discussing church matters with the other Clergy
		H.grant_language(/datum/language/celestial)
		to_chat(H, "<span class='info'>I can speak Celestial with ,c before my speech.</span>")
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC) // Even if it has limited slots, it is a common drifter role available to anyone. Their armor also is not heavy, so medium armor training is enough
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

