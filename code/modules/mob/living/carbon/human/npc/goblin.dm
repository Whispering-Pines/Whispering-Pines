/mob/living/carbon/human/species/goblin
	name = "goblin"

	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	icon_state = "goblin"
	race = /datum/species/goblin
	gender = MALE
	bodyparts = list(/obj/item/bodypart/chest/goblin, /obj/item/bodypart/head/goblin, /obj/item/bodypart/l_arm/goblin,
					/obj/item/bodypart/r_arm/goblin, /obj/item/bodypart/r_leg/goblin, /obj/item/bodypart/l_leg/goblin)
	rot_type = /datum/component/rot/corpse/goblin
	var/gob_outfit = /datum/outfit/job/npc/goblin
	ambushable = FALSE
	base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, /datum/intent/unarmed/claw)
	a_intent = INTENT_HELP
	possible_mmb_intents = list(INTENT_STEAL, INTENT_JUMP, INTENT_KICK, INTENT_BITE)
	possible_rmb_intents = list(/datum/rmb_intent/feint, /datum/rmb_intent/swift, /datum/rmb_intent/riposte, /datum/rmb_intent/weak)
	flee_in_pain = TRUE
	stand_attempts = 6
	vitae_pool = 250 // Small, frail creechers with not so much vitality to gain from.
	erpable = TRUE
	hornychance = 50
	skin_tone = "e8b59b"
	var/bounty = 30

	//genital slop
	show_genitals = TRUE
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin
	ass_organ = /obj/item/organ/butt/goblin
	penis_organ = /obj/item/organ/penis/goblin
	vagina_organ = /obj/item/organ/filling_organ/vagina/goblin
	breast_min = 3
	breast_max = 4
	penis_min = 2
	penis_max = 2
	ball_min = 3
	ball_max = 3
	butt_min = 0
	butt_max = 0

/mob/living/carbon/human/species/goblin/npc
	ai_controller = /datum/ai_controller/human_npc
	dodgetime = 30 //they can dodge easily, but have a cooldown on it
	flee_in_pain = TRUE

	wander = FALSE

/mob/living/carbon/human/species/goblin/npc/Initialize()
	. = ..()
	AddComponent(/datum/component/ai_aggro_system)
	AddComponent(/datum/component/combat_noise, list("laugh" = 2))

/mob/living/carbon/human/species/goblin/npc/ambush
	simpmob_attack = 35
	simpmob_defend = 25
	wander = TRUE
	attack_speed = 2

/mob/living/carbon/human/species/goblin/hell
	name = "hell goblin"
	race = /datum/species/goblin/hell
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/hell
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/hell
	ass_organ = /obj/item/organ/butt/goblin/hell
	penis_organ = /obj/item/organ/penis/goblin/hell

/mob/living/carbon/human/species/goblin/npc/hell
	race = /datum/species/goblin/hell
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/hell
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/hell
	ass_organ = /obj/item/organ/butt/goblin/hell
	penis_organ = /obj/item/organ/penis/goblin/hell

/mob/living/carbon/human/species/goblin/npc/ambush/hell
	race = /datum/species/goblin/hell
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/hell
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/hell
	ass_organ = /obj/item/organ/butt/goblin/hell
	penis_organ = /obj/item/organ/penis/goblin/hell

/datum/species/goblin/hell
	name = "hell goblin"
	id = "goblin_hell"
	raceicon = "goblin_hell"

/mob/living/carbon/human/species/goblin/cave
	name = "cave goblin"
	race = /datum/species/goblin/cave
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/cave
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/cave
	ass_organ = /obj/item/organ/butt/goblin/cave
	penis_organ = /obj/item/organ/penis/goblin/cave

/mob/living/carbon/human/species/goblin/npc/cave
	race = /datum/species/goblin/cave
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/cave
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/cave
	ass_organ = /obj/item/organ/butt/goblin/cave
	penis_organ = /obj/item/organ/penis/goblin/cave

/mob/living/carbon/human/species/goblin/npc/ambush/cave
	race = /datum/species/goblin/cave
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/cave
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/cave
	ass_organ = /obj/item/organ/butt/goblin/cave
	penis_organ = /obj/item/organ/penis/goblin/cave

/datum/species/goblin/cave
	id = "goblin_cave"
	raceicon = "goblin_cave"

