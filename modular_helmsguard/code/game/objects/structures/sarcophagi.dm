/obj/structure/closet/crate/coffin/sarcophagus
	name = "sarcophagus"
	icon_state = "sarcophagus"
	desc = "A place for the dignified dead to rest."
	anchored = TRUE
	resistance_flags = null
	open_sound_volume = 25
	close_sound_volume = 50
	max_integrity = 120
	icon = 'modular_helmsguard/icons/obj/structure/crypt.dmi'
	open_sound = 'sound/foley/doors/stoneopen.ogg'
	close_sound = 'sound/foley/doors/stoneclose.ogg'
	var/occupant = null //the occupant of the sarcophagus, if any

/datum/slapcraft_recipe/masonry/structure/sarcophagus
	name = "sarcophagus"
	steps = list(
		/datum/slapcraft_step/item/stone,
		/datum/slapcraft_step/use_item/masonry/hammer,
		/datum/slapcraft_step/item/stone/second,
		/datum/slapcraft_step/use_item/masonry/chisel,
		/datum/slapcraft_step/item/stone/third,
		/datum/slapcraft_step/use_item/masonry/chisel/second,
		/datum/slapcraft_step/item/stone/fourth,
		/datum/slapcraft_step/use_item/masonry/chisel/third,
	)
	result_type = /obj/structure/closet/crate/coffin/sarcophagus/alt2
	craftdiff = 2

/datum/slapcraft_recipe/masonry/structure/sarcophagustwo
	name = "sarcophagus (candle)"
	steps = list(
		/datum/slapcraft_step/item/stone,
		/datum/slapcraft_step/use_item/masonry/hammer,
		/datum/slapcraft_step/item/stone/second,
		/datum/slapcraft_step/use_item/masonry/chisel,
		/datum/slapcraft_step/item/stone/third,
		/datum/slapcraft_step/use_item/masonry/chisel/second,
		/datum/slapcraft_step/item/stone/fourth,
		/datum/slapcraft_step/use_item/masonry/chisel/third,
	)
	result_type = /obj/structure/closet/crate/coffin/sarcophagus/alt3
	craftdiff = 2


/obj/structure/closet/crate/coffin/sarcophagus/alt
	icon_state = "sarcophagus2"

/obj/structure/closet/crate/coffin/sarcophagus/alt2
	icon_state = "sarcophagus3"

/obj/structure/closet/crate/coffin/sarcophagus/alt3
	icon_state = "sarcophagus4"


/obj/structure/sarcophagus
	name = "sarcophagus"
	icon = 'modular_helmsguard/icons/obj/structure/crypt.dmi'
	icon_state = "sarcophagus_abandoned"
	anchored = TRUE
	density = TRUE

/obj/structure/sarcophagus/alt
	icon_state = "sarcophagus_abandoned2"

/obj/structure/closet/crate/coffin/sarcophagus/open(mob/living/user)
	if(opened)
		return
	if(user)
		if(!can_open(user))
			return
	if(do_after(usr, 30, target = src))
		playsound(loc, open_sound, open_sound_volume, FALSE, -3)
		opened = TRUE
		if(!dense_when_open)
			density = FALSE
	//	climb_time *= 0.5 //it's faster to climb onto an open thing
		dump_contents()
		update_icon()
		return 1


/obj/structure/closet/crate/coffin/sarcophagus/close(mob/living/user)
	if(!opened)
		return FALSE
	if(user)
		if(!can_close(user))
			return FALSE
	if(do_after(usr, 30, target = src))
		take_contents()
		playsound(loc, close_sound, close_sound_volume, FALSE, -3)
	//	climb_time = initial(climb_time)
		opened = FALSE
		density = TRUE
		update_icon()
		return TRUE

