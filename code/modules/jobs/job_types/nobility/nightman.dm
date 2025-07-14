/datum/job/niteman
	title = "Nightmaster"
	f_title = "Nightmistress"
	flag = NIGHTMAN
	department_flag = NOBLEMEN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = RACES_PLAYER_NONDISCRIMINATED
	tutorial = "You own the brothel in the undercity. You provide security to the whores and help them to find work-- when you're not being a trouble-making rake that others suffer to tolerate... You tend to take most of your 'stock' unwillingly, weak and debtors all fair game."
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/job/niteman
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_SHOW_IN_CREDITS | JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE)
	display_order = JDO_NITEMASTER
	faction = FACTION_TOWN
	give_bank_account = 150
	min_pq = 1
	bypass_lastclass = TRUE

/datum/outfit/job/niteman
	job_bitflag = BITFLAG_ROYALTY

/datum/outfit/job/niteman/pre_equip(mob/living/carbon/human/H)
	..()
	var/prev_real_name = H.real_name
	var/prev_name = H.name
	var/honorary = "Lord"
	if(H.gender == FEMALE)
		honorary = "Lady"
	H.real_name = "[honorary] [prev_real_name]"
	H.name = "[honorary] [prev_name]"

	head = /obj/item/lockpick/goldpin/silver
	shoes = /obj/item/clothing/shoes/boots
	belt = /obj/item/storage/belt/leather/black
	shirt = /obj/item/clothing/armor/gambeson/heavy/dark
	armor = /obj/item/clothing/armor/leather/jacket/apothecary
	wrists = /obj/item/storage/keyring/nightman
	neck = /obj/item/storage/belt/pouch/coins/rich
	pants = /obj/item/clothing/pants/trou/leather
	if(H.gender == FEMALE)
		shirt = /obj/item/clothing/armor/gambeson/heavy/dress/alt
		pants = /obj/item/clothing/pants/tights/stockings/silk/black
	beltl = /obj/item/weapon/whip
	beltr = /obj/item/weapon/knife/dagger/steel/special
	ring = /obj/item/scomstone

	backl = /obj/item/storage/backpack/satchel
	backpack_contents = list(/obj/item/reagent_containers/food/snacks/produce/swampweed_dried = 2, /obj/item/reagent_containers/powder/moondust = 2, /obj/item/reagent_containers/powder/spice = 1)
	H.grant_language(/datum/language/thievescant)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	if(H.mind)
		H.add_spell(/datum/action/cooldown/spell/undirected/list_target/convert_role/prostitute)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/stealing, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/firearms, 3, TRUE)
		H.change_stat(STATKEY_STR, 2) //break the hoes
		H.change_stat(STATKEY_INT, -1)
		H.change_stat(STATKEY_CON, 1)
		H.change_stat(STATKEY_END, 2)
		H.dna.species.soundpack_m = new /datum/voicepack/male/zeth()

/datum/action/cooldown/spell/undirected/list_target/convert_role/prostitute
	name = "Hire Prostitute"
	new_role = "Nightswain"
	button_icon_state = "recruit_servant"
	recruitment_faction = "Prostitute"
	recruitment_message = "Work for me, %RECRUIT."
	accept_message = "I will."
	refuse_message = "I refuse."


//NIGHTMAIDENS

/datum/job/nightmaiden
	title = "Nightswain"
	f_title = "Nightmaiden"
	flag = WENCH
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 8
	spawn_positions = 8

	allowed_sexes = list(FEMALE)
	allowed_races = RACES_PLAYER_ALL
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)

	tutorial = "The oldest profession, You were taken in by the nightmaster due to your skill or because you were desperate, they have chosen to onboard you for your talents. In the whorehouse, your place on the hierarchy is determined by how long you've been in the game - and how much mammon you're worth."

	outfit = /datum/outfit/job/nightmaiden
	advclass_cat_rolls = list(CTAG_NIGHTMAIDEN = 20)
	display_order = JDO_WENCH
	give_bank_account = TRUE
	can_random = FALSE
	min_pq = -10

/datum/job/nightmaiden/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup") // Classes are for aesthetic clothing only, mechanically they're identical.

/datum/outfit/job/nightmaiden
	name = "Nightmaiden"
	// This is just a base outfit, the actual outfits are defined in the advclasses

/datum/advclass/nightmaiden/attendant
	name = "Attendant"
	tutorial = "A fresh initiate, a desperate fool who ended up here, and mainly tasked to keep the whorehouse and it's whores in shape and relatively clean while occasionally tempting others into bedsheets for money. You work underneath your betters in the whorehouse, keeping it and the guests in turn as tidy as they please. Wash slimy laundry, tend mild 'work-place accidents', and clean the whorehouse until someone's eye catches you..."
	outfit = /datum/outfit/job/nightmaiden/attendant
	category_tags = list(CTAG_NIGHTMAIDEN)

