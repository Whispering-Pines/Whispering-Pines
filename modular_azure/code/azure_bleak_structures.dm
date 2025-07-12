/obj/structure/window/harem
	name = "harem window"
	icon = 'modular_azure/icons/misc/roguewindow.dmi'
	icon_state = "harem1-solid"

/obj/structure/window/harem/two
	name = "harem window"
	icon_state = "harem2-solid"
	opacity = TRUE

/obj/structure/window/harem/three
	name = "harem window"
	icon_state = "harem3-solid"

/turf/open/floor/tile/harem
	icon = 'modular_azure/icons/turf/roguefloor.dmi'
	icon_state = "harem"

/turf/open/floor/tile/harem/two
	icon_state = "harem1"

/turf/open/floor/tile/harem/three
	icon_state = "harem2"

/turf/open/floor/sand
	name = "sand"
	desc = "Warm sand that, sadly, have been mixed with dirt."
	icon_state = "grimshart"
	layer = MID_TURF_LAYER
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SOFT_BAREFOOT
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	smoothing_flags = SMOOTH_EDGE
	smoothing_groups = SMOOTH_GROUP_OPEN_FLOOR + SMOOTH_GROUP_FLOOR_DIRT
	smoothing_list = SMOOTH_GROUP_FLOOR_DIRT_ROAD + SMOOTH_GROUP_FLOOR_DIRT
	landsound = 'sound/foley/jumpland/grassland.ogg'
	slowdown = 0
	neighborlay = "grimshartedge"

/turf/open/floor/sand/Initialize()
	dir = pick(GLOB.cardinals)
	. = ..()

/turf/open/water/bath/pool
	desc = "Clear water, pleasant temperature. Soothing."
	icon_state = "bathtile_pool"

/turf/open/water/bath/pool/Initialize()
	.  = ..()
	icon_state = "bathtile_pool"

/turf/open/water/bath/pool/mid
	icon_state = "bathtile_pool_mid"

/turf/open/water/bath/pool/mid/Initialize()
	.  = ..()
	icon_state = "bathtile_pool_mid"


//pillow
/obj/structure/bed/sleepingbag/fluff/pillow
	name = "pillows"
	desc = "Soft plush pillows. Resting your head on one is so relaxing."
	icon = 'modular_azure/icons/misc/structure.dmi'
	icon_state = "pillow"
	density = FALSE
	item_path = /obj/item/sleepingbag/pillow

/obj/item/sleepingbag/pillow
	name = "un-set pillow"
	desc = "A pillow not yet set up on the floor."
	icon = 'modular_azure/icons/misc/structure.dmi'
	icon_state = "pillow"
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BACK
	grid_height = 64
	grid_width = 64
	bed_path = /obj/structure/bed/sleepingbag/fluff/pillow

/obj/structure/bed/sleepingbag/fluff/pillow/red
	color = COLOR_RED

/obj/structure/bed/sleepingbag/fluff/pillow/blue
	color = COLOR_BLUE

/obj/structure/bed/sleepingbag/fluff/pillow/green
	color = COLOR_ASSEMBLY_GREEN

/obj/structure/bed/sleepingbag/fluff/pillow/brown
	color = COLOR_BROWN

/obj/structure/bed/sleepingbag/fluff/pillow/magenta
	color = COLOR_MAGENTA

/obj/structure/bed/sleepingbag/fluff/pillow/purple
	color = COLOR_PURPLE

/obj/structure/bed/sleepingbag/fluff/pillow/black
	color = COLOR_BLACK

/obj/structure/curtain/fancy
	name = "curtain"
	icon = 'modular_azure/icons/misc/structure.dmi'
	icon_state = "curtain-open"
	icon_type = "curtain"//used in making the icon state
	color = "#ACD1E9" //Default color, didn't bother hardcoding other colors, mappers can and should easily change it.

/obj/structure/curtain/fancy/white
	color = "#ffffff"

/obj/structure/curtain/fancy/red
	color = "#a32121"

/obj/structure/curtain/fancy/blue
	color = "#007fff"

/obj/structure/curtain/fancy/green
	color = "#428138"

/obj/structure/curtain/fancy/purple
	color = "#8747b1"

/obj/structure/curtain/fancy/magenta
	color = "#962e5c"

/obj/structure/curtain/fancy/black
	color = "#414143"

/obj/structure/chair/bench/couchamagenta
	icon = 'modular_azure/icons/misc/structure.dmi'
	icon_state = "couchamagentaleft"

/obj/structure/chair/bench/couchamagenta/r
	icon = 'modular_azure/icons/misc/structure.dmi'
	icon_state = "couchamagentaright"

/obj/structure/fluff/statue/shisha/hookah
	name = "shisha pipe"
	desc = "A traditional shisha pipe, this one is broken."
	icon = 'modular_azure/icons/misc/structure.dmi'
	icon_state = "hookah"

/obj/machinery/light/wallfire/candle/floorcandle
	name = "candles"
	icon = 'modular_azure/icons/items/lighting.dmi'
	icon_state = "floorcandle1"
	base_state = "floorcandle"
	pixel_y = 0
	layer = TABLE_LAYER