/obj/effect/spawner/lootdrop/dungeon/corpses
	loot = list(
	/mob/living/carbon/human/species/skeleton/dead/adventurer = 5,
	/mob/living/carbon/human/species/skeleton/dead/manatarms = 7,
	/mob/living/carbon/human/species/skeleton/dead/knight = 1,
	/mob/living/carbon/human/species/skeleton/dead/noble = 3,
	/obj/effect/decal/remains/human = 5,
		)
	lootcount = 1

/obj/effect/spawner/lootdrop/dungeon/corpses_no_soldiers
	loot = list(
	/mob/living/carbon/human/species/skeleton/dead/adventurer = 5,
	/mob/living/carbon/human/species/skeleton/dead/noble = 3,
	/obj/effect/decal/remains/human = 5,
		)
	lootcount = 1

/obj/structure/closet/crate/coffin/sarcophagus/danger
	name = "sarcophagus"
	icon_state = "sarcophagus"
	var/springed = FALSE

/obj/structure/closet/crate/coffin/sarcophagus/danger/alt
	icon_state = "sarcophagus2"

/obj/structure/closet/crate/coffin/sarcophagus/danger/alt2
	icon_state = "sarcophagus3"

/obj/structure/closet/crate/coffin/sarcophagus/danger/alt3
	icon_state = "sarcophagus4"



/obj/structure/closet/crate/coffin/sarcophagus/danger/open(mob/living/user)
	if(opened)
		return
	if(user)
		if(!can_open(user))
			return
	if(do_after(usr, 30, target = src))
		playsound(loc, open_sound, open_sound_volume, FALSE, -3)
		opened = TRUE
		if(!dense_when_open)
			density = FALSE
		dump_contents()
		update_icon()
		if(!springed)
			new /mob/living/carbon/human/species/skeleton/npc/ambush(get_turf(src))
			springed = TRUE
		return 1
	..()

/obj/structure/closet/crate/coffin/sarcophagus/dungeon/alt
	icon_state = "sarcophagus2"

/obj/structure/closet/crate/coffin/sarcophagus/dungeon/alt2
	icon_state = "sarcophagus3"

/obj/structure/closet/crate/coffin/sarcophagus/dungeon/alt3
	icon_state = "sarcophagus4"


/obj/structure/closet/crate/coffin/sarcophagus/dungeon/PopulateContents()
	..()
	occupant = pick(/mob/living/carbon/human/species/skeleton/dead/adventurer,
					/mob/living/carbon/human/species/skeleton/dead/noble,
					)
	new occupant(src)


/obj/effect/spawner/lootdrop/sarcophagi
	name = "sarcophagi"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "redskull"
	loot = list(
	/obj/structure/closet/crate/coffin/sarcophagus/danger = 10,
	/obj/structure/closet/crate/coffin/sarcophagus/danger/alt = 10,
	/obj/structure/closet/crate/coffin/sarcophagus/danger/alt2 = 10,
	/obj/structure/closet/crate/coffin/sarcophagus/danger/alt3 = 10,
	/obj/structure/closet/crate/coffin/sarcophagus/dungeon = 10,
	/obj/structure/closet/crate/coffin/sarcophagus/dungeon/alt = 10,
	/obj/structure/closet/crate/coffin/sarcophagus/dungeon/alt2 = 10,
	/obj/structure/closet/crate/coffin/sarcophagus/dungeon/alt3 = 10,
	/obj/structure/closet/crate/coffin/sarcophagus = 5,
	/obj/structure/closet/crate/coffin/sarcophagus/alt = 5,
	/obj/structure/closet/crate/coffin/sarcophagus/alt2 = 5,
	/obj/structure/closet/crate/coffin/sarcophagus/alt3 = 5,
	/obj/structure/sarcophagus = 1,
	/obj/structure/sarcophagus/alt =1.
	)
	lootcount = 1




//corpses
// SKELETONS

//Mob

/mob/living/carbon/human/species/skeleton/dead

/mob/living/carbon/human/species/skeleton/dead/after_creation()
	..()
	death()

/mob/living/carbon/human/species/skeleton/dead/adventurer
	skel_outfit = /datum/outfit/job/npc/skeleton/dead/adventurer

