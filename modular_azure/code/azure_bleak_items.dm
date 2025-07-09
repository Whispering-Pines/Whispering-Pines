
/datum/supply_pack/wardrobe/suits/exoticsilkbra
	name = "Exotic Silks"
	cost = 100
	contains = list(
					/obj/item/clothing/shirt/exoticsilkbra,
					/obj/item/clothing/face/exoticsilkmask,
					/obj/item/clothing/shoes/anklets,
					/obj/item/storage/belt/leather/exoticsilkbelt,
				)

/obj/item/clothing/shoes/anklets
	name = "golden anklets"
	icon = 'modular_azure/icons/clothing/feet.dmi'
	mob_overlay_icon = 'modular_azure/icons/clothing/onmob/feet.dmi'
	desc = "Luxurious anklets made of the finest gold. They leave the feet bare while adding an exotic flair."
	gender = PLURAL
	icon_state = "anklets"
	item_state = "anklets"
	is_barefoot = TRUE
	sewrepair = TRUE
	armor = list("blunt" = 5, "slash" = 5, "stab" = 5, "piercing" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/face/exoticsilkmask
	name = "exotic silk mask"
	icon_state = "exoticsilkmask"
	icon = 'modular_azure/icons/clothing/masks.dmi'
	mob_overlay_icon = 'modular_azure/icons/clothing/onmob/masks.dmi'
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	body_parts_covered = NECK|MOUTH
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	sewrepair = TRUE

/obj/item/clothing/face/blindfold
	name = "blindfold"
	desc = "A strip of cloth tied around the eyes to block vision."
	icon_state = "clothblindfold"
	item_state = "clothblindfold"
	icon = 'modular_azure/icons/clothing/masks.dmi'
	mob_overlay_icon = 'modular_azure/icons/clothing/onmob/masks.dmi'
	flags_inv = HIDEFACE
	body_parts_covered = EYES
	sewrepair = TRUE
	tint = 3

/obj/item/clothing/face/blindfold/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_MASK)
		user.become_blind("blindfold_[REF(src)]")

/obj/item/clothing/face/blindfold/dropped(mob/living/carbon/human/user)
	..()
	user.cure_blind("blindfold_[REF(src)]")

/obj/item/clothing/shirt/exoticsilkbra
	name = "exotic silk bra"
	desc = "An exquisite bra crafted from the finest silk and adorned with gold rings. It leaves little to the imagination."
	icon = 'modular_azure/icons/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_azure/icons/clothing/onmob/shirts.dmi'
	icon_state = "exoticsilkbra"
	item_state = "exoticsilkbra"
	body_parts_covered = CHEST
	boobed = TRUE
	sewrepair = TRUE
	flags_inv = null
	slot_flags = ITEM_SLOT_SHIRT
	boobed = TRUE

/obj/item/storage/belt/leather/exoticsilkbelt
	name = "exotic silk belt"
	desc = "A gold adorned belt with the softest of silks barely concealing one's bits."
	icon = 'modular_azure/icons/clothing/belts.dmi'
	mob_overlay_icon = 'modular_azure/icons/clothing/onmob/belts.dmi'
	icon_state = "exoticsilkbelt"
	item_state = "exoticsilkbelt"
	flags_inv = HIDECROTCH
	var/max_storage = 5
	sewrepair = TRUE

//recipes

/datum/anvil_recipe/sewing/goldanklet
	name = "exotic silk anklets"
	req_bar =  /obj/item/ingot/gold
	created_item = list (/obj/item/clothing/shoes/anklets)
	craftdiff = 6

/datum/crafting_recipe/sewing/exoticsilkbra
	name = "exotic silk bra - (4 silk, 1 gold ring; MASTER)"
	result = list (/obj/item/clothing/shirt/exoticsilkbra)
	reqs = list(/obj/item/natural/silk = 3,
				/obj/item/clothing/ring/gold = 1)
	craftdiff = 6

/datum/crafting_recipe/sewing/anklets
	name = "exotic silk anklets - (3 silk, 1 gold ring; MASTER)"
	result = list (/obj/item/clothing/shoes/anklets)
	reqs = list(/obj/item/natural/silk = 3,
				/obj/item/clothing/ring/gold = 1)
	craftdiff = 6

/datum/crafting_recipe/sewing/exoticsilkbelt
	name = "exotic silk belt - (3 silk, 1 gold ring; MASTER)"
	result = list (/obj/item/storage/belt/leather/exoticsilkbelt)
	reqs = list(/obj/item/natural/silk = 3,
				/obj/item/clothing/ring/gold = 1)
	craftdiff = 6

