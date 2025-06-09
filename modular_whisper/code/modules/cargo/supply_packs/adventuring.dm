// Adventuring Supplies. General category for random stuffs useful for adventurers
// Like container, bedrolls etc.

/datum/supply_pack/adventure_supplies
	group = "Adventuring"
	crate_name = "merchant guild's crate"
	crate_type = /obj/structure/closet/crate/chest/merchant

/datum/supply_pack/adventure_supplies/bedroll
	name = "Bedroll"
	cost = 13
	contains = list(/obj/item/sleepingbag)

/datum/supply_pack/adventure_supplies/waterskin
	name = "Waterskin"
	cost = 13
	contains = list(/obj/item/reagent_containers/glass/bottle/waterskin)

/datum/supply_pack/adventure_supplies/satchel
	name = "Satchel"
	cost = 13
	contains = list(/obj/item/storage/backpack/satchel)

/datum/supply_pack/adventure_supplies/backpack
	name = "Backpack"
	cost = 18
	contains = list(/obj/item/storage/backpack/backpack)

/datum/supply_pack/adventure_supplies/pouches
	name = "Pouch"
	cost = 8
	contains = list(
					/obj/item/storage/belt/pouch,
					/obj/item/storage/belt/pouch,
					/obj/item/storage/belt/pouch)

/datum/supply_pack/adventure_supplies/belts
	name = "Belt"
	cost = 14
	contains = list(
					/obj/item/storage/belt/leather,
					/obj/item/storage/belt/leather,
					/obj/item/storage/belt/leather,
				)

/datum/supply_pack/adventure_supplies/ropes
	name = "Ropes"
	cost = 10
	contains = list(
					/obj/item/rope,
					/obj/item/rope,
					/obj/item/rope,
				)

/datum/supply_pack/adventure_supplies/woodstaff
	name = "Walking stick"
	cost = 6
	contains = list(/obj/item/weapon/polearm/woodstaff)

/datum/supply_pack/adventure_supplies/lamptern
	name = "Lamptern"
	cost = 15
	contains = list(/obj/item/flashlight/flare/torch/lantern)

/datum/supply_pack/adventure_supplies/needles
	name = "Needles"
	cost = 15
	contains = list(/obj/item/needle,
					/obj/item/needle,
					/obj/item/needle)

/datum/supply_pack/adventure_supplies/lamptern
	name = "Torches"
	cost = 15
	contains = list(/obj/item/flashlight/flare/torch/metal,
					/obj/item/flashlight/flare/torch/metal,
					/obj/item/flashlight/flare/torch/metal)

/datum/supply_pack/adventure_supplies/needles
	name = "Blood packs"
	cost = 40
	contains = list(/obj/item/reagent_containers/blood/OMinus,
					/obj/item/reagent_containers/blood/OMinus,
					/obj/item/reagent_containers/blood/OMinus)


/datum/supply_pack/adventure_supplies/rationpaper
	name = "Ration Papers"
	cost = 20
	contains = list(
					/obj/item/ration,
					/obj/item/ration,
				)