/mob/living/carbon/human/species/skeleton/dead/manatarms
	skel_outfit = /datum/outfit/job/npc/skeleton/dead/manatarms

/mob/living/carbon/human/species/skeleton/dead/knight
	skel_outfit = /datum/outfit/job/npc/skeleton/dead/knight

/mob/living/carbon/human/species/skeleton/dead/noble
	skel_outfit = /datum/outfit/job/npc/skeleton/dead/noble

/mob/living/carbon/human/species/skeleton/dead/peasant
	skel_outfit = /datum/outfit/job/npc/skeleton/dead/peasant

/mob/living/carbon/human/species/skeleton/dead/freitrupp
	skel_outfit = /datum/outfit/job/npc/skeleton/dead/freitrupp


// OUTFIT DEAD ADVENTURER
/datum/outfit/job/npc/skeleton/dead/adventurer/pre_equip(mob/living/carbon/human/H)


	shirt = pick(
		/obj/item/clothing/shirt/tunic/random,
		/obj/item/clothing/armor/gambeson/heavy,
		/obj/item/clothing/shirt/rags,
		/obj/item/clothing/shirt/shortshirt/random,
		/obj/item/clothing/shirt/undershirt/random,
		/obj/item/clothing/armor/gambeson,
		/obj/item/clothing/armor/gambeson/light,
		/obj/item/clothing/armor/gambeson/heavy,
		)

	pants = pick(
		/obj/item/clothing/pants/trou/leather,
		/obj/item/clothing/pants/chainlegs/iron,
		/obj/item/clothing/pants/chainlegs,
		/obj/item/clothing/pants/tights/random,
		/obj/item/clothing/pants/tights/vagrant,
		/obj/item/clothing/pants/trou/shadowpants,
		/obj/item/clothing/pants/trou/beltpants,
		)

	armor = pick(
		/obj/item/clothing/armor/leather/splint,
		/obj/item/clothing/armor/gambeson/heavy,
		/obj/item/clothing/armor/chainmail,
		/obj/item/clothing/armor/chainmail/iron,
		/obj/item/clothing/armor/plate/iron,
		/obj/item/clothing/armor/chainmail/hauberk,
		/obj/item/clothing/armor/plate,
		/obj/item/clothing/armor/brigandine,
		/obj/item/clothing/armor/leather/hide,
		/obj/item/clothing/armor/leather/vest,
		/obj/item/clothing/armor/plate/iron,
		/obj/item/clothing/armor/gambeson/heavy/dress,
		/obj/item/clothing/armor/gambeson/heavy/dress/alt,
		/obj/item/clothing/armor/leather,
		/obj/item/clothing/armor/leather/studded,
		)

	if(prob(70))
		head = pick(
			/obj/item/clothing/head/helmet/kettle,
			/obj/item/clothing/head/helmet/leather,
			/obj/item/clothing/head/helmet/horned,
			/obj/item/clothing/head/helmet/skullcap,
			/obj/item/clothing/head/helmet/winged,
			/obj/item/clothing/head/antlerhood,
			/obj/item/clothing/head/roguehood,
			/obj/item/clothing/head/fisherhat,
			/obj/item/clothing/head/softcap,
			/obj/item/clothing/head/armingcap,
			/obj/item/clothing/head/helmet/bascinet,
			/obj/item/clothing/head/hatfur,
			/obj/item/clothing/head/papakha,
			/obj/item/clothing/head/helmet/bascinet,
			/obj/item/clothing/head/helmet/kettle,
			/obj/item/clothing/head/helmet/sallet,
			/obj/item/clothing/head/headband,
			/obj/item/clothing/head/headband/red,
			/obj/item/clothing/head/helmet/leather/advanced,
		)
	if(prob(50))
		cloak = pick(
			/obj/item/clothing/cloak/stabard/dungeon,
			/obj/item/clothing/cloak/raincloak,
			/obj/item/clothing/cloak/raincloak/mortus,
			/obj/item/clothing/cloak/raincloak/furcloak,
			/obj/item/clothing/cloak/raincloak/furcloak/brown,
			/obj/item/clothing/cloak/raincloak/furcloak/black,
			/obj/item/clothing/cloak/black_cloak,
			/obj/item/clothing/cloak/heartfelt,
			/obj/item/clothing/cloak/tabard,
			/obj/item/clothing/cloak/stabard,
			/obj/item/clothing/cloak/stabard/surcoat,
		)
	if(prob(60))
		neck = pick(/obj/item/clothing/neck/gorget,
		/obj/item/clothing/neck/chaincoif/iron,
		/obj/item/clothing/neck/coif,
		/obj/item/clothing/neck/psycross,
		/obj/item/clothing/neck/shalal,
		)



	if(prob(70))
		gloves = pick(
			/obj/item/clothing/gloves/leather,
			/obj/item/clothing/gloves/angle/grenzel,
			/obj/item/clothing/gloves/angle,
			/obj/item/clothing/gloves/chain,
			/obj/item/clothing/gloves/chain/iron,
		)
	if(prob(70))
		wrists = pick(
		/obj/item/clothing/wrists/bracers/leather,
		/obj/item/clothing/wrists/bracers,
		)

	shoes = pick(
		/obj/item/clothing/shoes/boots/leather,
		/obj/item/clothing/shoes/boots/armor/light,
		/obj/item/clothing/shoes/boots/armor,
		/obj/item/clothing/shoes/shalal,
		/obj/item/clothing/shoes/grenzelhoft,
		/obj/item/clothing/shoes/boots,
	)
	if(prob(70))
		belt = pick(/obj/item/storage/belt/leather,
		/obj/item/storage/belt/leather/shalal,
		/obj/item/storage/belt/leather/black,
		/obj/item/storage/belt/leather/steel,
		/obj/item/storage/belt/leather/plaquesilver,
		/obj/item/storage/belt/leather/rope,
		/obj/item/storage/belt/leather/cloth,
		/obj/item/storage/belt/leather/cloth/bandit,
		/obj/item/storage/belt/leather/knifebelt,
		)
	if(prob(70))
		belt = pick(/obj/item/storage/belt/leather,
		/obj/item/storage/belt/leather/black,
		/obj/item/storage/belt/leather/knifebelt,
		)
		if((belt)&& prob(60))
			beltr = pick(
			/obj/item/storage/belt/pouch/coins/rich,
			/obj/item/storage/belt/pouch/coins/mid,
			/obj/item/storage/belt/pouch/coins/poor,
			/obj/item/weapon/knife/dagger,
			/obj/item/weapon/knife/dagger/steel,
			/obj/item/flint,
			/obj/item/needle,
			/obj/item/bomb,
			/obj/item/smokebomb,
			/obj/item/clothing/face/cigarette/rollie/nicotine,
			/obj/item/clothing/face/cigarette/rollie/cannabis,
			/obj/item/reagent_containers/glass/bottle/healthpot,
			/obj/item/flashlight/flare/torch,
			)
			beltl =  pick(
			/obj/item/storage/belt/pouch/coins/rich,
			/obj/item/storage/belt/pouch/coins/mid,
			/obj/item/storage/belt/pouch/coins/poor,
			/obj/item/weapon/knife/dagger,
			/obj/item/weapon/knife/dagger/steel,
			/obj/item/flint,
			/obj/item/needle,
			/obj/item/bomb,
			/obj/item/smokebomb,
			/obj/item/clothing/face/cigarette/rollie/nicotine,
			/obj/item/clothing/face/cigarette/rollie/cannabis,
			/obj/item/reagent_containers/glass/bottle/healthpot,
			/obj/item/flashlight/flare/torch,
			)


