
/obj/item/clothing/neck/psycross
	name = "old god cross"
	desc = "One of the old world religions' cross."
	icon_state = "psycross_wood"
	//dropshrink = 0.75
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HIP|ITEM_SLOT_WRISTS
	sellprice = 10
	experimental_onhip = TRUE

// SILVER PSYCROSS START

/obj/item/clothing/neck/psycross/silver
	name = "silver old god cross"
	desc = "One of the old world religions' cross. Let the wicked undead burn at my touch."
	icon_state = "psycross_silver"
	resistance_flags = FIRE_PROOF
	sellprice = 50
	smeltresult = /obj/item/ingot/silver

/obj/item/clothing/neck/psycross/silver/Initialize(mapload)
	. = ..()
	enchant(/datum/enchantment/silver)

// PANTHEON SILVER PSYCROSSES START

/obj/item/clothing/neck/psycross/silver/astrata
	name = "amulet of Solaria"
	desc = "Blessed be everything the light of the sun touches, for it is protected by Her grace."
	icon_state = "astrata"
	resistance_flags = FIRE_PROOF

// Not silver because in old lore, Noc liked vamps. He does not here! TODO: Needs to change!
/obj/item/clothing/neck/psycross/noc
	name = "amulet of Lunaria"
	desc = "Moonlight continues to bathe all even when sun has to go."
	icon_state = "noc"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/neck/psycross/silver/dendor
	name = "amulet of Blissrose"
	desc = "Nature is a body of which we are but its entrails."
	icon_state = "dendor"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/neck/psycross/silver/abyssor
	name = "amulet of Abyssor"
	desc = "Oceanshaper and guardian of the seas, make them remember his name."
	icon_state = "abyssor"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/neck/psycross/silver/necra
	name = "amulet of Last Death"
	desc = "We are but souls in a husk of flesh, all we achieve is ours forever."
	icon_state = "necra"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/neck/psycross/silver/ravox
	name = "amulet of The Wanderer"
	desc = "Lead the lost to their righteous way.."
	icon_state = "ravox"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/neck/psycross/silver/xylix
	name = "amulet of Xylix"
	desc = "Be not fooled, and be not afraid to."
	icon_state = "xylix"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/neck/psycross/silver/eora
	name = "amulet of Moonbeam"
	desc = "Where can you go when it's all in your mind? Enjoy life for it is chaos that takes without warning."
	icon = 'modular_whisper/icons/clothing/neck.dmi'
	mob_overlay_icon = 'modular_whisper/icons/clothing/onmob/neck.dmi'
	icon_state = "moonbeam"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/neck/psycross/silver/holy/eora
	name = "Moonbeam's love potion"
	desc = "Moonbeam's blessing is upon thy, use me on someone else and you shall be soulbond, but will fall asleep through it for a while."
	icon_state = "eora"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/neck/psycross/silver/holy/eora/attack(mob/living/love_target, mob/user)
	if(!isliving(love_target) || love_target.stat == DEAD)
		to_chat(user, span_warning("The love potion only works on living things, sicko!"))
		return ..()
	if(user == love_target)
		to_chat(user, span_warning("You can't drink the love potion. What are you, a narcissist?"))
		return ..()
	if(love_target.has_status_effect(/datum/status_effect/in_love))
		to_chat(user, span_warning("[love_target] is already lovestruck!"))
		return ..()

	love_target.visible_message(span_danger("[user] starts to feed [love_target] a love potion!"),
		span_userdanger("[user] starts to feed you a love potion!"))

	if(!do_after(user, 5 SECONDS, love_target))
		return
	to_chat(user, span_notice("You feed [love_target] the love potion!"))
	to_chat(love_target, span_notice("You develop feelings for [user], and anyone [user.p_they()] like[user.p_s()]."))
	love_target.faction |= "[REF(user)]"
	love_target.apply_status_effect(/datum/status_effect/in_love, user)
	love_target.Sleeping(20 SECONDS)
	qdel(src)

/obj/item/clothing/neck/psycross/silver/pestra
	name = "amulet of Pestra"
	desc = "When pure, alcohol is best used as a cleanser of wounds and a cleanser of the palate."
	icon_state = "pestra"
	resistance_flags = FIRE_PROOF


/obj/item/clothing/neck/psycross/silver/malum
	name = "amulet of Malum"
	desc = "Blessed be our works, made in His name."
	icon_state = "malum"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/neck/psycross/silver/malum_steel
	name = "amulet of Malum"
	desc = "Let the tools that guide thee be thy hands."
	icon_state = "malum_alt"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/neck/psycross/g
	name = "golden psycross"
	desc = "Let His name be naught but forgot'n."
	icon_state = "psycross_gold"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 100
	smeltresult = /obj/item/ingot/gold
