/obj/item/clothing/neck/leathercollar
	name = "leather collar"
	desc = "A band of leather which signifies bondage to another."
	icon = 'modular/icons/obj/items/leashes_collars.dmi'
	icon_state = "leathercollar"
	item_state = "leathercollar"
	resistance_flags = FIRE_PROOF
	dropshrink = 0.5
	leashable = TRUE

/obj/item/clothing/neck/catbellcollar
	name = "catbell collar"
	desc = "A leather collar with a small jingly catbell."
	icon = 'modular/icons/obj/items/leashes_collars.dmi'
	icon_state = "catbellcollar"
	item_state = "catbellcollar"
	resistance_flags = FIRE_PROOF
	dropshrink = 0.5
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_MASK
	body_parts_covered = NECK|FACE
	leashable = TRUE

/obj/item/clothing/neck/cowbellcollar
	name = "cowbell collar"
	desc = "A leather collar with a small jingly cowbell."
	icon = 'modular/icons/obj/items/leashes_collars.dmi'
	icon_state = "cowbellcollar"
	item_state = "cowbellcollar"
	resistance_flags = FIRE_PROOF
	dropshrink = 0.5
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_MASK
	body_parts_covered = NECK|FACE
	leashable = TRUE

/obj/item/clothing/neck/feldcollar
	name = "feldsher's collar"
	desc = "A simple cloth collar, typically worn by medical staff."
	icon_state = "feldcollar"

/obj/item/clothing/neck/surcollar
	name = "surgeon's collar"
	desc = "A utilitarian collar for surgeons, not meant for leashing."
	icon_state = "surcollar"

// Activate the devotion prayer verb from MMB
/obj/item/clothing/neck/psycross/MiddleClick(mob/user)
	if (.)
		return

	user.changeNext_move(CLICK_CD_MELEE)
	var/prayer = locate(/mob/living/carbon/human/proc/clericpray) in user.verbs
	if (prayer)
		call(user, prayer)()