// OUTFIT DEAD SOLDIER
/datum/outfit/job/npc/skeleton/dead/manatarms/pre_equip(mob/living/carbon/human/H)


	shirt = pick(
		/obj/item/clothing/shirt/tunic/random,
		/obj/item/clothing/shirt/shortshirt/random,
		/obj/item/clothing/shirt/undershirt/random,
		/obj/item/clothing/armor/gambeson,
		/obj/item/clothing/armor/gambeson/light,
		/obj/item/clothing/armor/gambeson/heavy,
		)

	pants = pick(
		/obj/item/clothing/pants/trou/leather,
		/obj/item/clothing/pants/chainlegs/iron,
		/obj/item/clothing/pants/chainlegs,
		/obj/item/clothing/pants/tights/random,
		/obj/item/clothing/pants/chainlegs/skirt,
		/obj/item/clothing/pants/platelegs/skirt,
		)

	armor = pick(
		/obj/item/clothing/armor/leather/splint,
		/obj/item/clothing/armor/gambeson/heavy,
		/obj/item/clothing/armor/chainmail,
		/obj/item/clothing/armor/chainmail/iron,
		/obj/item/clothing/armor/plate/iron,
		/obj/item/clothing/armor/chainmail/hauberk,
		/obj/item/clothing/armor/plate,
		/obj/item/clothing/armor/brigandine,
		/obj/item/clothing/armor/leather/hide,
		/obj/item/clothing/armor/leather/jacket,
		/obj/item/clothing/armor/plate/iron,
		/obj/item/clothing/armor/leather,
		/obj/item/clothing/armor/leather/studded,
		)

	if(prob(70))
		head = pick(
			/obj/item/clothing/head/helmet/leather/advanced,
			/obj/item/clothing/head/helmet/kettle,
			/obj/item/clothing/head/helmet/leather,
			/obj/item/clothing/head/helmet/horned,
			/obj/item/clothing/head/helmet/skullcap,
			/obj/item/clothing/head/helmet/kettle,
			/obj/item/clothing/head/helmet/sallet,
		)
	cloak = pick(
			/obj/item/clothing/cloak/stabard/dungeon,
			/obj/item/clothing/cloak/tabard,
			/obj/item/clothing/cloak/stabard/dungeon,
			/obj/item/clothing/cloak/stabard/guard,
			/obj/item/clothing/cloak/stabard/surcoat,
			/obj/item/clothing/cloak/stabard/surcoat/guard,
			/obj/item/clothing/cloak/stabard/guard,
			/obj/item/clothing/cloak/tabard/crusader,
		)
	if(prob(80))
		neck = pick(
		/obj/item/clothing/neck/gorget,
		/obj/item/clothing/neck/chaincoif/iron,
		/obj/item/clothing/neck/leathercollar,
		/obj/item/clothing/neck/coif,
		/obj/item/clothing/neck/psycross,
		)

	if(prob(70))
		gloves = pick(
			/obj/item/clothing/gloves/leather,
			/obj/item/clothing/gloves/angle,
			/obj/item/clothing/gloves/chain,
			/obj/item/clothing/gloves/chain/iron,
		)
	if(prob(70))
		wrists = pick(
		/obj/item/clothing/wrists/bracers/leather,
		/obj/item/clothing/wrists/bracers,
		)

	shoes = pick(
		/obj/item/clothing/shoes/boots/leather,
		/obj/item/clothing/shoes/boots/armor/light,
		/obj/item/clothing/shoes/boots/armor,
		/obj/item/clothing/shoes/boots,
			)
	if(prob(70))
		belt = pick(/obj/item/storage/belt/leather,
		/obj/item/storage/belt/leather/black,
		/obj/item/storage/belt/leather/knifebelt,
		)
		if((belt)&& prob(60))
			beltr = pick(
			/obj/item/storage/belt/pouch/coins/rich,
			/obj/item/storage/belt/pouch/coins/mid,
			/obj/item/storage/belt/pouch/coins/poor,
			/obj/item/weapon/knife/dagger,
			/obj/item/weapon/knife/dagger/steel,
			/obj/item/flint,
			/obj/item/needle,
			/obj/item/bomb,
			/obj/item/smokebomb,
			/obj/item/clothing/face/cigarette/rollie/nicotine,
			/obj/item/clothing/face/cigarette/rollie/cannabis,
			/obj/item/reagent_containers/glass/bottle/healthpot,
			/obj/item/flashlight/flare/torch,
			)
			beltl =  pick(
			/obj/item/storage/belt/pouch/coins/rich,
			/obj/item/storage/belt/pouch/coins/mid,
			/obj/item/storage/belt/pouch/coins/poor,
			/obj/item/weapon/knife/dagger,
			/obj/item/weapon/knife/dagger/steel,
			/obj/item/flint,
			/obj/item/needle,
			/obj/item/bomb,
			/obj/item/smokebomb,
			/obj/item/clothing/face/cigarette/rollie/nicotine,
			/obj/item/clothing/face/cigarette/rollie/cannabis,
			/obj/item/reagent_containers/glass/bottle/healthpot,
			/obj/item/flashlight/flare/torch,
			)




