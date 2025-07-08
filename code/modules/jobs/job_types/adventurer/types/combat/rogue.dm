/datum/advclass/combat/rogue
	name = "Rogue"
	tutorial = "A wandering rogue, capable of breaking in and out of just about any secure location, and born to meet the sharp end of the guillotine. Just remember, murder is the mark of an amateur."
	allowed_sexes = list(MALE, FEMALE)

	outfit = /datum/outfit/job/adventurer/rogue
	min_pq = 5
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
	armor = /obj/item/clothing/armor/leather
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
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/rogue_vanish) //stealth guy more than others.
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
	else
		armor = /obj/item/clothing/armor/leather
		shirt = /obj/item/clothing/armor/gambeson
	gloves = /obj/item/clothing/gloves/fingerless
	pants = /obj/item/clothing/pants/trou/leather
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
		shirt = /obj/item/clothing/armor/gambeson/bikini
	else
		shirt = /obj/item/clothing/armor/gambeson
	gloves = /obj/item/clothing/gloves/leather/black
	pants = /obj/item/clothing/pants/trou/leather
	shoes = /obj/item/clothing/shoes/nobleboot
	belt = /obj/item/storage/belt/leather
	if(H.gender == FEMALE) //funny
		shirt = /obj/item/clothing/armor/chainmail/bikini
	else
		shirt = /obj/item/clothing/armor/chainmail
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
	pants = /obj/item/clothing/pants/trou/leather
	gloves = /obj/item/clothing/gloves/fingerless
	belt = /obj/item/storage/belt/leather
	if(H.gender == FEMALE)
		armor = /obj/item/clothing/armor/leather/bikini
		shirt = /obj/item/clothing/armor/gambeson/bikini
	else
		armor = /obj/item/clothing/armor/leather
		shirt = /obj/item/clothing/armor/gambeson
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
		H.mind.adjust_spellpoints(1)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fetch)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/rogue_knock)

// Rogue spells/abilities
/obj/effect/proc_holder/spell/aoe_turf/rogue_knock
	name = "Knock"
	desc = ""
	range = 1
	overlay_state = "null"
	sound = list('sound/combat/cleave.ogg')
	releasedrain = 50
	chargedrain = 1
	chargetime = 15
	cast_without_targets = TRUE
	recharge_time = 5 MINUTES
	warnie = "spellwarning"
	movement_interrupt = FALSE
	chargedloop = /datum/looping_sound/invokegen
	invocation = "OPEN SESAME!!"
	invocation_type = "shout"
	action_icon_state = "knock"
	associated_skill = /datum/skill/magic/arcane
	miracle = FALSE

/obj/effect/proc_holder/spell/aoe_turf/rogue_knock/cast(list/targets, mob/user)
	. = ..()
	SEND_SOUND(user, sound('sound/combat/cleave.ogg'))
	knock_sound(user)
	for(var/turf/T in targets)
		for(var/obj/structure/door/D in T.contents)
			INVOKE_ASYNC(src, PROC_REF(open_door), D)
		for(var/obj/structure/closet/crate/C in T.contents)
			INVOKE_ASYNC(src, PROC_REF(open_closet), C)

/obj/effect/proc_holder/spell/aoe_turf/rogue_knock/proc/open_door(obj/structure/door/D)
	if(D.locked())
		D.unlock()
	D.force_open()

/obj/effect/proc_holder/spell/aoe_turf/rogue_knock/proc/open_closet(obj/structure/closet/crate/C)
	if(C.locked())
		C.unlock()
	C.open()

/obj/effect/proc_holder/spell/aoe_turf/rogue_knock/proc/knock_sound(mob/living/user)
	user.visible_message(span_warning("A loud KNOCK comes from [user]!"))
	var/turf/origin_turf = get_turf(src)

	for(var/mob/living/player in GLOB.player_list)
		if(player.stat == DEAD)
			continue
		if(isbrain(player))
			continue

		var/distance = get_dist(player, origin_turf)
		if(distance <= 7)
			continue
		var/dirtext = " to the "
		var/direction = get_dir(player, origin_turf)
		switch(direction)
			if(NORTH)
				dirtext += "north"
			if(SOUTH)
				dirtext += "south"
			if(EAST)
				dirtext += "east"
			if(WEST)
				dirtext += "west"
			if(NORTHWEST)
				dirtext += "northwest"
			if(NORTHEAST)
				dirtext += "northeast"
			if(SOUTHWEST)
				dirtext += "southwest"
			if(SOUTHEAST)
				dirtext += "southeast"
			else //Where ARE you.
				dirtext = ", although I cannot make out a direction"
		var/disttext
		switch(distance)
			if(0 to 20)
				disttext = " very close"
			if(20 to 40)
				disttext = " close"
			if(40 to 80)
				disttext = ""
			if(80 to 160)
				disttext = " far"
			else
				disttext = " very far"
		if(distance < 80)
			//sound played for other players
			player.playsound_local(get_turf(player), 'sound/combat/cleave.ogg', 35, FALSE, pressure_affected = FALSE)
			to_chat(player, span_warning("I hear a loud KNOCK somewhere[disttext][dirtext]!"))

//rogue innate vanish
/obj/effect/proc_holder/spell/self/rogue_vanish
	name = "Vanish"
	overlay_state = "Smoke Bomb"
	releasedrain = 0
	recharge_time = 20 SECONDS
	still_recharging_msg = span_notice("I don't have another smoke bomb ready yet.")
	warnie = "sydwarning"
	invocation_emote_self = "pulls out a smoke bomb and slams it to the ground!"
	movement_interrupt = FALSE
	antimagic_allowed = TRUE
	sound = 'sound/misc/explode/incendiary (1).ogg'
	invocation = ""
	invocation_type = "none"
	associated_skill = /datum/skill/misc/sneaking
	cooldown_min = 10 SECONDS

/obj/effect/proc_holder/spell/self/rogue_vanish/cast(mob/living/carbon/human/user)
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