/obj/machinery/light/wallfire/candle/floorcandle/alt
	icon_state = "floorcandlee1"
	base_state = "floorcandlee"

/obj/machinery/light/wallfire/candle/floorcandle/pink
	color = "#f858b5ff"
	bulb_colour = "#ff13d8ff"

/obj/machinery/light/wallfire/candle/floorcandle/alt/pink
	color = "#f858b5ff"
	bulb_colour = "#ff13d8ff"

//brassface
#define UPGRADE_NOTAX		(1<<0)

/obj/structure/fake_machine/bathvend
	name = "BRASSFACE"
	desc = "Sweet, sweet, addiction. Love in the veins, comfort in my heart."
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "brassface"
	density = TRUE
	blade_dulling = DULLING_BASH
	max_integrity = 0
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	var/list/held_items = list()
	var/locked = FALSE
	var/budget = 0
	var/upgrade_flags
	var/current_cat = "1"
	lockid = "nightman"
	var/list/categories = list(
		"Alcohols",
		"Bulk",
		"Drugs",
		"Exotic Apparel",
		"Instruments",
		"Perfumes",
		"Roguery",
		)

/obj/structure/fake_machine/bathvend/Initialize()
	. = ..()
	update_icon()

/obj/structure/fake_machine/bathvend/update_icon()
	. = ..()
	cut_overlays()
	if(obj_broken)
		set_light(0)
		return
	set_light(1, 1, 1, l_color = "#1b7bf1")
	add_overlay(mutable_appearance(icon, "vendor-merch"))


/obj/structure/fake_machine/bathvend/attackby(obj/item/P, mob/user, params)
	if(istype(P, /obj/item/key))
		var/obj/item/key/K = P
		if(K.lockid == lockid)
			locked = !locked
			playsound(loc, 'sound/misc/gold_misc.ogg', 100, FALSE, -1)
			update_icon()
			return attack_hand(user)
		else
			to_chat(user, span_warning("Wrong key."))
			return
	if(istype(P, /obj/item/storage/keyring))
		var/obj/item/storage/keyring/K = P
		for(var/obj/item/key/KE in K.keys)
			if(KE.lockid == lockid)
				locked = !locked
				playsound(loc, 'sound/misc/gold_misc.ogg', 100, FALSE, -1)
				update_icon()
				return attack_hand(user)
	if(istype(P, /obj/item/coin))
		budget += P.get_real_price()
		qdel(P)
		update_icon()
		playsound(loc, 'sound/misc/machinevomit.ogg', 100, TRUE, -1)
		return attack_hand(user)
	..()

/obj/structure/fake_machine/bathvend/Topic(href, href_list)
	. = ..()
	if(!ishuman(usr))
		return
	var/mob/living/carbon/human/human_mob = usr
	if(!usr.default_can_use_topic(src) || locked)
		return
	if(href_list["buy"])
		var/mob/M = usr
		var/path = text2path(href_list["buy"])
		if(!ispath(path, /datum/supply_pack))
			message_admins("silly MOTHERFUCKER [usr.key] IS TRYING TO BUY A [path] WITH THE BRASSFACE")
			return
		var/datum/supply_pack/PA = SSmerchant.supply_packs[path]
		var/cost = PA.cost
		var/tax_amt=round(SStreasury.tax_value * cost)
		cost=cost+tax_amt
		if(upgrade_flags & UPGRADE_NOTAX)
			cost = PA.cost
		if(budget >= cost)
			budget -= cost
			if(!(upgrade_flags & UPGRADE_NOTAX))
				SStreasury.give_money_treasury(tax_amt, "brassface import tax")
				record_featured_stat(FEATURED_STATS_TAX_PAYERS, human_mob, tax_amt)
				GLOB.vanderlin_round_stats[STATS_TAXES_COLLECTED] += tax_amt
		else
			say("Not enough!")
			return
		var/shoplength = PA.contains.len
		var/l
		for(l=1,l<=shoplength,l++)
			var/pathi = pick(PA.contains)
			new pathi(get_turf(M))
	if(href_list["change"])
		if(budget > 0)
			budget2change(budget, usr)
			budget = 0
	if(href_list["changecat"])
		current_cat = href_list["changecat"]
	if(href_list["secrets"])
		var/list/options = list()
		if(upgrade_flags & UPGRADE_NOTAX)
			options += "Enable Paying Taxes"
		else
			options += "Stop Paying Taxes"
		var/select = input(usr, "Please select an option.", "", null) as null|anything in options
		if(!select)
			return
		if(!usr.default_can_use_topic(src) || locked)
			return
		switch(select)
			if("Enable Paying Taxes")
				upgrade_flags &= ~UPGRADE_NOTAX
				playsound(loc, 'sound/misc/gold_misc.ogg', 100, FALSE, -1)
			if("Stop Paying Taxes")
				upgrade_flags |= UPGRADE_NOTAX
				playsound(loc, 'sound/misc/gold_misc.ogg', 100, FALSE, -1)
				playsound(loc, 'sound/misc/gold_license.ogg', 100, FALSE, -1)
	return attack_hand(usr)