/mob/living/carbon/human/species/goblin/sea
	name = "sea goblin"
	race = /datum/species/goblin/sea
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/sea
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/sea
	ass_organ = /obj/item/organ/butt/goblin/sea
	penis_organ = /obj/item/organ/penis/goblin/sea

/mob/living/carbon/human/species/goblin/npc/sea
	race = /datum/species/goblin/sea
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/sea
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/sea
	ass_organ = /obj/item/organ/butt/goblin/sea
	penis_organ = /obj/item/organ/penis/goblin/sea

/mob/living/carbon/human/species/goblin/npc/ambush/sea
	race = /datum/species/goblin/sea
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/sea
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/sea
	ass_organ = /obj/item/organ/butt/goblin/sea
	penis_organ = /obj/item/organ/penis/goblin/sea

/datum/species/goblin/sea
	raceicon = "goblin_sea"
	id = "goblin_sea"

/mob/living/carbon/human/species/goblin/moon
	name = "moon goblin"
	race = /datum/species/goblin/moon
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/moon
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/moon
	ass_organ = /obj/item/organ/butt/goblin/moon
	penis_organ = /obj/item/organ/penis/goblin/moon

/mob/living/carbon/human/species/goblin/npc/moon
	race = /datum/species/goblin/moon
	race = /datum/species/goblin/moon
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/moon
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/moon
	ass_organ = /obj/item/organ/butt/goblin/moon
	penis_organ = /obj/item/organ/penis/goblin/moon

/mob/living/carbon/human/species/goblin/npc/ambush/moon
	race = /datum/species/goblin/moon
	race = /datum/species/goblin/moon
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/moon
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/moon
	ass_organ = /obj/item/organ/butt/goblin/moon
	penis_organ = /obj/item/organ/penis/goblin/moon

/datum/species/goblin/moon
	id = "goblin_moon"
	raceicon = "goblin_moon"

/datum/species/goblin/moon/spec_death(gibbed, mob/living/carbon/human/H)
	new /obj/item/reagent_containers/powder/moondust_purest(get_turf(H))
	H.visible_message("<span class='blue'>Moondust falls from [H]!</span>")
//	qdel(H)

/obj/item/bodypart/chest/goblin
	dismemberable = 1
/obj/item/bodypart/l_arm/goblin
	dismemberable = 1
/obj/item/bodypart/r_arm/goblin
	dismemberable = 1
/obj/item/bodypart/r_leg/goblin
	dismemberable = 1
/obj/item/bodypart/l_leg/goblin
	dismemberable = 1

/obj/item/bodypart/head/goblin/update_icon_dropped()
	return

/obj/item/bodypart/head/goblin/get_limb_icon(dropped, hideaux = FALSE)
	return

/obj/item/bodypart/head/goblin/skeletonize()
	. = ..()
	icon_state = "goblin_skel_head"
	if(headprice)
		headprice = 2

/obj/item/bodypart/head/goblin/drop_organs(mob/user, violent_removal)
	. = ..()
	sellprice = 0

/datum/species/goblin
	name = "goblin"
	id = "goblin"
	species_traits = list(NO_UNDERWEAR)
	inherent_traits = list(TRAIT_RESISTCOLD,TRAIT_RESISTHIGHPRESSURE,TRAIT_RESISTLOWPRESSURE,TRAIT_RADIMMUNE, TRAIT_EASYDISMEMBER, TRAIT_CRITICAL_WEAKNESS, TRAIT_NASTY_EATER, TRAIT_LEECHIMMUNE, TRAIT_INHUMENCAMP)

	offset_features_m = list(
		OFFSET_ID = list(0,-4), OFFSET_GLOVES = list(0,-4), OFFSET_WRISTS = list(0,-4),\
		OFFSET_CLOAK = list(0,0), OFFSET_FACEMASK = list(0,-5), OFFSET_HEAD = list(0,-4), \
		OFFSET_FACE = list(0,-5), OFFSET_BELT = list(0,-4), OFFSET_BACK = list(0,-4), \
		OFFSET_NECK = list(0,-4), OFFSET_MOUTH = list(0,-4), OFFSET_PANTS = list(0,0), \
		OFFSET_SHIRT = list(0,0), OFFSET_ARMOR = list(0,0), OFFSET_HANDS = list(0,-3), OFFSET_BUTT = list(0,-4),\ OFFSET_UNDIES = list(0,-4)
		)
	offset_features_f = list(
		OFFSET_ID = list(0,-5), OFFSET_GLOVES = list(0,-4), OFFSET_WRISTS = list(0,-4), OFFSET_HANDS = list(0,-4), \
		OFFSET_CLOAK = list(0,0), OFFSET_FACEMASK = list(0,-5), OFFSET_HEAD = list(0,-5), \
		OFFSET_FACE = list(0,-5), OFFSET_BELT = list(0,-4), OFFSET_BACK = list(0,-5), \
		OFFSET_NECK = list(0,-5), OFFSET_MOUTH = list(0,-5), OFFSET_PANTS = list(0,0), \
		OFFSET_SHIRT = list(0,0), OFFSET_ARMOR = list(0,0), OFFSET_BUTT = list(0,-4),\ OFFSET_UNDIES = list(0,-4)
		)
	dam_icon_f = null
	dam_icon_m = null
	damage_overlay_type = ""
	changesource_flags = WABBAJACK
	custom_clothes = TRUE
	var/raceicon = "goblin"

