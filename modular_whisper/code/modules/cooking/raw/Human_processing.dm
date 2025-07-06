//RAW ingredients

/obj/item/reagent_containers/food/snacks/meat/human
	name = "manflesh"
	foodtype = RAW | MEAT | CANNIBAL
	become_rot_type = /obj/item/reagent_containers/food/snacks/rotten/meat/human

/obj/item/reagent_containers/food/snacks/meat/steak/human
	ingredient_size = 2
	name = "raw manflesh"
	slices_num = 2
	foodtype = RAW | MEAT | CANNIBAL
	slice_path = /obj/item/reagent_containers/food/snacks/meat/mince/beef
	slice_bclass = BCLASS_CHOP

/obj/item/reagent_containers/food/snacks/meat/mince/human
	name = "minced manflesh"
	foodtype = RAW | MEAT | CANNIBAL
	become_rot_type = /obj/item/reagent_containers/food/snacks/rotten/mince/human

/obj/item/reagent_containers/food/snacks/meat/mince/human/cooked
	foodtype = MEAT | CANNIBAL

/obj/item/reagent_containers/food/snacks/meat/sausage/human
	name = "raw manflesh sausage/human"
	foodtype = RAW | MEAT | CANNIBAL
	become_rot_type = /obj/item/reagent_containers/food/snacks/rotten/sausage/human

/obj/item/reagent_containers/food/snacks/meat/wiener/human
	name = "raw manflesh wiener"
	foodtype = RAW | MEAT | CANNIBAL
	become_rot_type = /obj/item/reagent_containers/food/snacks/rotten/sausage/human

/obj/item/reagent_containers/food/snacks/foodbase/griddledog_raw/human
	name = "uncooked human griddledog"
	foodtype = GRAIN | CANNIBAL

//rotten
/obj/item/reagent_containers/food/snacks/rotten/meat/human
	name = "rotten manflesh meat"
	icon_state = "meat"

/obj/item/reagent_containers/food/snacks/rotten/sausage/human
	name = "rotten manflesh sausage/human"
	icon_state = "raw_wiener"

/obj/item/reagent_containers/food/snacks/rotten/mince/human
	name = "rotten manflesh mince"
	icon_state = "meatmince"

//cooked
/obj/item/reagent_containers/food/snacks/cooked/frysteak/human
	name = "human frysteak"
	foodtype = MEAT | CANNIBAL

/obj/item/reagent_containers/food/snacks/cooked/frysteak_tatos/human
	name = "human frysteak and potato"
	foodtype = MEAT | CANNIBAL

/obj/item/reagent_containers/food/snacks/cooked/frysteak_onion/human
	name = "human frysteak and onions"
	foodtype = MEAT | CANNIBAL

// Sausage & Wiener
/obj/item/reagent_containers/food/snacks/cooked/sausage/human
	name = "human sausage"
	foodtype = MEAT | CANNIBAL

/obj/item/reagent_containers/food/snacks/cooked/sausage_cabbage/human
	name = "human wiener on cabbage"
	foodtype = MEAT | CANNIBAL

/obj/item/reagent_containers/food/snacks/cooked/sausage_potato/human
	name = "human wiener on tato"
	foodtype = MEAT | CANNIBAL

/obj/item/reagent_containers/food/snacks/cooked/sausage_onion/human
	name = "human wiener and onions"
	foodtype = MEAT | CANNIBAL

/obj/item/reagent_containers/food/snacks/cooked/sausage_sticked/human
	name = "human sausage on a stick"
	foodtype = MEAT | CANNIBAL

//recipes
/datum/repeatable_crafting_recipe/cooking/frysteak_tato/human
	name = "frysteak human and Tatos"
	requirements = list(
		/obj/item/reagent_containers/food/snacks/cooked/frysteak/human = 1,
		/obj/item/reagent_containers/food/snacks/produce/vegetable/potato/baked = 1,
	)
	attacked_atom = /obj/item/reagent_containers/food/snacks/cooked/frysteak/human
	starting_atom =/obj/item/reagent_containers/food/snacks/produce/vegetable/potato/baked
	output = /obj/item/reagent_containers/food/snacks/cooked/frysteak_tatos
/datum/repeatable_crafting_recipe/cooking/frysteak_onion/human
	name = "frysteak human and Onions"
	requirements = list(
		/obj/item/reagent_containers/food/snacks/cooked/frysteak/human = 1,
		/obj/item/reagent_containers/food/snacks/onion_fried = 1,
	)
	attacked_atom = /obj/item/reagent_containers/food/snacks/cooked/frysteak/human
	starting_atom =/obj/item/reagent_containers/food/snacks/onion_fried
	output = /obj/item/reagent_containers/food/snacks/cooked/frysteak_onion

/datum/repeatable_crafting_recipe/cooking/wiener_cabbage/human
	name = "Human Wiener on Cabbage"
	requirements = list(
		/obj/item/reagent_containers/food/snacks/cooked/sausage/human = 1,
		/obj/item/reagent_containers/food/snacks/produce/vegetable/cabbage = 1,
	)
	attacked_atom = /obj/item/reagent_containers/food/snacks/cooked/sausage/human
	starting_atom =/obj/item/reagent_containers/food/snacks/produce/vegetable/cabbage
	output = /obj/item/reagent_containers/food/snacks/cooked/sausage_cabbage/human

