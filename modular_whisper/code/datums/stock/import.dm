/datum/stock/import/antipregger
	name = "Crate of Anti Pregnancy Potions"
	desc = "Pink that fixes mistakes."
	item_type = /obj/structure/closet/crate/chest/steward/antipregpotion
	export_price = 50
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/antipregpotion/Initialize()
	. = ..()
	for(var/i in 1 to 4)
		new /obj/item/reagent_containers/glass/bottle/antipregnancy(src)

/datum/stock/import/healthpot
	name = "Crate of Health Potions"
	desc = "Red that keeps man alive."
	item_type = /obj/structure/closet/crate/chest/steward/healthpot
	export_price = 100
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/healthpot/Initialize()
	. = ..()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/glass/bottle/healthpot(src)

/datum/stock/import/minorhealthpot
	name = "Crate of Lesser Health Potions"
	desc = "Deluted red that keeps man sometimes alive, on a budget."
	item_type = /obj/structure/closet/crate/chest/steward/minorhealthpot
	export_price = 50
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/minorhealthpot/Initialize()
	. = ..()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/glass/bottle/minorhealthpot(src)

/datum/stock/import/antidote
	name = "Crate of Universal Antidotes"
	desc = "Generally taken from old world sources or sold by skilled alchemists."
	item_type = /obj/structure/closet/crate/chest/steward/antidote
	export_price = 100
	importexport_amt = 1

/obj/structure/closet/crate/chest/steward/antidote/Initialize()
	. = ..()
	for(var/i in 1 to 5)
		new /obj/item/reagent_containers/glass/bottle/antidote(src)

/datum/stock/import/balms
	name = "Bin of Balm"
	desc = "Used in body preservation, usually by morticians."
	item_type = /obj/item/bin/balms
	export_price = 100
	importexport_amt = 1

/obj/item/bin/balms/Initialize()
	. = ..()
	for(var/i in 1 to 10)
		new /obj/item/balm(src)