// OUTFIT KNIGHT

/datum/outfit/job/npc/skeleton/dead/knight/pre_equip(mob/living/carbon/human/H)

	if(prob(80))
		head = pick(/obj/item/clothing/head/helmet/heavy,
					/obj/item/clothing/head/helmet/heavy/bucket,
					/obj/item/clothing/head/helmet/bascinet,
					/obj/item/clothing/head/helmet/heavy/crusader,
					/obj/item/clothing/head/helmet/heavy/frog,
					)
	armor = pick(
				/obj/item/clothing/armor/brigandine,
				/obj/item/clothing/armor/brigandine/coatplates,
				/obj/item/clothing/armor/plate,
				/obj/item/clothing/armor/plate/full,
				)
	if(prob(40))
		pants =	/obj/item/clothing/pants/platelegs
	else
		pants = pick(
				/obj/item/clothing/pants/chainlegs/iron,
				/obj/item/clothing/pants/chainlegs,
				/obj/item/clothing/pants/chainlegs/skirt,
				/obj/item/clothing/pants/platelegs/skirt,
				)
	cloak = pick(
		/obj/item/clothing/cloak/stabard/surcoat/guard,
		/obj/item/clothing/cloak/tabard/crusader,
		/obj/item/clothing/cloak/cape/knight,
		/obj/item/clothing/cloak/tabard/knight/guard,
	)
	if(prob(80))
		gloves = pick(
			/obj/item/clothing/gloves/plate,
			/obj/item/clothing/gloves/chain,
			/obj/item/clothing/gloves/chain/iron,
					)
	shoes = pick(
	/obj/item/clothing/shoes/boots/armor/light,
	/obj/item/clothing/shoes/boots/armor,
	/obj/item/clothing/shoes/boots,
	)
	if(prob(70))
		belt = pick(/obj/item/storage/belt/leather,
		/obj/item/storage/belt/leather/black,
		/obj/item/storage/belt/leather/knifebelt,
		)
		if((belt)&& prob(60))
			beltr = pick(
			/obj/item/storage/belt/pouch/coins/rich,
			/obj/item/storage/belt/pouch/coins/mid,
			/obj/item/storage/belt/pouch/coins/poor,
			/obj/item/weapon/knife/dagger,
			/obj/item/weapon/knife/dagger/steel,
			/obj/item/flint,
			/obj/item/needle,
			/obj/item/bomb,
			/obj/item/smokebomb,
			/obj/item/clothing/face/cigarette/rollie/nicotine,
			/obj/item/clothing/face/cigarette/rollie/cannabis,
			/obj/item/reagent_containers/glass/bottle/healthpot,
			)
			beltl =  pick(
			/obj/item/storage/belt/pouch/coins/rich,
			/obj/item/storage/belt/pouch/coins/mid,
			/obj/item/storage/belt/pouch/coins/poor,
			/obj/item/weapon/knife/dagger,
			/obj/item/weapon/knife/dagger/steel,
			/obj/item/flint,
			/obj/item/needle,
			/obj/item/bomb,
			/obj/item/smokebomb,
			/obj/item/clothing/face/cigarette/rollie/nicotine,
			/obj/item/clothing/face/cigarette/rollie/cannabis,
			/obj/item/reagent_containers/glass/bottle/healthpot,
			)