/obj/structure/fake_machine/bathvend/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(!ishuman(user))
		return
	if(locked)
		to_chat(user, span_warning("It's locked. Of course."))
		return
	user.changeNext_move(CLICK_CD_MELEE)
	playsound(loc, 'sound/misc/gold_menu.ogg', 100, FALSE, -1)
	var/canread = user.can_read(src, TRUE)
	var/contents
	contents = "<center>BRASSFACE - Sweet Dreams for Cheap<BR>"
	contents += "<a href='?src=[REF(src)];change=1'>MAMMON LOADED:</a> [budget]<BR>"

	var/mob/living/carbon/human/H = user
	if(H.job in list("Nightmaster","Nightswain"))
		if(canread)
			contents += "<a href='?src=[REF(src)];secrets=1'>Secrets</a>"
		else
			contents += "<a href='?src=[REF(src)];secrets=1'>[stars("Secrets")]</a>"

	contents += "</center><BR>"

	if(current_cat == "1")
		contents += "<center>"
		for(var/X in categories)
			contents += "<a href='?src=[REF(src)];changecat=[X]'>[X]</a><BR>"
		contents += "</center>"
	else
		contents += "<center>[current_cat]<BR></center>"
		contents += "<center><a href='?src=[REF(src)];changecat=1'>\[RETURN\]</a><BR><BR></center>"
		var/list/pax = list()
		for(var/pack in SSmerchant.supply_packs)
			var/datum/supply_pack/PA = SSmerchant.supply_packs[pack]
			if(PA.group == current_cat)
				pax += PA
		for(var/datum/supply_pack/PA in sortNames(pax))
			var/costy = PA.cost
			if(!(upgrade_flags & UPGRADE_NOTAX))
				costy=round(costy+(SStreasury.tax_value * costy))
			contents += "[PA.name] [PA.contains.len > 1?"x[PA.contains.len]":""] - ([costy])<a href='?src=[REF(src)];buy=[PA.type]'>BUY</a><BR>"

	if(!canread)
		contents = stars(contents)

	var/datum/browser/popup = new(user, "VENDORTHING", "", 370, 600)
	popup.set_content(contents)
	popup.open()

/obj/structure/fake_machine/bathvend/obj_break(damage_flag)
	..()
	budget2change(budget)
	set_light(0)
	update_icon()
	icon_state = "goldvendor0"

/obj/structure/fake_machine/bathvend/Destroy()
	set_light(0)
	return ..()

/obj/structure/fake_machine/bathvend/Initialize()
	. = ..()
	update_icon()
//	held_items[/obj/item/reagent_containers/glass/bottle/wine] = list("PRICE" = rand(23,33),"NAME" = "vino")
//	held_items[/obj/item/dmusicbox] = list("PRICE" = rand(444,777),"NAME" = "Music Box")

#undef UPGRADE_NOTAX

SUBSYSTEM_DEF(BMtreasury)
	name = "BMtreasury"
	wait = 1
	priority = FIRE_PRIORITY_WATER_LEVEL
	var/treasury_value = 0
	var/multiple_item_penalty = 0.7
	var/interest_rate = 0.15 // Bit more interest, since it's gonna be much harder for the BMaster to get valuables.
	var/next_treasury_check = 0
	var/list/vault_accounting = list()

/datum/controller/subsystem/BMtreasury/proc/add_to_vault(var/obj/item/I)
	if(I.get_real_price() <= 0 || istype(I, /obj/item/coin))
		return
	if(I.type in vault_accounting)
		vault_accounting[I.type] *= multiple_item_penalty
	else
		vault_accounting[I.type] = I.get_real_price()
	return (vault_accounting[I.type]*interest_rate)

/datum/controller/subsystem/BMtreasury/fire(resumed = 0)
	set background=1
	if(world.time > next_treasury_check)
		next_treasury_check = world.time + rand(5 MINUTES, 8 MINUTES)
		vault_accounting = list()
		var/area/A = GLOB.areas_by_type[/area/rogue/outdoors/exposed/bath/vault]
		var/amt_to_generate = 0
		for(var/obj/item/I in A)
			if(!isturf(I.loc))
				continue
			amt_to_generate += add_to_vault(I)
		for(var/obj/structure/closet/C in A)
			for(var/obj/item/I in C.contents)
				amt_to_generate += add_to_vault(I)
		amt_to_generate = round(amt_to_generate)
		for(var/obj/structure/fake_machine/bathvend/brassface)
			brassface.budget += amt_to_generate // goes directly into BRASSFACE rather than into any account.
		send_ooc_note("Income from smuggling hoard to the BRASSFACE: +[amt_to_generate]", job = list("Nightmaster"))

/area/rogue/outdoors/exposed/bath/vault
	name = "Bathmaster vault"
	icon_state = "bathvault"
