/datum/repeatable_crafting_recipe/leather/collar
	name = "collar"
	output = /obj/item/clothing/neck/leathercollar
	requirements = list(/obj/item/natural/hide/cured = 1)
	craftdiff = 0

/datum/repeatable_crafting_recipe/leather/bell_collar
	name = "bell collar"
	output = /obj/item/clothing/neck/catbellcollar
	requirements = list(
		/obj/item/natural/hide/cured = 1,
		/obj/item/ingot/iron = 1,
		)
	craftdiff = 0

/datum/repeatable_crafting_recipe/leather/cowbell_collar
	name = "cow bell collar"
	output = /obj/item/clothing/neck/cowbellcollar
	requirements =  list(
		/obj/item/natural/hide/cured = 1,
		/obj/item/ingot/iron = 1,
		)
	craftdiff = 0

/datum/anvil_recipe/cleash
	name = "chain leash"
	category = "Misc"
	created_item = /obj/item/leash/chain
	req_bar = /obj/item/ingot/iron
	craftdiff = 1

/datum/repeatable_crafting_recipe/sewing/leash
	name = "rope leash"
	output = /obj/item/leash
	requirements = list(/obj/item/rope = 1)
	craftdiff = 0

/datum/repeatable_crafting_recipe/leather/lleash
	name = "leather leash"
	output = /obj/item/leash/leather
	requirements = list(/obj/item/natural/hide/cured = 1)
	craftdiff = 0

/datum/anvil_recipe/tools/isyringe
	name = "iron syringe (x3)"
	i_type = "Utilities"
	created_item = /obj/item/reagent_containers/syringe/iron
	req_bar = /obj/item/ingot/iron
	createmultiple = TRUE
	createditem_num = 2
	craftdiff = 1

/datum/anvil_recipe/tools/ssyringe
	name = "steel syringe (x3)"
	i_type = "Utilities"
	created_item = /obj/item/reagent_containers/syringe/steel
	req_bar = /obj/item/ingot/steel
	createmultiple = TRUE
	createditem_num = 2
	craftdiff = 1