/datum/species/goblin/regenerate_icons(mob/living/carbon/human/H)
	H.icon_state = ""
	if(H.notransform)
		return 1
	H.update_inv_hands()
	H.update_inv_handcuffed()
	H.update_inv_legcuffed()
	H.update_fire()
	H.update_body()
	var/mob/living/carbon/human/species/goblin/G = H
	G.update_wearable()
	H.update_transform()
	return TRUE

/mob/living/carbon/human/species/goblin/update_body()
	remove_overlay(BODY_LAYER)
	if(!dna || !dna.species)
		return
	var/datum/species/goblin/G = dna.species
	if(!istype(G))
		return
	icon_state = ""
	var/list/standing = list()
	var/mutable_appearance/body_overlay
	var/obj/item/bodypart/chesty = get_bodypart("chest")
	var/obj/item/bodypart/headdy = get_bodypart("head")
	if(!headdy)
		if(chesty && chesty.skeletonized)
			body_overlay = mutable_appearance(icon, "goblin_skel_decap", -BODY_LAYER)
		else
			body_overlay = mutable_appearance(icon, "[G.raceicon]_decap", -BODY_LAYER)
	else
		if(chesty && chesty.skeletonized)
			body_overlay = mutable_appearance(icon, "goblin_skel", -BODY_LAYER)
		else
			body_overlay = mutable_appearance(icon, "[G.raceicon]", -BODY_LAYER)

	if(body_overlay)
		standing += body_overlay
	if(standing.len)
		overlays_standing[BODY_LAYER] = standing

	apply_overlay(BODY_LAYER)
	dna.species.update_damage_overlays()

/mob/living/carbon/human/proc/update_wearable()
	remove_overlay(ARMOR_LAYER)

	var/list/standing = list()
	var/mutable_appearance/body_overlay
	if(wear_armor)
		body_overlay = mutable_appearance(icon, "[wear_armor.item_state]", -ARMOR_LAYER)
		if(body_overlay)
			standing += body_overlay
	if(head)
		body_overlay = mutable_appearance(icon, "[head.item_state]", -ARMOR_LAYER)
		if(body_overlay)
			standing += body_overlay
	if(standing.len)
		overlays_standing[ARMOR_LAYER] = standing

	apply_overlay(ARMOR_LAYER)


/mob/living/carbon/human/species/goblin/update_inv_head()
	update_wearable()
/mob/living/carbon/human/species/goblin/update_inv_armor()
	update_wearable()

/datum/species/goblin/update_damage_overlays(mob/living/carbon/human/H)
	return

/mob/living/carbon/human/species/goblin/Initialize()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)