/datum/outfit/job/nightmaiden/attendant/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/armingcap
	shoes = /obj/item/clothing/shoes/sandals
	belt =	/obj/item/storage/belt/leather/cloth/lady
	beltl = /obj/item/key/bathhouse
	beltr = /obj/item/storage/belt/pouch/coins/poor
	backl = /obj/item/storage/backpack/satchel
	if(H.gender == FEMALE)
		shirt = /obj/item/clothing/shirt/undershirt
		armor = /obj/item/clothing/shirt/dress/gen/sexy
		pants = /obj/item/clothing/pants/skirt/red
	else
		shirt = /obj/item/clothing/shirt/tunic/random
	backpack_contents = list(
		/obj/item/soap/bath = 1
	)
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/music, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/lockpicking, 1, TRUE)

		H.change_stat(STATKEY_SPD, 1)
		H.change_stat(STATKEY_INT, 1)
		H.change_stat(STATKEY_END, 2)
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)

/datum/advclass/nightmaiden/concubine
	name = "Concubine"
	tutorial = "You have abandoned all pretense. You are a prized possession of the nobility, adorned in exotic silks and gold. Your role is to provide companionship, entertainment, and pleasure. Working underneath the finespun courtesans, you're a step above the bath attendants in your craft."
	outfit = /datum/outfit/job/nightmaiden/concubine
	category_tags = list(CTAG_NIGHTMAIDEN)

/datum/outfit/job/nightmaiden/concubine/pre_equip(mob/living/carbon/human/H)
	..()
	mask = /obj/item/clothing/face/exoticsilkmask
	belt = /obj/item/storage/belt/leather/exoticsilkbelt
	beltl = /obj/item/key/bathhouse
	shoes = /obj/item/clothing/shoes/anklets
	backl = /obj/item/storage/backpack/satchel
	shirt = /obj/item/clothing/shirt/exoticsilkbra
	pants = /obj/item/clothing/pants/tights/stockings/silk
	backpack_contents = list(
		/obj/item/rope = 1,
		/obj/item/candle/eora = 1,
		/obj/item/weapon/whip = 1,
		/obj/item/clothing/face/blindfold = 1,
	)

	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/music, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)

		H.change_stat(STATKEY_SPD, 2)
		H.change_stat(STATKEY_END, 2)
	ADD_TRAIT(H, TRAIT_LIGHT_STEP, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BEAUTIFUL, TRAIT_GENERIC)

	var/weapons = list("Harp","Lute","Accordion","Guitar","Hurdy-Gurdy","Viola","Vocal Talisman","Flute")
	var/weapon_choice = input("Choose your instrument.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Harp")
			backr = /obj/item/instrument/harp
		if("Lute")
			backr = /obj/item/instrument/lute
		if("Accordion")
			backr = /obj/item/instrument/accord
		if("Guitar")
			backr = /obj/item/instrument/guitar
		if("Hurdy-Gurdy")
			backr = /obj/item/instrument/hurdygurdy
		if("Viola")
			backr = /obj/item/instrument/viola
		if("Vocal Talisman")
			backr = /obj/item/instrument/vocals
		if("Flute")
			backr = /obj/item/instrument/flute

/datum/advclass/nightmaiden/courtesan
	name = "Handler"
	tutorial = "You have worked here long enough and gathered enough experience to be lifted to the status of a Handler, Under the matron, you handle the freewhores and the slavewhores while also doing most of the social heavylifting and provide entertainment of all forms - behind a heavy price tag. "
	outfit = /datum/outfit/job/nightmaiden/courtesan
	category_tags = list(CTAG_NIGHTMAIDEN)

/datum/outfit/job/nightmaiden/courtesan/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/lockpick/goldpin
	armor = /obj/item/clothing/shirt/dress/silkydress
	shirt = /obj/item/clothing/armor/corset
	belt = /obj/item/storage/belt/leather/cloth/lady
	beltl = /obj/item/key/bathhouse
	beltr = /obj/item/storage/belt/pouch/coins/poor
	ring = /obj/item/clothing/ring/gold
	if(prob(50))
		ring = /obj/item/clothing/ring/gold/emerald
	if(prob(30))
		ring = /obj/item/clothing/ring/gold/topaz
	if(prob(15))
		ring = /obj/item/clothing/ring/silver
	if(prob(5))
		ring = /obj/item/clothing/ring/gold/diamond
	shoes = /obj/item/clothing/shoes/anklets
	backl = /obj/item/storage/backpack/satchel
	backpack_contents = list(
		/obj/item/reagent_containers/powder/moondust = 2,
		/obj/item/reagent_containers/glass/bottle/wine = 1,
		/obj/item/toy/cards/deck = 1,
	)

	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/lockpicking, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/music, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)

		H.change_stat(STATKEY_SPD, 1)
		H.change_stat(STATKEY_INT, 1)
		H.change_stat(STATKEY_END, 2)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BEAUTIFUL, TRAIT_GENERIC)

	var/weapons = list("Harp","Lute","Accordion","Guitar","Hurdy-Gurdy","Viola","Vocal Talisman","Flute")
	var/weapon_choice = input("Choose your instrument.", "TAKE UP ARMS") as anything in weapons
	H.set_blindness(0)
	switch(weapon_choice)
		if("Harp")
			backr = /obj/item/instrument/harp
		if("Lute")
			backr = /obj/item/instrument/lute
		if("Accordion")
			backr = /obj/item/instrument/accord
		if("Guitar")
			backr = /obj/item/instrument/guitar
		if("Hurdy-Gurdy")
			backr = /obj/item/instrument/hurdygurdy
		if("Viola")
			backr = /obj/item/instrument/viola
		if("Vocal Talisman")
			backr = /obj/item/instrument/vocals
		if("Flute")
			backr = /obj/item/instrument/flute

