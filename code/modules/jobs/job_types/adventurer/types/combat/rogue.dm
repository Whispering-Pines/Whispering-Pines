/datum/advclass/combat/rogue
	name = "Rogue"
	tutorial = "A wandering rogue, capable of breaking in and out of just about any secure location, and born to meet the sharp end of the guillotine. Just remember, murder is the mark of an amateur."
	allowed_sexes = list(MALE, FEMALE)

	outfit = /datum/outfit/job/adventurer/rogue
	min_pq = 0
	category_tags = list(CTAG_ADVENTURER)
	cmode_music = 'sound/music/cmode/adventurer/CombatRogue.ogg'

/datum/outfit/job/adventurer/rogue/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list(
	"Scavenger",
	"Snake",
	"Ace",
	"Trickster",
	)

	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes
	switch(classchoice)
		if("Scavenger")
			H.set_blindness(0)
			scavengerarch(H)
		if("Snake")
			H.set_blindness(0)
			roguearch(H)
		if("Ace")
			H.set_blindness(0)
			swashbucklerarch(H)
		if("Trickster")
			H.set_blindness(0)
			tricksterarch(H)

	H.grant_language(/datum/language/thievescant)
	to_chat(H, "<span class='info'>I can gesture in thieves' cant with ,t before my speech.</span>")

