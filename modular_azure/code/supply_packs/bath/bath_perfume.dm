#define CHEAP_PERFUME_PRICE 15
#define EXPENSIVE_PERFUME_PRICE 30

// Ofc Bathhouse sells perfumes
// Other server has it as random. I prefer it to not be random so people can get what they want.

/datum/supply_pack/bath_perfume
	group = "Perfumes"
	crate_name = "perfumery' crate"
	crate_type = /obj/structure/closet/crate/chest/merchant

/datum/supply_pack/bath_perfume/lavender
	name = "Lavender Perfume"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/lavender)

/datum/supply_pack/bath_perfume/cherry
	name = "Cherry Perfume"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/cherry)

/datum/supply_pack/bath_perfume/rose
	name = "Rose Perfume"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/rose)

/datum/supply_pack/bath_perfume/jasmine
	name = "Jasmine Perfume"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/jasmine)

/datum/supply_pack/bath_perfume/mint
	name = "Mint Perfume"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/mint)

/datum/supply_pack/bath_perfume/vanilla
	name = "Vanilla Perfume"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/vanilla)

/datum/supply_pack/bath_perfume/pear
	name = "Pear Perfume"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/pear)

/datum/supply_pack/bath_perfume/strawberry
	name = "Strawberry Perfume"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/strawberry)

/datum/supply_pack/bath_perfume/cinnamon
	name = "Cinnamon Perfume"
	cost = CHEAP_PERFUME_PRICE
	contains = list(/obj/item/perfume/cinnamon)

// "Premium" perfumes they are more expensive by default
// No special mechanical effects
/datum/supply_pack/bath_perfume/frankincense
	name = "Frankincense Perfume"
	cost = EXPENSIVE_PERFUME_PRICE
	contains = list(/obj/item/perfume/frankincense)

/datum/supply_pack/bath_perfume/sandalwood
	name = "Sandalwood Perfume"
	cost = EXPENSIVE_PERFUME_PRICE
	contains = list(/obj/item/perfume/sandalwood)

/datum/supply_pack/bath_perfume/myrrh
	name = "Myrrh Perfume"
	cost = EXPENSIVE_PERFUME_PRICE
	contains = list(/obj/item/perfume/myrrh)


//PORTS
/datum/pollutant/fragrance/cinnamon
	name = "cinnamon"
	scent = "cinnamon"
	color = "#d2691e"

/datum/pollutant/fragrance/frankincense
	name = "frankincense"
	scent = "frankincense"
	color = "#dea670"

/datum/pollutant/fragrance/sandalwood
	name = "sandalwood"
	scent = "sandalwood"
	color = "#e9e1c2"

/datum/pollutant/fragrance/myrrh
	name = "myrrh"
	scent = "myrrh"
	color = "#9e8574"

/obj/item/perfume/cinnamon
	name = "cinnamon perfume"
	fragrance_type = /datum/pollutant/fragrance/cinnamon

// "Premium" perfumes they are more expensive by default
// No special mechanical effects
/obj/item/perfume/frankincense
	name = "frankincense perfume"
	fragrance_type = /datum/pollutant/fragrance/frankincense

/obj/item/perfume/sandalwood
	name = "sandalwood perfume"
	fragrance_type = /datum/pollutant/fragrance/sandalwood

/obj/item/perfume/myrrh
	name = "myrrh perfume"
	fragrance_type = /datum/pollutant/fragrance/myrrh
