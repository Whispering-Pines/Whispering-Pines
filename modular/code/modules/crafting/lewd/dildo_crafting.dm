/datum/repeatable_crafting_recipe/survival/wood_dildo
	name = "wooden dildo"
	requirements = list(
		/obj/item/grown/log/tree/small = 1,
	)
	tool_usage = list(
		/obj/item/weapon/knife = list("starts to carve", "start to carve")
	)
	starting_atom = /obj/item/weapon/knife
	attacked_atom = /obj/item/grown/log/tree/small
	output = /obj/item/dildo/wood
	craftdiff = 1

/datum/repeatable_crafting_recipe/survival/stone_dildo
	requirements = list(
		/obj/item/natural/stone = 1,
	)
	tool_usage = list(
		/obj/item/natural/stone = list("starts to chip", "start to chip")
	)
	starting_atom = /obj/item/natural/stone
	attacked_atom = /obj/item/natural/stone
	output = /obj/item/dildo/stone
	craftdiff = 1

/datum/anvil_recipe/iron_dildo
	name = "Iron dildo 3x"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/dildo/iron, /obj/item/dildo/iron, /obj/item/dildo/iron)
	i_type = "Utilities"

/datum/anvil_recipe/copper_dildo
	name = "Copper dildo 3x"
	req_bar = /obj/item/ingot/copper
	created_item = list(/obj/item/dildo/copper, /obj/item/dildo/copper, /obj/item/dildo/copper)
	i_type = "Utilities"

/datum/anvil_recipe/steel_dildo
	name = "Steel dildo 3x"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/dildo/steel, /obj/item/dildo/steel, /obj/item/dildo/steel)
	i_type = "Utilities"

/datum/anvil_recipe/silver_dildo
	name = "Silver dildo 3x"
	req_bar = /obj/item/ingot/silver
	created_item = list(/obj/item/dildo/silver, /obj/item/dildo/silver, /obj/item/dildo/silver)
	i_type = "Utilities"

/datum/anvil_recipe/gold_dildo
	name = "Golden dildo 3x"
	req_bar = /obj/item/ingot/gold
	created_item = list(/obj/item/dildo/gold, /obj/item/dildo/gold, /obj/item/dildo/gold)
	i_type = "Utilities"

/datum/anvil_recipe/glass_dildo
	name = "Glass dildo 3x"
	req_bar = /obj/item/natural/glass
	created_item = list(/obj/item/dildo/glass, /obj/item/dildo/glass, /obj/item/dildo/glass)
	i_type = "Utilities"

//plugs

/datum/repeatable_crafting_recipe/survival/wood_plug
	name = "wooden plug"
	output = /obj/item/dildo/plug/wood
	requirements = list(/obj/item/grown/log/tree/small = 1)

/datum/repeatable_crafting_recipe/survival/stone_plug
	name = "stone plug"
	output = /obj/item/dildo/plug/stone
	requirements = list(/obj/item/natural/stone = 1)

/datum/anvil_recipe/iron_plug
	name = "Iron plug 3x"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/dildo/plug/iron, /obj/item/dildo/plug/iron, /obj/item/dildo/plug/iron)
	i_type = "Utilities"

/datum/anvil_recipe/copper_plug
	name = "Copper plug 3x"
	req_bar = /obj/item/ingot/copper
	created_item = list(/obj/item/dildo/plug/copper, /obj/item/dildo/plug/copper, /obj/item/dildo/plug/copper)
	i_type = "Utilities"

/datum/anvil_recipe/steel_plug
	name = "Steel plug 3x"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/dildo/plug/steel, /obj/item/dildo/plug/steel, /obj/item/dildo/plug/steel)
	i_type = "Utilities"

/datum/anvil_recipe/silver_plug
	name = "Silver plug 3x"
	req_bar = /obj/item/ingot/silver
	created_item = list(/obj/item/dildo/plug/silver, /obj/item/dildo/plug/silver, /obj/item/dildo/plug/silver)
	i_type = "Utilities"

/datum/anvil_recipe/gold_plug
	name = "Golden plug 3x"
	req_bar = /obj/item/ingot/gold
	created_item = list(/obj/item/dildo/plug/gold, /obj/item/dildo/plug/gold, /obj/item/dildo/plug/gold)
	i_type = "Utilities"

/* This place has no glass ingot
/datum/anvil_recipe/glass_plug
	name = "Glass plug 3x"
	req_bar = /obj/item/ingot/glass
	created_item = list(/obj/item/dildo/plug/glass, /obj/item/dildo/plug/glass, /obj/item/dildo/plug/glass)
	i_type = "Utilities"
*/