/mob/living/carbon/human/species/goblin/after_creation()
	..()
	gender = MALE
	if(src.dna && src.dna.species)
		src.dna.species.soundpack_m = new /datum/voicepack/goblin()
		src.dna.species.soundpack_f = new /datum/voicepack/goblin()
		var/obj/item/bodypart/head/headdy = get_bodypart("head")
		if(headdy)
			headdy.icon = 'icons/roguetown/mob/monster/goblins.dmi'
			headdy.icon_state = "[src.dna.species.id]_head"
			headdy.headprice = rand(7,20)
	var/obj/item/organ/eyes/eyes = src.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(src,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/nightmare
	eyes.Insert(src)
	for(var/slot in internal_organs_slot)
		var/obj/item/organ/organ = internal_organs_slot[slot]
		organ.sellprice = 5
	src.underwear = null
	if(src.charflaw)
		QDEL_NULL(src.charflaw)
	update_body()
	faction = list(FACTION_ORCS)
	name = "goblin"
	real_name = "goblin"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)
//	ADD_TRAIT(src, TRAIT_NOBREATH, TRAIT_GENERIC)
//	blue breathes underwater, need a new specific one for this maybe organ cheque
//	ADD_TRAIT(src, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	if(gob_outfit)
		var/datum/outfit/O = new gob_outfit
		if(O)
			equipOutfit(O)

/datum/component/rot/corpse/goblin/process()
	var/amt2add = 10 //1 second
	var/time_elapsed = last_process ? (world.time - last_process)/10 : 1
	if(last_process)
		amt2add = ((world.time - last_process)/10) * amt2add
	last_process = world.time
	amount += amt2add
	if(has_world_trait(/datum/world_trait/pestra_mercy))
		amount -= 5 * time_elapsed

	var/mob/living/carbon/C = parent
	if(!C)
		qdel(src)
		return
	if(C.stat != DEAD)
		qdel(src)
		return
	var/should_update = FALSE
	if(amount > 8 MINUTES)
		for(var/obj/item/bodypart/B in C.bodyparts)
			if(!B.skeletonized)
				B.skeletonized = TRUE
				should_update = TRUE
	else if(amount > 4 MINUTES)
		for(var/obj/item/bodypart/B in C.bodyparts)
			if(!B.rotted)
				B.rotted = TRUE
				should_update = TRUE
			if(B.rotted && amount < 6 MINUTES && !(FACTION_DISMAS in C.faction))
				var/turf/open/T = C.loc
				if(istype(T))
					T.pollute_turf(/datum/pollutant/rot, 4)
	if(should_update)
		if(amount > 8 MINUTES)
			C.update_body()
			qdel(src)
			return
		else if(amount > 12 MINUTES)
			C.update_body()

/////
////
////
//// OUTFGITS						//////////////////
////
///

/datum/outfit/job/npc/goblin/pre_equip(mob/living/carbon/human/H)
	..()
	H.base_strength = rand(6, 10)
	H.base_perception = rand(5, 10)
	H.base_intelligence = rand(1, 4)
	H.base_constitution = rand(4, 8)
	H.base_endurance = rand(8, 12)
	H.base_speed = rand(8, 14)
	if(is_species(H, /datum/species/goblin/hell))
		H.STASTR += 6
		H.STACON += 6
		H.STASPD -= 4
		H.simpmob_attack += 10
		H.simpmob_defend += 15
	if(is_species(H, /datum/species/goblin/cave))
		H.STAPER += 6
		H.STAEND += 2
	if(is_species(H, /datum/species/goblin/sea))
		H.STAINT += 6
		H.STAEND += 2
	if(is_species(H, /datum/species/goblin/moon))
		H.STAINT += 4
		H.STASPD += 4
		H.simpmob_attack += 10
		H.simpmob_defend += 25
	var/loadout = rand(1,6)
	switch(loadout)
		if(1) //tribal spear
			r_hand = /obj/item/weapon/polearm/spear/stone
			armor = /obj/item/clothing/armor/leather/hide/goblin
		if(2) //tribal axe
			r_hand = /obj/item/weapon/axe/stone
			armor = /obj/item/clothing/armor/leather/hide/goblin
		if(3) //tribal club
			r_hand = /obj/item/weapon/mace/woodclub
			armor = /obj/item/clothing/armor/leather/hide/goblin
			if(prob(10))
				head = /obj/item/clothing/head/helmet/leather/goblin
		if(4) //lightly armored sword/flail/daggers
			H.simpmob_attack += 25
			H.simpmob_defend += 10
			if(prob(50))
				r_hand = /obj/item/weapon/sword/iron
			else
				r_hand = /obj/item/weapon/mace/spiked
			if(prob(30))
				l_hand = /obj/item/weapon/shield/wood
			if(prob(23))
				r_hand = /obj/item/weapon/knife/stone
				l_hand = /obj/item/weapon/knife/stone
			armor = /obj/item/clothing/armor/leather/goblin
			if(prob(80))
				head = /obj/item/clothing/head/helmet/leather/goblin
		if(5) //heavy armored sword/flail/shields
			H.simpmob_attack += 45
			H.simpmob_defend += 25
			ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
			if(prob(30))
				armor = /obj/item/clothing/armor/cuirass/iron/goblin
			else
				armor = /obj/item/clothing/armor/leather/goblin
			if(prob(80))
				head = /obj/item/clothing/head/helmet/goblin
			else
				head = /obj/item/clothing/head/helmet/leather/goblin
			if(prob(50))
				r_hand = /obj/item/weapon/sword/iron
			else
				r_hand = /obj/item/weapon/mace/spiked
			if(prob(20))
				r_hand = /obj/item/weapon/flail
			l_hand = /obj/item/weapon/shield/wood
		if(6) //tribal club with rope for lewd
			r_hand = /obj/item/weapon/mace/woodclub
			l_hand = /obj/item/rope
			//pants = /obj/item/clothing/pants/loincloth/goblinloin //lewd goblins don't need lioncloths i guess
			H.seeksfuck = TRUE

