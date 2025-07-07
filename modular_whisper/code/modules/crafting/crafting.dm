/datum/crafting_recipe/roguetown/survival/collar
	name = "collar"
	category = "Clothes"
	result = /obj/item/clothing/neck/roguetown/leathercollar
	reqs = list(/obj/item/natural/hide/cured = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/survival/bell_collar
	name = "bell collar"
	category = "Clothes"
	result = /obj/item/clothing/neck/roguetown/catbellcollar
	reqs = list(
		/obj/item/natural/hide/cured = 1,
		/obj/item/jingle_bells = 1,
		)
	craftdiff = 0

/datum/crafting_recipe/roguetown/chainleash
	name = "chain leash"
	category = "Tools"
	result = /obj/item/leash/chain
	reqs = list(
		/obj/item/ingot/iron = 1,	)
	tools = list(/obj/item/rogueweapon/hammer)
	skillcraft = /datum/skill/craft/blacksmithing
	craftdiff = 2

/datum/crafting_recipe/roguetown/sewing/leash
	name = "rope leash"
	result = /obj/item/leash
	reqs = list(/obj/item/rope = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/hunting/lleash
	name = "leather leash"
	result = /obj/item/leash/leather
	reqs = list(/obj/item/natural/hide/cured = 1)
	craftdiff = 0