/datum/outfit/job/npc/skeleton/dead/noble/pre_equip(mob/living/carbon/human/H)

	if(H.gender == MALE)
		if(prob(60))
			head = pick(
				/obj/item/clothing/head/fancyhat,
				/obj/item/clothing/head/chaperon,
				/obj/item/clothing/head/papakha,
				/obj/item/clothing/head/bardhat,
			)

		pants = pick(
			/obj/item/clothing/pants/trou,
			/obj/item/clothing/pants/tights/random,
		)
		shirt = pick(
			/obj/item/clothing/shirt/tunic/random,
			/obj/item/clothing/shirt/undershirt/random,
			/obj/item/clothing/shirt/tunic/noblecoat,
			/obj/item/clothing/shirt/undershirt/artificer,
			/obj/item/clothing/shirt/undershirt/puritan,
		)
	else
		if(prob(60))
			head = pick(
				/obj/item/clothing/head/hennin,
				/obj/item/clothing/head/fancyhat,
				/obj/item/clothing/head/chaperon,
				/obj/item/clothing/head/papakha,
			)

		pants =	/obj/item/clothing/pants/tights/stockings/random
		shirt = pick(
				/obj/item/clothing/shirt/dress/silkydress,
				/obj/item/clothing/shirt/dress/gown,
				/obj/item/clothing/shirt/dress/gown/summergown,
				/obj/item/clothing/shirt/dress/gown/fallgown,
				/obj/item/clothing/shirt/dress/gown/wintergown,
				/obj/item/clothing/shirt/dress/gen/random,
				/obj/item/clothing/shirt/dress/silkdress/random,
				/obj/item/clothing/shirt/dress/silkdress,
				)


	shoes = pick(
		/obj/item/clothing/shoes/boots/leather,
		/obj/item/clothing/shoes/shalal,
		/obj/item/clothing/shoes/boots,
		/obj/item/clothing/shoes/nobleboot,
		/obj/item/clothing/shoes/ridingboots,
	)

	if(prob(70))
		cloak = pick(
		/obj/item/clothing/cloak/half/random,
		/obj/item/clothing/cloak/heartfelt,
		/obj/item/clothing/cloak/stole/red,
		/obj/item/clothing/cloak/black_cloak,
		/obj/item/clothing/cloak/stole/purple,
		/obj/item/clothing/cloak/cape/rogue,
		)
	if(prob(70))
		belt = pick(
		/obj/item/storage/belt/leather,
		/obj/item/storage/belt/leather/shalal,
		/obj/item/storage/belt/leather/black,
		/obj/item/storage/belt/leather/plaquesilver,
		/obj/item/storage/belt/leather/cloth,
		)
		if((belt)&& prob(60))
			beltr = pick(
			/obj/item/storage/belt/pouch/coins/rich,
			/obj/item/clothing/face/cigarette/rollie/nicotine,
			/obj/item/clothing/face/cigarette/rollie/cannabis,
			/obj/item/reagent_containers/glass/bottle/healthpot,
			)
			beltl =  pick(
			/obj/item/storage/belt/pouch/coins/rich,
			/obj/item/clothing/face/cigarette/rollie/nicotine,
			/obj/item/clothing/face/cigarette/rollie/cannabis,
			/obj/item/reagent_containers/glass/bottle/healthpot,
			)



