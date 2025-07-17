//renamed type of revolver so it dont interfere with other stuff preexisting in the code.
/obj/item/gun/ballistic/revolver
	name = "\improper .357 revolver"
	desc = "A suspicious revolver. Uses .357 ammo."
	icon_state = "revolver"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/cylinder
	fire_sound = 'modular_whisper/sound/items/weapons/gun/revolver/shot_alt.ogg'
	load_sound = 'modular_whisper/sound/items/weapons/gun/revolver/load_bullet.ogg'
	eject_sound = 'modular_whisper/sound/items/weapons/gun/revolver/empty.ogg'
	fire_sound_volume = 90
	dry_fire_sound = 'modular_whisper/sound/items/weapons/gun/revolver/dry_fire.ogg'
	casing_ejector = FALSE
	internal_magazine = TRUE
	bolt_type = BOLT_TYPE_NO_BOLT
	tac_reloads = FALSE
	var/spin_delay = 10
	var/recent_spin = 0
	var/last_fire = 0

/obj/item/gun/ballistic/revolver/process_fire(atom/target, mob/living/user, message, params, zone_override, bonus_spread)
	. = ..()
	if(.)
		last_fire = world.time

/obj/item/gun/ballistic/revolver/chamber_round(spin_cylinder = TRUE, replace_new_round)
	if(!magazine) //if it mag was qdel'd somehow.
		CRASH("revolver tried to chamber a round without a magazine!")
	if(chambered)
		UnregisterSignal(chambered, COMSIG_MOVABLE_MOVED)
	if (spin_cylinder)
		chambered = magazine.get_round()
	else
		chambered = magazine.stored_ammo[1]
		if (ispath(chambered))
			chambered = new chambered(src)
			magazine.stored_ammo[1] = chambered
	if(chambered)
		RegisterSignal(chambered, COMSIG_MOVABLE_MOVED, PROC_REF(clear_chambered))

/obj/item/gun/ballistic/revolver/shoot_with_empty_chamber(mob/living/user as mob|obj)
	..()
	chamber_round()

/obj/item/gun/ballistic/revolver/AltClick(mob/user)
	spin()
	return TRUE

/obj/item/gun/ballistic/revolver/fire_sounds()
	var/frequency_to_use = sin((90/magazine?.max_ammo) * get_ammo(TRUE, FALSE)) // fucking REVOLVERS
	var/click_frequency_to_use = 1 - frequency_to_use * 0.75
	var/play_click = sqrt(magazine?.max_ammo) > get_ammo(TRUE, FALSE)
	if(suppressed)
		playsound(src, suppressed_sound, suppressed_volume, vary_fire_sound, ignore_walls = FALSE, extrarange = SILENCED_SOUND_EXTRARANGE, falloff_distance = 0)
		if(play_click)
			playsound(src, 'modular_whisper/sound/items/weapons/gun/general/ballistic_click.ogg', suppressed_volume, vary_fire_sound, ignore_walls = FALSE, extrarange = SILENCED_SOUND_EXTRARANGE, falloff_distance = 0, frequency = click_frequency_to_use)
	else
		playsound(src, fire_sound, fire_sound_volume, vary_fire_sound)
		if(play_click)
			playsound(src, 'modular_whisper/sound/items/weapons/gun/general/ballistic_click.ogg', fire_sound_volume, vary_fire_sound, frequency = click_frequency_to_use)

/obj/item/gun/ballistic/revolver/verb/spin()
	set name = "Spin Chamber"
	set category = "Object"
	set desc = "Click to spin your revolver's chamber."

	var/mob/user = usr

	if(user.stat || !in_range(user, src))
		return

	if (recent_spin > world.time)
		return
	recent_spin = world.time + spin_delay

	if(do_spin())
		playsound(usr, pick('modular_whisper/sound/items/weapons/gun/revolver/spin1.ogg','modular_whisper/sound/items/weapons/gun/revolver/spin2.ogg','modular_whisper/sound/items/weapons/gun/revolver/spin3.ogg'), 30, FALSE)
		visible_message(span_notice("[user] spins [src]'s chamber."), span_notice("You spin [src]'s chamber."))
		balloon_alert(user, "chamber spun")
	else
		verbs -= /obj/item/gun/ballistic/revolver/verb/spin

/obj/item/gun/ballistic/revolver/proc/do_spin()
	var/obj/item/ammo_box/magazine/internal/cylinder/C = magazine
	. = istype(C)
	if(.)
		C.spin()
		chamber_round(spin_cylinder = FALSE)

/obj/item/gun/ballistic/revolver/get_ammo(countchambered = FALSE, countempties = TRUE)
	var/boolets = 0 //mature var names for mature people
	if (chambered && countchambered)
		boolets++
	if (magazine)
		boolets += magazine.ammo_count(countempties)
	return boolets

/obj/item/gun/ballistic/revolver/examine(mob/user)
	. = ..()
	var/live_ammo = get_ammo(FALSE, FALSE)
	. += "[live_ammo ? live_ammo : "None"] of those are live rounds."
	if (current_skin)
		. += span_notice("It can be spun with [EXAMINE_HINT("alt-click")].")

/obj/item/gun/ballistic/revolver/ignition_effect(atom/A, mob/user)
	if(last_fire && last_fire + 15 SECONDS > world.time)
		return span_rose("[user] touches the end of [src] to \the [A], using the residual heat to ignite it in a puff of smoke. What a badass.")

/obj/item/gun/ballistic/revolver/c38
	name = "\improper .38 revolver"
	desc = "A classic, if not outdated, lethal firearm. Uses .38 Special rounds."
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/cylinder/rev38
	icon_state = "c38"
	base_icon_state = "c38"
	fire_sound = 'modular_whisper/sound/items/weapons/gun/revolver/shot.ogg'

/obj/item/gun/ballistic/revolver/c38/detective
	name = "\improper Colt Detective Special"
	desc = "A classic, if not outdated, law enforcement firearm. Uses .38 Special rounds. \nSome spread rumors that if you loosen the barrel with a wrench, you can \"improve\" it."

	can_modify_ammo = TRUE
	initial_caliber = CALIBER_38
	initial_fire_sound = 'modular_whisper/sound/items/weapons/gun/revolver/shot.ogg'
	alternative_caliber = CALIBER_357
	alternative_fire_sound = 'modular_whisper/sound/items/weapons/gun/revolver/shot_alt.ogg'
	alternative_ammo_misfires = TRUE
	misfire_probability = 0
	misfire_percentage_increment = 25 //about 1 in 4 rounds, which increases rapidly every shot

/obj/item/gun/ballistic/revolver/badass
	name = "\improper Badass Revolver"
	desc = "A 7-chamber revolver manufactured by Waffle Corp to make their operatives feel Badass. Offers no tactical advantage whatsoever. Uses .357 ammo."
	icon_state = "revolversyndie"

/obj/item/gun/ballistic/revolver/cowboy
	desc = "A classic revolver, refurbished for modern use. Uses .357 ammo."
	//There's already a cowboy sprite in there!
	icon_state = "lucky"

/obj/item/gun/ballistic/revolver/mateba
	name = "\improper Unica 6 auto-revolver"
	desc = "A retro high-powered autorevolver typically used by officers of the New Russia military. Uses .357 ammo."
	icon_state = "mateba"

/obj/item/gun/ballistic/revolver/nagant
	name = "\improper Nagant revolver"
	desc = "An old model of revolver that originated in Russia. Able to be suppressed. Uses 7.62x38mmR ammo."
	icon_state = "nagant"
	can_suppress = TRUE

	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/cylinder/rev762
