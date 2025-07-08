// Thievery Related Supplies. I sure hope this don't go wrong!!!
// Took lockpicks out so it don't get spammed. Get the expensive hairpins instead.

/datum/supply_pack/bath_rogue
	group = "Roguery"
	crate_name = "merchant guild's crate"
	crate_type = /obj/structure/closet/crate/chest/merchant

// Same as merchant
/datum/supply_pack/bath_chains
	name = "Chains"
	cost = 15
	contains = list(
		/obj/item/rope/chain,
		/obj/item/rope/chain,
		/obj/item/rope/chain,
	)

/datum/supply_pack/bath_goldpin
	name = "Golden Hairpin"
	cost = 100
	contains = list(/obj/item/lockpick/goldpin)

/datum/supply_pack/bath_silverpin
	name = "Silver Hairpin"
	cost = 50
	contains = list(/obj/item/lockpick/goldpin/silver)

/datum/supply_pack/bath_smokebomb
	name = "Smoke Bombs"
	cost = 25
	contains = list(
		/obj/item/smokebomb,
		/obj/item/smokebomb,
		/obj/item/smokebomb)

/datum/supply_pack/bath_waterarrows
	name = "Water Arrow Quiver"
	cost = 20
	contains = list (
		/obj/item/ammo_holder/quiver/arrows/water
	)

/datum/supply_pack/bath_grappler
	name = "Grappler"
	cost = 150
	contains = list(/obj/item/grapplinghook)