/datum/crafting_recipe/sewing/exoticsilkmask
	name = "exotic silk mask - (3 silk, 1 gold ring; MASTER)"
	result = list (/obj/item/clothing/face/exoticsilkmask)
	reqs = list(/obj/item/natural/silk = 3,
				/obj/item/clothing/ring/gold = 1)
	craftdiff = 6

//gadgets
/*
Grappling hook! Comes in 3 strict steps w/ unique intents: Grab -> Attach -> Reel.
Grab grabs onto a floor turf in range, only works for floors ABOVE the user.
Attach clasps a hook onto the chosen atom (obj / mob, has to be unanchored and not a structure or machinery)
Reel teleports the attached atom to the grabbed turf.
*/
#define GRAPPLER_ZUP 1
#define GRAPPLER_ZDOWN 2
#define GRAPPLER_NOZ 3

/obj/item/grapplinghook
	name = "bronze grappler"
	desc = "The finest innovation in industrial dwarven Engineering. Used to haul crates and kegs in shafts too steep for railcarts. Can be used on people who aren't too large.\nHas a range of VI tiles on the same plane, and a range of III tiles across planes.\nGrappling in the same plane will be blocked by any dense objects."
	icon = 'modular_azure/icons/misc/gadgets.dmi'
	icon_state = "grappler_used"
	item_state = "grappler"
	lefthand_file = 'modular_azure/icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'modular_azure/icons/mob/inhands/items_righthand.dmi'
	possible_item_intents = list(/datum/intent/grapple, /datum/intent/attach, /datum/intent/reel)
	experimental_inhand = FALSE
	var/is_loaded = FALSE
	var/in_use = FALSE
	var/turf/grappled_turf
	var/atom/attached
	var/mutable_appearance/tile_effect
	var/mutable_appearance/target_effect
	var/max_range_z = 3
	var/max_range_noz = 6
	var/leash_range = 7
	var/list/obj_to_destroy = list()
	grid_height = 32
	grid_width = 64

/obj/item/grapplinghook/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)	//For preventing hooking / attaching something and walking away.


/obj/item/grapplinghook/Destroy()
	STOP_PROCESSING(SSobj, src)
	reset_tile()
	reset_target()
	return ..()

//Range check for both the tool itself and anything it has attached to the turf it's hooked to.
/obj/item/grapplinghook/process()
	if(in_use && grappled_turf)
		if(get_dist(grappled_turf, src) > leash_range)
			reset_tile()
			reset_target()
	if(grappled_turf && attached)
		if(get_dist(grappled_turf, attached) > leash_range)
			reset_tile()
			reset_target()

//Grappler intents. Not meant to be functional outside of the tool.
/datum/intent/grapple
	name = "grapple"
	icon_state = "ingrab"
	desc = "Used to grapple onto an open, unobstructed tile."
	no_attack = TRUE

/datum/intent/attach
	name = "attach"
	icon_state = "inattach"
	desc = "Used to attach an entity to the hook for reeling. Must not be heavy, large, or anchored."
	no_attack = TRUE

/datum/intent/reel
	name = "reel"
	icon_state = "inreel"
	desc = "Used to reel the attached entity to the grappled tile."
	no_attack = TRUE

/obj/item/grapplinghook/examine()
	. = ..()
	if(is_loaded && !in_use)
		. += span_warning("It's ready to use. <b>GRAB</b> onto a turf above you.")
	else if(!is_loaded && !in_use)
		. += span_warning("It's expended. It must be reloaded.")
	else if(!is_loaded && grappled_turf && in_use)
		. += span_warning("It's deployed. You can <b>ATTACH</b> a hook to an entity.")
		. += span_info("I may activate this in my hand to reset.")
	if(attached && grappled_turf && in_use && !is_loaded)
		. += span_warning("It's ready to use. You may <b>REEL</b> in \the [attached].")

/obj/item/grapplinghook/obj_break(damage_flag)
	reset_tile()
	reset_target()
	..()

/obj/item/grapplinghook/obj_destruction(damage_flag)
	reset_tile()
	reset_target()
	..()