////
////
/// INVADER ZIM
///
///
///


/obj/structure/gob_portal
	name = "Gob Portal"
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "shitportal"
	max_integrity = 200
	anchored = TRUE
	density = FALSE
	layer = BELOW_OBJ_LAYER
	var/gobs = 0
	var/maxgobs = 3
	var/datum/looping_sound/boneloop/soundloop
	var/spawning = FALSE
	var/moon_goblins = 0
	attacked_sound = 'sound/vo/mobs/ghost/skullpile_hit.ogg'

/obj/structure/gob_portal/Initialize()
	. = ..()
	soundloop = new(src, FALSE)
	soundloop.start()
	spawn_gob()

/obj/structure/gob_portal/Destroy()
	if(soundloop)
		QDEL_NULL(soundloop)
	return ..()

/obj/structure/gob_portal/attack_ghost(mob/dead/observer/user)
	if(QDELETED(user))
		return
	if(!in_range(src, user))
		return
	if(gobs >= (maxgobs+1))
		to_chat(user, "<span class='danger'>Too many Gobs.</span>")
		return
	gobs++
	var/mob/living/carbon/human/species/goblin/npc/N = new (get_turf(src))
	N.key = user.key
	qdel(user)


/obj/structure/gob_portal/proc/creategob()
	if(QDELETED(src))
		return
	if(!spawning)
		return
	spawning = FALSE
	if(moon_goblins == 0)
		if(GLOB.tod == "night")
			if(prob(30))
				moon_goblins = 1
			else
				moon_goblins = 2
	if(moon_goblins == 1)
		new /mob/living/carbon/human/species/goblin/npc/moon(get_turf(src))
	else
		new /mob/living/carbon/human/species/goblin/npc(get_turf(src))
	gobs++
	update_appearance()
	if(living_player_count() < 10)
		maxgobs = 1
	if(gobs < maxgobs)
		spawn_gob()

/obj/structure/gob_portal/proc/spawn_gob()
	if(QDELETED(src))
		return
	if(spawning)
		return
	spawning = TRUE
	update_appearance()
	addtimer(CALLBACK(src, PROC_REF(creategob)), 2 SECONDS)

/obj/structure/gob_portal/Destroy()
	soundloop.stop()
	. = ..()

//custom genital slop, could not do it a better way.

/obj/item/organ/butt/goblin
	name = "goblin butt"
	accessory_type = /datum/sprite_accessory/butt/goblin

/datum/sprite_accessory/butt/goblin
	name = "goblin butt"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblin"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/penis/goblin
	name = "goblin penis"
	accessory_type = /datum/sprite_accessory/penis/goblin

/datum/sprite_accessory/penis/goblin
	name = "goblin penis"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblin"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/testicles/goblin
	name = "goblin testicles"
	accessory_type = /datum/sprite_accessory/testicles/goblin

/datum/sprite_accessory/testicles/goblin
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinballs"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/breasts/goblin
	name = "goblin breasts"
	accessory_type = /datum/sprite_accessory/breasts/goblin