// OUTFIT DEAD PEASANT
/datum/outfit/job/npc/skeleton/dead/peasant/pre_equip(mob/living/carbon/human/H)

	if(H.gender == MALE)
		head = pick(
			/obj/item/clothing/head/roguehood,
			/obj/item/clothing/head/fisherhat,
			/obj/item/clothing/head/armingcap,
			/obj/item/clothing/head/hatfur,
			/obj/item/clothing/head/papakha,
			/obj/item/clothing/head/headband,
			)
		pants = pick(
			/obj/item/clothing/pants/trou/leather,
			/obj/item/clothing/pants/tights/random,
			/obj/item/clothing/pants/tights/vagrant,
			)
	else
		head = pick(
			/obj/item/clothing/head/armingcap,
			/obj/item/clothing/head/shawl,
			/obj/item/clothing/head/hatfur,
			)

		armor = /obj/item/clothing/shirt/dress/gen/random

	shirt = pick(
		/obj/item/clothing/shirt/rags,
		/obj/item/clothing/shirt/shortshirt/random,
		/obj/item/clothing/shirt/undershirt/random,
		)

	if(prob(70))
		neck = /obj/item/clothing/neck/psycross

	shoes = pick(
		/obj/item/clothing/shoes/shalal,
		/obj/item/clothing/shoes/boots,
		/obj/item/clothing/shoes/shortboots,
		/obj/item/clothing/shoes/simpleshoes,
			)
	if(prob(70))
		belt =	/obj/item/storage/belt/leather/rope
		if((belt)&& prob(60))
			beltr = pick(
			/obj/item/storage/belt/pouch/coins/poor,
			/obj/item/weapon/knife/dagger,
			/obj/item/flint,
			/obj/item/needle,
			)
			beltl =  pick(
			/obj/item/storage/belt/pouch/coins/poor,
			/obj/item/weapon/knife/dagger,
			/obj/item/flint,
			/obj/item/needle,
			)