/obj/item/grapplinghook/attack_self(mob/living/user)
	if(!is_loaded && !in_use && user.used_intent != /datum/intent/reel)
		var/stat = max(user.STASPD, user.STAPER)	//We check the PER / SPD stats first
		stat = stat - 10
		if(stat > 0)
			stat = stat * 3
			if(user.STASTR > 11)	//Then we add their strength if they had any of the previous
				stat += (user.STASTR - 10) * 2
		else
			stat = 0
		stat += (user.get_skill_level(/datum/skill/craft/engineering)) * 5	//And finally their Engineering level.
		stat = clamp(stat, 10, 70)	//Clamp to a very loud second just in case you're a superhuman engineer
		user.visible_message(span_info("[user] begins cranking the [src]..."))
		playsound(user, 'sound/misc/grapple_crank.ogg', 100, FALSE, 3)
		if(do_after(user, (70 - stat)))
			playsound(src, 'sound/foley/trap_arm.ogg', 100, FALSE , 5)
			to_chat(user, span_info("It's loaded!"))
			is_loaded = TRUE
			update_icon_state()
		else
			user.visible_message(span_info("[user] gets interrupted!"))
	else if(istype(user.used_intent, /datum/intent/reel))	//Alternative to clicking on an empty tile. You can self-use it to reel instead.
		if(attached && in_use)
			if(get_dist(attached, grappled_turf) <= (user.z != grappled_turf.z ? max_range_z : max_range_noz))
				user.visible_message("[user] reels in the [src]!")
				if(do_after(user, 10))
					reel()
			else
				to_chat(user, span_info("[attached] is too far!"))
	else if(!is_loaded && in_use && grappled_turf && tile_effect)	//Reset option.
		user.visible_message("[user] unhooks from the tile.")
		reset_tile()
		reset_target()

//Resets the tile effect and the grappled turf. Generally called with reset_target()
/obj/item/grapplinghook/proc/reset_tile(silent = FALSE)
	if(tile_effect && grappled_turf)
		grappled_turf.cut_overlay(tile_effect)
		qdel(tile_effect)
		grappled_turf = null
	if(!silent)	//Silent is used during a successful reel because it has its own distinct sounds
		playsound(src, 'sound/foley/trap.ogg', 100, FALSE , 5)
	is_loaded = FALSE
	update_icon_state()

//Resets the target effect overlay and the attached atom. Generally called with reset_tile()
/obj/item/grapplinghook/proc/reset_target()
	if(attached && target_effect)
		attached.cut_overlay(target_effect)
		qdel(target_effect)
		attached = null
	in_use = FALSE
	update_icon_state()

/obj/item/grapplinghook/proc/check_path(turf/Tu, turf/Tt, state)
	var/dist = get_dist(Tt, Tu)
	var/last_dir
	var/turf/last_step
	switch(state)
		if(GRAPPLER_ZUP)
			last_step = get_step_multiz(Tu, UP)
		if(GRAPPLER_ZDOWN)
			last_step = get_step_multiz(Tu, DOWN)
		if(GRAPPLER_NOZ)
			last_step = Tu
	var/success = FALSE
	if(state == GRAPPLER_ZDOWN || state == GRAPPLER_ZUP)
		for(var/i = 0, i <= dist, i++)
			last_dir = get_dir(last_step, Tt)
			var/turf/Tstep = get_step(last_step, last_dir)
			if(!Tstep.density)
				success = TRUE
				var/list/cont = Tstep.GetAllContents()
				for(var/obj/structure/window/W in cont)
					if(W.climbable && !W.opacity)	//It's climable and can be seen through
						success = TRUE
						LAZYADD(obj_to_destroy, W)
						continue
					else if(!W.climbable)
						success = FALSE
						return success
				for(var/obj/structure/fluff/railing/fence/F in cont)
					if(F)
						success = FALSE
						return success
			else
				success = FALSE
				return success
			last_step = Tstep
	if(state == GRAPPLER_NOZ)
		success = TRUE
		var/list/visible = getline(Tu, Tt)
		for(var/turf/T in visible)
			if(T.opacity || T.density && T != Tu)	//Any dense or opaque turfs
				success = FALSE
				return success
			for(var/obj/O in (T.contents + Tt.contents))
				if(O)
					if(O.density || O.opacity)	//ANY dense or opaque objects. It's strict, but it's also a teleport, so.
						success = FALSE
						return success
	return success



//Successful reel, complete reset.
/obj/item/grapplinghook/proc/reel()
	if(attached && in_use && grappled_turf)
		if(do_teleport(attached, grappled_turf))
			playsound(attached, 'sound/misc/grapple_reel.ogg', 100, FALSE)
			playsound(grappled_turf, 'sound/misc/grapple_reel.ogg', 100, FALSE)
			destroy_eligible_objects()
			reset_tile(silent = TRUE)
			reset_target()
			unload(failure = TRUE)