//to do
/datum/advclass/nightmaiden/slave
	name = "Slave"
	tutorial = "You were either a petty criminal or indebted and are here to pay your debt, you lost all your rights and your dignity, as you are forced to perform heavy labor and let people use you in the whorehouse..."
	outfit = /datum/outfit/job/nightmaiden/attendant
	category_tags = list(CTAG_NIGHTMAIDEN)

/datum/outfit/job/nightmaiden/attendant/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/armingcap
	shoes = /obj/item/clothing/shoes/sandals
	belt =	/obj/item/storage/belt/leather/cloth/lady
	beltl = /obj/item/key/bathhouse
	beltr = /obj/item/storage/belt/pouch/coins/poor
	backl = /obj/item/storage/backpack/satchel
	if(H.gender == FEMALE)
		shirt = /obj/item/clothing/shirt/undershirt
		armor = /obj/item/clothing/shirt/dress/gen/sexy
		pants = /obj/item/clothing/pants/skirt/red
	else
		shirt = /obj/item/clothing/shirt/tunic/random
	backpack_contents = list(
		/obj/item/soap/bath = 1
	)
	if(H.mind)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/music, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/lockpicking, 1, TRUE)

		H.change_stat(STATKEY_CON, 1)
		H.change_stat(STATKEY_STR, -1)
		H.change_stat(STATKEY_END, 2)
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)

//here so it might not get overwritten by update..
/obj/effect/landmark/start/nightman
	name = "Nightmaster"
	icon_state = "arrow"

/obj/effect/landmark/start/nightmaiden
	name = "Nightswain"
	icon_state = "arrow"

/obj/item/lockpick/goldpin
	name = "gold hairpin"
	desc = "Often used by wealthy courtesans and nobility to keep hair and clothing in place."
	icon_state = "goldpin"
	item_state = "goldpin"
	icon = 'modular_azure/icons/clothing/head.dmi'
	mob_overlay_icon = 'modular_azure/icons/clothing/onmob/head_items.dmi'
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_MASK|ITEM_SLOT_HIP
	body_parts_covered = NONE
	w_class = WEIGHT_CLASS_TINY
	experimental_onhip = FALSE
	possible_item_intents = list(/datum/intent/use, /datum/intent/stab)
	force = 10
	throwforce = 5
	max_integrity = null
	dropshrink = 0.7
	drop_sound = 'sound/items/gems (2).ogg'
	destroy_sound = 'sound/items/pickbreak.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	associated_skill = /datum/skill/misc/lockpicking
	var/material = "gold"

	grid_width = 32
	grid_height = 32

/obj/item/lockpick/goldpin/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_BELT_R)
		icon_state = "[material]pin_beltr"
		user.update_inv_belt()
	if(slot == ITEM_SLOT_BELT_L)
		icon_state = "[material]pin_beltl"
		user.update_inv_belt()
	else
		icon_state = "[material]pin"
		user.update_icon()

/obj/item/lockpick/goldpin/silver
	name = "silver hairpin"
	desc = "Often used by wealthy courtesans and nobility to keep hair and clothing in place. This one's silver."
	icon_state = "silverpin"
	item_state = "silverpin"
	icon = 'modular_azure/icons/clothing/head.dmi'
	mob_overlay_icon = 'modular_azure/icons/clothing/onmob/head_items.dmi'
	material = "silver"
	is_silver = TRUE

/obj/item/storage/keyring/nightman
	keys = list(/obj/item/key/bathhouse, /obj/item/key/nightman, /obj/item/key/apothecary)

/obj/item/key/nightman
	name = "Nightmaster's key"
	desc = "Master key of the bathhouse."
	icon_state = "rustkey"
	lockids = list("nightman")

/obj/structure/door/secret/bath/examine(mob/user)
	. = ..()
	if(user.job == "nightmaster")
		. += span_purple("There's a hidden wall here...")

/obj/structure/lever/hidden/bath/feel_button(mob/living/user)
	if(user.job == "nightmaster")
		..()
