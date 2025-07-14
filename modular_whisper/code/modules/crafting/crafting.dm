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

/datum/repeatable_crafting_recipe/survival/stone_hammer
	name = "stone hammer"
	requirements = list(
		/obj/item/natural/stone = 2,
		/obj/item/grown/log/tree/stick = 1,
	)

	attacked_atom = /obj/item/natural/stone
	starting_atom = /obj/item/grown/log/tree/stick
	output = /obj/item/weapon/hammer/stone
	craftdiff = 0
	uses_attacked_atom = TRUE

/datum/crafting_recipe/alch/charcoal
	name = "make charcoal"
	reqs = list(/obj/item/grown/log/tree/small = 1)
	result = /obj/item/ore/coal/charcoal
	structurecraft = /obj/machinery/light/fueled/campfire
	craftdiff = 0
	skillcraft = /datum/skill/craft/crafting

/datum/crafting_recipe/alch/charcoal/hearth
	structurecraft = /obj/machinery/light/fueled/hearth

/datum/crafting_recipe/alch/charcoal/mobile
	structurecraft = /obj/machinery/light/fueled/hearth/mobilestove

///glass shit
/datum/crafting_recipe/glass/cup
	name = "glass cup"
	result = /obj/item/reagent_containers/glass/cup/glassware
	reqs = list(
		/obj/item/natural/glass = 1,
	)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 1
	structurecraft = /obj/machinery/light/fueled/smelter

/datum/crafting_recipe/glass/wineglass
	name = "wine glass"
	result = /obj/item/reagent_containers/glass/cup/glassware/wineglass
	reqs = list(
		/obj/item/natural/glass = 1,
	)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 2
	structurecraft = /obj/machinery/light/fueled/smelter

/datum/crafting_recipe/glass/shotglass
	name = "shot glass"
	result = /obj/item/reagent_containers/glass/cup/glassware/shotglass
	reqs = list(
		/obj/item/natural/glass = 1,
	)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 1
	structurecraft = /obj/machinery/light/fueled/smelter

/datum/crafting_recipe/glass/shotglass
	name = "glass carafe"
	result = /obj/item/reagent_containers/glass/carafe
	reqs = list(
		/obj/item/natural/glass = 2,
	)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 3
	structurecraft = /obj/machinery/light/fueled/smelter

/datum/crafting_recipe/glass/dropper
	name = "glass dropper"
	result = /obj/item/reagent_containers/dropper
	reqs = list(
		/obj/item/natural/glass = 1,
	)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 2
	structurecraft = /obj/machinery/light/fueled/smelter

/datum/crafting_recipe/glass/glasspane
	name = "glass"
	result = /obj/item/natural/glass
	reqs = list(
		/obj/item/natural/sand = 1,
		/obj/item/natural/stone = 1,
	)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 2
	structurecraft = /obj/machinery/light/fueled/smelter

/datum/crafting_recipe/glass/glassbottle
	name = "glass bottle"
	result = /obj/item/reagent_containers/glass/bottle
	reqs = list(
		/obj/item/natural/glass = 2,
	)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 2
	structurecraft = /obj/machinery/light/fueled/smelter

/datum/crafting_recipe/glass/glassvial
	name = "glass vial"
	result = /obj/item/reagent_containers/glass/bottle/vial
	reqs = list(
		/obj/item/natural/glass = 1,
	)
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 1
	structurecraft = /obj/machinery/light/fueled/smelter

//head bag
/datum/repeatable_crafting_recipe/sewing/headbag
	name = "head sack"
	requirements = list(
		/obj/item/natural/cloth = 2,
		/obj/item/natural/fibers = 1,
	)
	tool_usage = list(
		/obj/item/needle = list("starts to sew", "start to sew")
	)
	starting_atom = /obj/item/needle
	attacked_atom = /obj/item/natural/cloth
	output = /obj/item/clothing/head/sack
	craftdiff = 2
	skillcraft = /datum/skill/misc/sewing
	subtypes_allowed = TRUE
