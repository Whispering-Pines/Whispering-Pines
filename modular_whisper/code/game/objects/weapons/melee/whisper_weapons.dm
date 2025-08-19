//Knives
/obj/item/weapon/knife/dagger/steel/parrying
	name = "steel parrying dagger"
	desc = "This is a parrying dagger made of solid steel, used to catch opponent's weapons in the handguard."
	icon = 'modular_whisper/icons/weapons/weapons.dmi'
	icon_state = "spdagger"
	melting_material = null
	wdefense = GOOD_PARRY
	wbalance = VERY_HARD_TO_DODGE
	icon_state = "spdagger"

//from azure, sprites too.
/obj/item/weapon/knife/dagger/steel/dtace
	name = "'De Tace'"
	desc = "The right hand of the right hand, this narrow length of steel serves as a quick solution to petty greviences."
	icon_state = "stiletto"
	icon = 'modular_whisper/icons/weapons/weapons.dmi'
	force = DAMAGE_DAGGER+2
	max_integrity = 200
	smeltresult = /obj/item/ingot/steel


//-----recipes-----
//knives

/datum/anvil_recipe/weapons/steel/dagger_parrying
	name = "Parrying Dagger (+1 Steel)"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/weapon/knife/dagger/steel/parrying
	recipe_name = "a Parrying Dagger"
	craftdiff = 3