/datum/sprite_accessory/breasts/goblin
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinbreasts"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/vagina/goblin
	name = "goblin vagina"
	accessory_type = /datum/sprite_accessory/vagina/goblin

/datum/sprite_accessory/vagina/goblin
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinpussy"
	color_key_defaults = list(KEY_SKIN_COLOR)

//

/obj/item/organ/butt/goblin/sea
	name = "goblin butt"
	accessory_type = /datum/sprite_accessory/butt/goblin/sea

/datum/sprite_accessory/butt/goblin/sea
	name = "goblin butt"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinsea"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/penis/goblin/sea
	name = "goblin penis"
	accessory_type = /datum/sprite_accessory/penis/goblin/sea

/datum/sprite_accessory/penis/goblin/sea
	name = "goblin penis"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinsea"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/testicles/goblin/sea
	name = "goblin testicles"
	accessory_type = /datum/sprite_accessory/testicles/goblin/sea

/datum/sprite_accessory/testicles/goblin/sea
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinseaballs"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/breasts/goblin/sea
	name = "goblin breasts"
	accessory_type = /datum/sprite_accessory/breasts/goblin/sea

/datum/sprite_accessory/breasts/goblin/sea
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinseabreasts"
	color_key_defaults = list(KEY_SKIN_COLOR)

//

/obj/item/organ/butt/goblin/cave
	name = "goblin butt"
	accessory_type = /datum/sprite_accessory/butt/goblin/cave

/datum/sprite_accessory/butt/goblin/cave
	name = "goblin butt"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblincave"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/penis/goblin/cave
	name = "goblin penis"
	accessory_type = /datum/sprite_accessory/penis/goblin/cave

/datum/sprite_accessory/penis/goblin/cave
	name = "goblin penis"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblincave"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/testicles/goblin/cave
	name = "goblin testicles"
	accessory_type = /datum/sprite_accessory/testicles/goblin/cave

/datum/sprite_accessory/testicles/goblin/cave
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblincaveballs"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/breasts/goblin/cave
	name = "goblin breasts"
	accessory_type = /datum/sprite_accessory/breasts/goblin/cave

/datum/sprite_accessory/breasts/goblin/cave
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblincavebreasts"
	color_key_defaults = list(KEY_SKIN_COLOR)
//

/obj/item/organ/butt/goblin/hell
	name = "goblin butt"
	accessory_type = /datum/sprite_accessory/butt/goblin/hell

/datum/sprite_accessory/butt/goblin/hell
	name = "goblin butt"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinhell"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/penis/goblin/hell
	name = "goblin penis"
	accessory_type = /datum/sprite_accessory/penis/goblin/hell

/datum/sprite_accessory/penis/goblin/hell
	name = "goblin penis"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinhell"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/testicles/goblin/hell
	name = "goblin testicles"
	accessory_type = /datum/sprite_accessory/testicles/goblin/hell

/datum/sprite_accessory/testicles/goblin/hell
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinhellballs"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/breasts/goblin/hell
	name = "goblin breasts"
	accessory_type = /datum/sprite_accessory/breasts/goblin/hell

/datum/sprite_accessory/breasts/goblin/hell
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinhellbreasts"
	color_key_defaults = list(KEY_SKIN_COLOR)

//

/obj/item/organ/butt/goblin/moon
	name = "goblin butt"
	accessory_type = /datum/sprite_accessory/butt/goblin/moon

/datum/sprite_accessory/butt/goblin/moon
	name = "goblin butt"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinmoon"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/penis/goblin/moon
	name = "goblin penis"
	accessory_type = /datum/sprite_accessory/penis/goblin/moon

/datum/sprite_accessory/penis/goblin/moon
	name = "goblin penis"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinmoon"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/testicles/goblin/moon
	name = "goblin testicles"
	accessory_type = /datum/sprite_accessory/testicles/goblin/moon

/datum/sprite_accessory/testicles/goblin/moon
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinmoonballs"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/breasts/goblin/moon
	name = "goblin breasts"
	accessory_type = /datum/sprite_accessory/breasts/goblin/moon

/datum/sprite_accessory/breasts/goblin/moon
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinmoonbreasts"
	color_key_defaults = list(KEY_SKIN_COLOR)