/obj/item/grapplinghook/proc/destroy_eligible_objects()
	if(length(obj_to_destroy))
		for(var/obj/O in obj_to_destroy)
			if(istype(O,/obj/structure/window))
				var/obj/structure/window/W = O
				if(!W.climbable)
					O.obj_integrity = 1	//Keeps it from being destroyed
					O.obj_break()
		LAZYCLEARLIST(obj_to_destroy)

/obj/item/grapplinghook/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	if(istype(user.used_intent, /datum/intent/grapple))	//First step, grappling onto a tile. Spawns an indicator on it.
		if(is_loaded && istype(target, /turf/))
			var/turf/T = target
			if(!istransparentturf(T) && !islava(T))
				if(T.z != user.z) //We are shooting at a floor turf above or below
					var/reason
					if(max_range_z >= get_dist(user, T) && !T.density)
						if(check_path(get_turf(user), T, T.z > user.z ? GRAPPLER_ZUP : GRAPPLER_ZDOWN))	//We check for opaque turfs or non-climbable windows in the way via a simple pathfind.
							to_chat(user, span_info("The grapple lands on the tile!"))
							grapple_to(T)
							attached = user
							return
						else
							to_chat(user, span_info("The path is blocked!"))
							return
					else if(get_dist(user, T) > max_range_z)
						reason = "It's too far."
					else if (T.density)
						reason = "It's a wall!"
					to_chat(user, span_info("The hook fails! "+"[reason]"))
					playsound(user, 'sound/foley/trap.ogg', 100, FALSE , 5)
					unload(failure = TRUE)
				else if(T.z == user.z)
					if(max_range_noz >= get_dist(user, T) && !T.density)
						if(check_path(get_turf(user), T, GRAPPLER_NOZ))	//We check for opaque turfs and ANY dense objects in the way
							to_chat(user, span_info("The grapple lands on the tile!"))
							grapple_to(T)
							attached = user
							return
						else
							to_chat(user, span_info("The path is blocked!"))
							return
			else
				to_chat(user, span_info("Incorrect target! It needs a clear floor tile to grapple onto."))
		else if(!is_loaded)
			to_chat(user, span_info("It's been used already."))
	if(istype(user.used_intent, /datum/intent/attach))	//Second step. Once we have a turf we've grappled onto, we can use this to attach to an entity.
		if(in_use && !istype(target, /turf/))	//Can't use the feature unless it's grappled already
			var/safe_to_teleport = TRUE
			if(isobj(target))
				var/obj/O = target
				if(!istype(target, /obj/structure/closet/crate) && !istype(target, /obj/structure/fermentation_keg) && !istype(target, /obj/structure/handcart))	//We DO want to move crates, barrels & carts
					if(O.density || istype(target, /obj/structure) || O.anchored || istype(target, /obj/machinery)) //This should cover most (fingers crossed) objects that shouldn't be moved around like this.
						safe_to_teleport = FALSE
			if(ishuman(target))
				var/mob/living/carbon/human/H = target
				if(H.has_quirk(/datum/quirk/backproblems))	//Too large.
					safe_to_teleport = FALSE
			if(safe_to_teleport)
				to_chat(user, span_info("I begin to attach the hook..."))
				if(do_after(user, 30))
					if(target != user)
						user.visible_message(span_warning("[user] attaches the hook to [target]."))
					if(target == user)
						user.visible_message(span_warning("[user] attaches the hook to themselves!"))
					attach(target)
			else
				to_chat(user, span_warning("[target] is too large or unwieldy to attach!"))
		else
			to_chat(user, span_info("I need to have it hooked onto a tile first."))
	if(istype(user.used_intent, /datum/intent/reel))	//Last step, we reel in the attached entity to the grappled turf.
		if(attached && in_use)
			if(get_dist(attached, grappled_turf) <= (user.z != grappled_turf.z ? max_range_z : max_range_noz))
				user.visible_message("[user] reels in \the [src]!")
				if(do_after(user, 10))
					reel()
			else
				to_chat(user, span_info("[target] is too far!"))
		else
			to_chat(user, span_info("I need to have something attached."))
	. = ..()