/datum/outfit/job/adventurer/rogue/proc/scavengerarch(mob/living/carbon/human/H)
	pants = /obj/item/clothing/pants/tights/black
	armor = /obj/item/clothing/armor/leather/vest/black
	shirt = /obj/item/clothing/shirt/undershirt/black
	backl = /obj/item/storage/backpack/satchel
	belt = /obj/item/storage/belt/leather/rope
	backpack_contents = list(/obj/item/weapon/pick = 1, /obj/item/weapon/knife/hunting = 1, /obj/item/lockpickring/mundane)
	gloves = /obj/item/clothing/gloves/fingerless
	cloak = /obj/item/clothing/cloak/raincloak/mortus
	shoes = /obj/item/clothing/shoes/boots/leather
	beltr = /obj/item/flashlight/flare/torch/lantern
	beltl = /obj/item/weapon/whip // You know why.
	backr = /obj/item/weapon/shovel
	head = /obj/item/clothing/head/helmet/leather/inquisitor
	neck = /obj/item/storage/belt/pouch/coins/poor
	if(H.mind)
		H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 5, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sneaking, 5, TRUE)
		H.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
		H.adjust_skillrank(/datum/skill/craft/traps, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.change_stat(STATKEY_STR, 1)
		H.change_stat(STATKEY_PER, 2)
		H.change_stat(STATKEY_INT, 1)
		H.change_stat(STATKEY_SPD, 1)
		H.change_stat(STATKEY_LCK, -1)
		ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
		ADD_TRAIT(H, TRAIT_GRAVEROBBER, TRAIT_GENERIC)
		var/weapons = list("Sabre","Whip")
		var/weapon_choice = input("Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		H.set_blindness(0)
		switch(weapon_choice)
			if("Sabre")
				H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
				beltr = /obj/item/weapon/sword/sabre
			if("Whip")
				H.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
				beltr = /obj/item/weapon/whip
		to_chat(H, span_warning("I am a scavenger, gentle name for a tomb raider, or grave digger..."))

/datum/outfit/job/adventurer/rogue/proc/roguearch(mob/living/carbon/human/H)
	if(H.mind)
		H.add_spell(/datum/action/cooldown/spell/undirected/rogue_vanish) //stealth guy more than others.
		H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.adjust_skillrank(/datum/skill/combat/knives, 4, TRUE)
		H.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.adjust_skillrank(/datum/skill/misc/climbing, 5, TRUE)
		H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.adjust_skillrank(/datum/skill/misc/sneaking, 5, TRUE)
		H.adjust_skillrank(/datum/skill/misc/stealing, 5, TRUE)
		H.adjust_skillrank(/datum/skill/misc/lockpicking, 4, TRUE)
		H.adjust_skillrank(/datum/skill/craft/traps, 3, TRUE)
		H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
	if(H.gender == FEMALE)
		armor = /obj/item/clothing/armor/leather/bikini
		shirt = /obj/item/clothing/armor/gambeson/bikini
		pants = /obj/item/clothing/pants/trou/leather/skirt
	else
		armor = /obj/item/clothing/armor/leather
		shirt = /obj/item/clothing/armor/gambeson
		pants = /obj/item/clothing/pants/trou/leather
	cloak = /obj/item/clothing/cloak/raincloak/mortus
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/boots
	backl = /obj/item/storage/backpack/backpack
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	belt = /obj/item/storage/belt/leather
	beltl = /obj/item/ammo_holder/quiver/bolts
	beltr = /obj/item/weapon/mace/cudgel // TEMP until I make a blackjack- for now though this will do.
	neck = /obj/item/storage/belt/pouch/coins/poor
	backpack_contents = list(/obj/item/lockpickring/mundane, /obj/item/weapon/knife/dagger/steel, /obj/item/clothing/face/shepherd/rag, /obj/item/smokebomb, /obj/item/recipe_book/survival = 1)
	ADD_TRAIT(H, TRAIT_THIEVESGUILD, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_LIGHT_STEP, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_USEMAGIC, TRAIT_GENERIC)
	H.change_stat(STATKEY_STR, -1)
	H.change_stat(STATKEY_PER, 2)
	H.change_stat(STATKEY_INT, 1)
	H.change_stat(STATKEY_END, 1)
	H.change_stat(STATKEY_SPD, 3)
	H.visible_message(span_info("I survived the tough town and wild life until now through cunning and stealth... And I got good at it."))

//Swashbuckler, Less thief-ish skills, but you have good sword skills and dirty fighting ways.
/datum/outfit/job/adventurer/rogue/proc/swashbucklerarch(mob/living/carbon/human/H)
	H.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
	H.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/engineering, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/lockpicking, 1, TRUE)
	head = /obj/item/clothing/head/leather/duelhat
	cloak = /obj/item/clothing/cloak/half/duelcape
	armor = /obj/item/clothing/armor/leather/jacket/leathercoat
	if(H.gender == FEMALE)
		shirt = /obj/item/clothing/armor/chainmail/bikini
		shirt = /obj/item/clothing/armor/gambeson/bikini
		pants = /obj/item/clothing/pants/trou/leather/skirt
	else
		shirt = /obj/item/clothing/armor/gambeson
		shirt = /obj/item/clothing/armor/chainmail
		pants = /obj/item/clothing/pants/trou/leather
	gloves = /obj/item/clothing/gloves/leather/black
	shoes = /obj/item/clothing/shoes/nobleboot
	belt = /obj/item/storage/belt/leather
	backl = /obj/item/storage/backpack/satchel
	beltl = /obj/item/weapon/sword/rapier
	beltr = /obj/item/weapon/shield/tower/buckleriron
	backpack_contents = list(/obj/item/weapon/knife/dagger/steel/parrying = 1, /obj/item/bomb = 1,  /obj/item/smokebomb = 1, /obj/item/recipe_book/survival = 1)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DECEIVING_MEEKNESS, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC) //if they got all the shield and parry stuff, might aswell.
	ADD_TRAIT(H, TRAIT_NUTCRACKER, TRAIT_GENERIC) //extra damage to groin (dirty fighting)
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC) //funny nose grab.
	H.change_stat(STATKEY_CON, 1)
	H.change_stat(STATKEY_SPD, 2)
	H.change_stat(STATKEY_INT, 2)
	H.visible_message(span_info("If my sword fails me, I always got an Ace up my sleeve..."))