/datum/repeatable_crafting_recipe/cooking/wiener_cabbage/human
	name = "Human Wiener on Cabbage"
	requirements = list(
		/obj/item/reagent_containers/food/snacks/cooked/sausage/human = 1,
		/obj/item/reagent_containers/food/snacks/produce/vegetable/cabbage = 1,
	)
	attacked_atom = /obj/item/reagent_containers/food/snacks/produce/vegetable/cabbage
	starting_atom = /obj/item/reagent_containers/food/snacks/cooked/sausage/human
	output = /obj/item/reagent_containers/food/snacks/cooked/sausage_cabbage/human

/datum/repeatable_crafting_recipe/cooking/wiener_potato/human
	name = "Human Wiener on Tato"
	requirements = list(
		/obj/item/reagent_containers/food/snacks/cooked/sausage/human = 1,
		/obj/item/reagent_containers/food/snacks/produce/vegetable/potato/baked = 1,
	)
	attacked_atom = /obj/item/reagent_containers/food/snacks/cooked/sausage/human
	starting_atom =/obj/item/reagent_containers/food/snacks/produce/vegetable/potato/baked
	output = /obj/item/reagent_containers/food/snacks/cooked/sausage_potato/human

/datum/repeatable_crafting_recipe/cooking/wiener_potato/human
	name = "Human Wiener on Fried Tato"
	requirements = list(
		/obj/item/reagent_containers/food/snacks/cooked/sausage/human = 1,
		/obj/item/reagent_containers/food/snacks/produce/vegetable/potato/fried = 1,
	)
	attacked_atom = /obj/item/reagent_containers/food/snacks/cooked/sausage/human
	starting_atom =/obj/item/reagent_containers/food/snacks/produce/vegetable/potato/fried
	output = /obj/item/reagent_containers/food/snacks/cooked/sausage_potato/human

/datum/repeatable_crafting_recipe/cooking/wiener_potato/human
	name = "Human Wiener on Tato"
	requirements = list(
		/obj/item/reagent_containers/food/snacks/cooked/sausage/human = 1,
		/obj/item/reagent_containers/food/snacks/produce/vegetable/potato/baked = 1,
	)
	attacked_atom = /obj/item/reagent_containers/food/snacks/produce/vegetable/potato/baked
	starting_atom = /obj/item/reagent_containers/food/snacks/cooked/sausage/human
	output = /obj/item/reagent_containers/food/snacks/cooked/sausage_potato/human

/datum/repeatable_crafting_recipe/cooking/wiener_potato/human
	name = "Human Wiener on Onions"
	requirements = list(
		/obj/item/reagent_containers/food/snacks/cooked/sausage/human = 1,
		/obj/item/reagent_containers/food/snacks/onion_fried = 1,
	)
	attacked_atom = /obj/item/reagent_containers/food/snacks/cooked/sausage/human
	starting_atom =/obj/item/reagent_containers/food/snacks/onion_fried
	output = /obj/item/reagent_containers/food/snacks/cooked/sausage_onion/human
/datum/repeatable_crafting_recipe/cooking/wiener_potato/human
	name = "Human Wiener on Onions"
	requirements = list(
		/obj/item/reagent_containers/food/snacks/cooked/sausage/human = 1,
		/obj/item/reagent_containers/food/snacks/onion_fried = 1,
	)
	starting_atom = /obj/item/reagent_containers/food/snacks/cooked/sausage/human
	attacked_atom = /obj/item/reagent_containers/food/snacks/onion_fried
	output = /obj/item/reagent_containers/food/snacks/cooked/sausage_onion/human

//more shit
/datum/repeatable_crafting_recipe/cooking/wiener_stick/human
	name = "Skewered Wiener"
	subtypes_allowed = TRUE
	requirements = list(
		/obj/item/reagent_containers/food/snacks/cooked/sausage/human = 1,
		/obj/item/grown/log/tree/stick = 1,
	)
	attacked_atom = /obj/item/reagent_containers/food/snacks/cooked/sausage/human
	starting_atom = /obj/item/grown/log/tree/stick
	output = /obj/item/reagent_containers/food/snacks/cooked/sausage_sticked/human
	uses_attacked_atom = TRUE
	craft_time = 3 SECONDS
	crafting_sound = 'sound/foley/dropsound/food_drop.ogg'
	extra_chance = 100
	crafting_message = "skewer the sausage"

/datum/repeatable_crafting_recipe/cooking/raw_griddle_dog/human
	name = "Raw Griddledog"

	requirements = list(
		/obj/item/reagent_containers/food/snacks/cooked/sausage_sticked/human = 1,
		/obj/item/reagent_containers/food/snacks/butterdough_slice = 1,
	)
	attacked_atom = /obj/item/reagent_containers/food/snacks/butterdough_slice
	starting_atom = /obj/item/reagent_containers/food/snacks/cooked/sausage_sticked/human
	output = /obj/item/reagent_containers/food/snacks/foodbase/griddledog_raw/human

/datum/repeatable_crafting_recipe/cooking/raw_griddledog/human
	name = "Raw Griddledog"

	requirements = list(
		/obj/item/reagent_containers/food/snacks/cooked/sausage_sticked/human = 1,
		/obj/item/reagent_containers/food/snacks/butterdough_slice = 1,
	)
	attacked_atom = /obj/item/reagent_containers/food/snacks/cooked/sausage_sticked/human
	starting_atom = /obj/item/reagent_containers/food/snacks/butterdough_slice
	output = /obj/item/reagent_containers/food/snacks/foodbase/griddledog_raw/human
