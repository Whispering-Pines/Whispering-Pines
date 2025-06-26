/obj/item/gun/ballistic/revolver/grenadelauncher/pistol/arquebus
	name = "arquebus rifle"
	desc = "A gunpowder weapon that shoots an armor piercing metal ball."
	icon = 'modular_helmsguard/icons/weapons/arquebus.dmi'
	icon_state = "arquebus"
	item_state = "arquebus"
	force = 10
	force_wielded = 15
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_LONG
	recoil = 5
	randomspread = 1
	spread = 0
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	can_parry = TRUE
	parrysound = list('sound/combat/parry/wood/parrywood (1).ogg', 'sound/combat/parry/wood/parrywood (2).ogg', 'sound/combat/parry/wood/parrywood (3).ogg')
	minstr = 6
	experimental_onback = TRUE
	cartridge_wording = "ball"
	load_sound = 'modular_helmsguard/sound/arquebus/musketload.ogg'
	fire_sound = "modular_helmsguard/sound/arquebus/arquefire.ogg"
	equip_sound = 'sound/foley/gun_equip.ogg'
	pickup_sound = 'sound/foley/gun_equip.ogg'
	drop_sound = 'sound/foley/gun_drop.ogg'
	dropshrink = 0.7
	associated_skill = /datum/skill/combat/firearms
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	gripped_intents = list(/datum/intent/shoot/musket, /datum/intent/shoot/musket/arc, /datum/intent/mace/strike/wood)
	mag_type = /obj/item/ammo_box/magazine/internal/shot/musk
	gripped_intents = null
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	sellprice = 200 // This kind of equipment is very hard to come by in Rockhill.
	grid_height = 32
	grid_width = 192

/obj/item/gun/ballistic/revolver/grenadelauncher/pistol/arquebus/shoot_live_shot(mob/living/user, pointblank, mob/pbtarget, message)
	fire_sound = pick("modular_helmsguard/sound/arquebus/arquefire.ogg", "modular_helmsguard/sound/arquebus/arquefire2.ogg", "modular_helmsguard/sound/arquebus/arquefire3.ogg",
				"modular_helmsguard/sound/arquebus/arquefire4.ogg", "modular_helmsguard/sound/arquebus/arquefire5.ogg")
	. = ..()