// Arcane Trickster - A charlatan, magic using rogue (based on arcane trickster archetype from 5e)
/datum/outfit/job/adventurer/rogue/proc/tricksterarch(mob/living/carbon/human/H)
	H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/alchemy, 2, TRUE)
	H.adjust_skillrank(/datum/skill/magic/arcane, 2, TRUE)
	H.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
	H.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
	gloves = /obj/item/clothing/gloves/fingerless
	belt = /obj/item/storage/belt/leather
	if(H.gender == FEMALE)
		armor = /obj/item/clothing/armor/leather/bikini
		shirt = /obj/item/clothing/armor/gambeson/bikini
		pants = /obj/item/clothing/pants/trou/leather/skirt
	else
		armor = /obj/item/clothing/armor/leather
		shirt = /obj/item/clothing/armor/gambeson
		pants = /obj/item/clothing/pants/trou/leather
	cloak = /obj/item/clothing/cloak/raincloak/mortus
	backl = /obj/item/storage/backpack/satchel
	beltr = /obj/item/weapon/knife/dagger/steel
	beltl = /obj/item/weapon/knife/dagger/steel
	backpack_contents = list(/obj/item/book/granter/spellbook/mid = 1, /obj/item/recipe_book/survival = 1)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_LEARNMAGIC, TRAIT_GENERIC)
	//Far less sum of stats due having crazy magic.
	H.change_stat(STATKEY_STR, -1)
	H.change_stat(STATKEY_PER, 2)
	H.change_stat(STATKEY_SPD, 2)
	H.change_stat(STATKEY_INT, 3)
	H.visible_message(span_info("I was always intrigued by magic, more than others. I took my time learning to use magic and stole a spellbook along the way."))
	if(H.mind)
		H.adjust_spellpoints(1)
	H.add_spell(/datum/action/cooldown/spell/undirected/touch/prestidigitation)
	H.add_spell(/datum/action/cooldown/spell/projectile/fetch)
	H.add_spell(/datum/action/cooldown/spell/aoe/knock)

//rogue innate vanish
/datum/action/cooldown/spell/undirected/rogue_vanish
	name = "Vanish"
	cooldown_time = 20 SECONDS
	button_icon_state = "blindness"
	sound = 'sound/magic/barbroar.ogg'
	antimagic_flags = NONE
	charge_required = FALSE
	has_visual_effects = FALSE
	cooldown_time = 2 MINUTES
	spell_cost = 0
	sound = 'sound/misc/explode/incendiary (1).ogg'
	invocation = "pulls out a smoke bomb and slams it to the ground!"
	invocation_type = INVOCATION_EMOTE
	associated_skill = /datum/skill/misc/sneaking
	cooldown_reduction_per_rank = 2 SECONDS

/datum/action/cooldown/spell/undirected/rogue_vanish/cast(mob/living/carbon/human/user)
	. = ..()
	new /obj/effect/particle_effect/smoke(get_turf(user))
	user.visible_message(span_warning("[user] tosses a smokebomb to the ground and vanishes in a puff of smoke!"), span_notice("I toss a smokebomb to the ground and vanish in a puff of smoke!"))
	playsound(user.loc, 'sound/misc/explode/incendiary (1).ogg', 50, FALSE, -1)
	for(var/mob/living/simple_animal/hostile/nearmob in viewers(12, user))
		nearmob.ai_controller.CancelActions()
	for(var/mob/living/carbon/human/nearmob in viewers(12, user))
		nearmob.ai_controller.CancelActions()
	animate(user, alpha = 100, time = 0.5 SECONDS, easing = EASE_IN)
	addtimer(CALLBACK(user, TYPE_PROC_REF(/mob/living, update_sneak_invis), TRUE), 6 SECONDS)
	addtimer(CALLBACK(user, TYPE_PROC_REF(/atom/movable, visible_message), span_warning("[user] fades back into view."), span_warning("I become visible again.")), 6 SECONDS)
	return FALSE