//Attaches a hook to an atom. Used with the "ATTACH" intent.
/obj/item/grapplinghook/proc/attach(atom/A)
	if(A && !isturf(A))
		if(target_effect && attached)
			attached.cut_overlay(target_effect)
			qdel(target_effect)
		playsound(A,'sound/misc/grapple_attach.ogg', 100, FALSE, 5)
		attached = A
		target_effect = mutable_appearance(icon = 'modular_azure/icons/effects/effects.dmi', icon_state = "aimwarn", layer = 20)
		attached.add_overlay(target_effect)

//Hooks onto a turf. Used with the "GRAB" intent.
/obj/item/grapplinghook/proc/grapple_to(turf/T)
	unload()
	playsound(T, 'sound/misc/grapple_land.ogg', 100, FALSE, 5)
	tile_effect = mutable_appearance(icon = 'modular_azure/icons/effects/effects.dmi', icon_state = "hooked_tile", layer = 18)
	grappled_turf = T
	grappled_turf.add_overlay(tile_effect)

//Reloads the grappler.
/obj/item/grapplinghook/proc/load()
	is_loaded = TRUE
	in_use = FALSE
	update_icon_state()

//Unloads the grappler after a successful, or not, attempt to use on a turf.
/obj/item/grapplinghook/proc/unload(failure)
	if(!failure)
		is_loaded = FALSE
		in_use = TRUE
	else
		is_loaded = FALSE
		in_use = FALSE
	update_icon_state()

/obj/item/grapplinghook/update_icon_state()
	. = ..()
	if(is_loaded && !in_use)
		icon_state = "grappler"
	else if(!is_loaded && !in_use)
		icon_state = "grappler_used"
	else if(!is_loaded && in_use)
		icon_state = "grappler_inuse"

//candles
/obj/item/candle/candlestick/gold
	name = "three-stick gold candlestick"
	icon = 'modular_azure/icons/items/lighting.dmi'
	icon_state = "gcandelabra"
	infinite = TRUE
	sellprice = 60

/obj/item/candle/candlestick/gold/update_icon_state()
	. = ..()
	icon_state = "gcandelabra[lit ? "_lit" : ""]"

/obj/item/candle/candlestick/gold/lit
	icon_state = "gcandelabra_lit"
	start_lit = TRUE

/obj/item/candle/candlestick/silver
	name = "three-stick silver candlestick"
	icon = 'modular_azure/icons/items/lighting.dmi'
	icon_state = "scandelabra"
	infinite = TRUE
	sellprice = 40

/obj/item/candle/candlestick/silver/update_icon_state()
	. = ..()
	icon_state = "scandelabra[lit ? "_lit" : ""]"

/obj/item/candle/candlestick/silver/lit
	icon_state = "scandelabra_lit"
	start_lit = TRUE

/obj/item/candle/candlestick/gold/single
	name = "one-stick gold candlestick"
	icon = 'modular_azure/icons/items/lighting.dmi'
	icon_state = "singlegcandelabra"
	infinite = TRUE
	sellprice = 50

/obj/item/candle/candlestick/gold/single/update_icon_state()
	. = ..()
	icon_state = "singlegcandelabra[lit ? "_lit" : ""]"

/obj/item/candle/candlestick/gold/single/lit
	icon_state = "singlegcandelabra_lit"
	start_lit = TRUE

/obj/item/candle/candlestick/silver/single
	name = "one-stick silver candlestick"
	icon = 'modular_azure/icons/items/lighting.dmi'
	icon_state = "singlescandelabra"
	infinite = TRUE
	sellprice = 30

/obj/item/candle/candlestick/silver/single/update_icon_state()
	. = ..()
	icon_state = "singlescandelabra[lit ? "_lit" : ""]"

/obj/item/candle/candlestick/silver/single/lit
	icon_state = "singlescandelabra_lit"
	start_lit = TRUE

/obj/item/candle/gold
	name = "gold candle"
	icon = 'modular_azure/icons/items/lighting.dmi'
	icon_state = "gcandle"
	infinite = TRUE
	sellprice = 50

/obj/item/candle/gold/update_icon_state()
	. = ..()
	icon_state = "gcandle[lit ? "_lit" : ""]"

/obj/item/candle/gold/lit
	icon_state = "gcandle_lit"
	start_lit = TRUE

/obj/item/candle/silver
	name = "silver candle"
	icon = 'modular_azure/icons/items/lighting.dmi'
	icon_state = "scandle"
	infinite = TRUE
	sellprice = 30

/obj/item/candle/silver/update_icon_state()
	. = ..()
	icon_state = "scandle[lit ? "_lit" : ""]"

/obj/item/candle/silver/lit
	icon_state = "scandle_lit"
	start_lit = TRUE
