/datum/anvil_recipe/valuables
	appro_skill = /datum/skill/craft/blacksmithing
	category = "Valuables"
	abstract_type = /datum/anvil_recipe/valuables
	category = "Valuables"

// --------- IRON -----------

/datum/anvil_recipe/valuables/gold_mask
	name = "Golden Half Mask"
	recipe_name = "a golden half mask"
	req_bar = /obj/item/ingot/gold
	created_item = /obj/item/clothing/face/lordmask
	craftdiff = 2

/datum/anvil_recipe/valuables/gold_mask_left
	name = "Golden Half Mask (Left)"
	recipe_name = "a golden half mask"
	req_bar = /obj/item/ingot/gold
	created_item = /obj/item/clothing/face/lordmask/l
	craftdiff = 2

/datum/anvil_recipe/valuables/iron
	req_bar = /obj/item/ingot/iron
	abstract_type = /datum/anvil_recipe/valuables/iron
	craftdiff = 1
///////////////////////////////////////////////

/datum/anvil_recipe/valuables/iron/statue
	name = "Iron Statue"
	recipe_name = "a Statue"
	created_item = /obj/item/statue/iron

// --------- STEEL -----------


/datum/anvil_recipe/valuables/rontzs
	name = "Silver Face Mask"
	recipe_name = "a silver face mask"
	req_bar = /obj/item/ingot/silver
	created_item = /obj/item/clothing/face/facemask/silver
	craftdiff = 2

/datum/anvil_recipe/valuables/steel
	abstract_type = /datum/anvil_recipe/valuables/steel
	req_bar = /obj/item/ingot/steel
	craftdiff = 2
///////////////////////////////////////////////

/datum/anvil_recipe/valuables/steel/statue
	name = "Steel Statue"
	recipe_name = "a Statue"
	created_item = /obj/item/statue/steel

// --------- SILVER -----------

/datum/anvil_recipe/valuables/silver
	abstract_type = /datum/anvil_recipe/valuables/silver
	req_bar = /obj/item/ingot/silver
	craftdiff = 3
///////////////////////////////////////////////

/datum/anvil_recipe/valuables/silver/statue
	name = "Silver Statue"
	recipe_name = "a Statue"
	created_item = /obj/item/statue/silver

/datum/anvil_recipe/valuables/silver/rings
	name = "3x Silver Rings"
	recipe_name = "three Rings"
	created_item = /obj/item/clothing/ring/silver
	createditem_extra = 2

/datum/anvil_recipe/valuables/silver/dorpels
	name = "Silver Diamond Ring"
	recipe_name = "a Silver Diamond Ring"
	additional_items = list(/obj/item/gem/diamond)
	created_item = /obj/item/clothing/ring/silver/dorpel
	craftdiff = 4

/datum/anvil_recipe/valuables/silver/blortzs
	name = "Silver Quartz Ring"
	recipe_name = "a Silver Quartz Ring"
	additional_items = list(/obj/item/gem/blue)
	created_item = /obj/item/clothing/ring/silver/blortz
	craftdiff = 4

/datum/anvil_recipe/valuables/silver/saffiras
	name = "Silver Sapphire Ring"
	recipe_name = "a Silver Sapphire Ring"
	additional_items = list(/obj/item/gem/violet)
	created_item = /obj/item/clothing/ring/silver/saffira
	craftdiff = 4

/datum/anvil_recipe/valuables/silver/gemeralds
	name = "Silver Emerald Ring"
	recipe_name = "a Silver Emerald Ring"
	additional_items = list(/obj/item/gem/green)
	created_item = /obj/item/clothing/ring/silver/gemerald
	craftdiff = 4

/datum/anvil_recipe/valuables/silver/topers
	name = "Silver Topaz Ring"
	recipe_name = "a Silver Topaz Ring"
	additional_items = list(/obj/item/gem/yellow)
	created_item = /obj/item/clothing/ring/silver/toper
	craftdiff = 4

/datum/anvil_recipe/valuables/silver/rontzs
	name = "Silver Ruby Ring"
	recipe_name = "a Silver Ruby Ring"
	additional_items = list(/obj/item/gem/red)
	created_item = /obj/item/clothing/ring/silver/rontz
	craftdiff = 4

// --------- GOLD -----------

/datum/anvil_recipe/valuables/gold
	req_bar = /obj/item/ingot/gold
	abstract_type = /datum/anvil_recipe/valuables/gold
	craftdiff = 4
//////////////////////////////////////////////

/datum/anvil_recipe/valuables/gold/statue
	name = "Golden Statue"
	recipe_name = "a Statue"
	created_item = /obj/item/statue/gold

/datum/anvil_recipe/valuables/gold/circulet
	name = "Golden Circlet"
	recipe_name = "a golden circlet"
	created_item = /obj/item/clothing/head/crown/circlet

/datum/anvil_recipe/valuables/gold/rings
	name = "3x Gold Rings"
	recipe_name = "three Rings" // For the Elven kings under the sky...
	created_item = /obj/item/clothing/ring/gold
	createditem_extra = 2

/datum/anvil_recipe/valuables/gold/dorpel
	name = "Golden Diamond Ring"
	recipe_name = "a Golden Diamond Ring"
	additional_items = list(/obj/item/gem/diamond)
	created_item = /obj/item/clothing/ring/gold/dorpel
	craftdiff = 5

/datum/anvil_recipe/valuables/gold/blortz
	name = "Golden Quartz Ring"
	recipe_name = "a Golden Quartz Ring"
	additional_items = list(/obj/item/gem/blue)
	created_item = /obj/item/clothing/ring/gold/blortz
	craftdiff = 5

/datum/anvil_recipe/valuables/gold/saffira
	name = "Golden Sapphire Ring"
	recipe_name = "a Golden Sapphire Ring"
	additional_items = list(/obj/item/gem/violet)
	created_item = /obj/item/clothing/ring/gold/saffira
	craftdiff = 5

/datum/anvil_recipe/valuables/gold/gemerald
	name = "Golden Emerald Ring"
	recipe_name = "a Golden Emerald Ring"
	additional_items = list(/obj/item/gem/green)
	created_item = /obj/item/clothing/ring/gold/gemerald
	craftdiff = 5

/datum/anvil_recipe/valuables/gold/toper
	name = "Golden Topaz Ring"
	recipe_name = "a Golden Topaz Ring"
	additional_items = list(/obj/item/gem/yellow)
	created_item = /obj/item/clothing/ring/gold/toper
	craftdiff = 5

/datum/anvil_recipe/valuables/gold/rontz
	name = "Golden Ruby Ring"
	recipe_name = "a Golden Ruby Ring"
	additional_items = list(/obj/item/gem/red)
	created_item = /obj/item/clothing/ring/gold/rontz
	craftdiff = 5