// OUTFIT DEAD FREITRUPP
/datum/outfit/job/npc/skeleton/dead/freitrupp/pre_equip(mob/living/carbon/human/H)

	wrists = /obj/item/clothing/wrists/bracers
	neck = /obj/item/clothing/neck/gorget
	shirt = /obj/item/clothing/armor/gambeson/heavy
	head = /obj/item/clothing/head/helmet/skullcap/grenzelhoft
	armor = /obj/item/clothing/armor/plate/blkknight
	pants = /obj/item/clothing/pants/grenzelpants
	shoes = /obj/item/clothing/shoes/grenzelhoft
	gloves = /obj/item/clothing/gloves/angle/grenzel
	backr = /obj/item/storage/backpack/satchel/black
	belt = /obj/item/storage/belt/leather
	if(belt && prob(60))
		beltr = pick(
			/obj/item/storage/belt/pouch/coins/rich,
			/obj/item/storage/belt/pouch/coins/mid,
			/obj/item/storage/belt/pouch/coins/poor,
			/obj/item/weapon/knife/dagger,
			/obj/item/weapon/knife/dagger/steel,
			/obj/item/flint,
			/obj/item/needle,
			/obj/item/bomb,
			/obj/item/smokebomb,
			/obj/item/clothing/face/cigarette/rollie/nicotine,
			/obj/item/clothing/face/cigarette/rollie/cannabis,
			/obj/item/reagent_containers/glass/bottle/healthpot,
			/obj/item/flashlight/flare/torch,)
		beltl =  pick(
			/obj/item/storage/belt/pouch/coins/rich,
			/obj/item/storage/belt/pouch/coins/mid,
			/obj/item/storage/belt/pouch/coins/poor,
			/obj/item/weapon/knife/dagger,
			/obj/item/weapon/knife/dagger/steel,
			/obj/item/flint,
			/obj/item/needle,
			/obj/item/bomb,
			/obj/item/smokebomb,
			/obj/item/clothing/face/cigarette/rollie/nicotine,
			/obj/item/clothing/face/cigarette/rollie/cannabis,
			/obj/item/reagent_containers/glass/bottle/healthpot,
			/obj/item/flashlight/flare/torch,)


	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC);
