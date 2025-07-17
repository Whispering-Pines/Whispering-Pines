/**
 * An element that deletes the casing when fired and, if reusable is true, adds the projectile_drop element to the bullet.
 * Just make sure to not add components or elements that also use COMSIG_FIRE_CASING after this one.
 * Not compatible with pellets (how the eff would that work in a senible way tho?).
 */
/datum/element/caseless
	element_flags = ELEMENT_BESPOKE
	argument_hash_start_idx = 2
	var/reusable = FALSE

/datum/element/caseless/Attach(datum/target, reusable = FALSE)
	. = ..()
	if(!isammocasing(target))
		return ELEMENT_INCOMPATIBLE
	src.reusable = reusable
	if (reusable)
		RegisterSignal(target, COMSIG_CASING_READY_PROJECTILE, PROC_REF(on_ready_projectile))
	RegisterSignal(target, COMSIG_FIRE_CASING, PROC_REF(on_fired_casing))

/datum/element/caseless/proc/on_ready_projectile(obj/item/ammo_casing/shell, atom/target, mob/living/user, quiet, zone_override, atom/fired_from)
	SIGNAL_HANDLER
	var/obj/projectile/proj = shell.loaded_projectile
	if(isnull(proj))
		return
	if(!ispath(proj.shrapnel_type))
		proj.shrapnel_type = shell.type
	proj.AddElement(/datum/element/projectile_drop, shell.type)

/datum/element/caseless/proc/on_fired_casing(obj/item/ammo_casing/shell, atom/target, mob/living/user, fired_from, randomspread, spread, zone_override, params, distro, obj/projectile/proj)
	SIGNAL_HANDLER

	if(isgun(fired_from))
		var/obj/item/gun/shot_from = fired_from
		if(shot_from.chambered == shell)
			shot_from.chambered = null //Nuke it. Nuke it now.
	QDEL_NULL(shell)

// .310 Strilka (Sakhno Rifle)

/obj/item/ammo_casing/strilka310
	name = ".310 Strilka bullet casing"
	desc = "A .310 Strilka bullet casing. Casing is a bit of a fib, there is no case, it's just a block of red powder."
	icon_state = "310-casing"
	caliber = CALIBER_STRILKA310
	projectile_type = /obj/projectile/bullet/strilka310

/obj/item/ammo_casing/strilka310/Initialize(mapload)
	. = ..()

	AddElement(/datum/element/caseless)

/obj/item/ammo_casing/strilka310/surplus
	name = ".310 Strilka surplus bullet casing"
	desc = "A surplus .310 Strilka bullet casing. Casing is a bit of a fib, there is no case, it's just a block of red powder. Damp red powder at that."
	projectile_type = /obj/projectile/bullet/strilka310/surplus

/obj/item/ammo_casing/strilka310/enchanted
	projectile_type = /obj/projectile/bullet/strilka310/enchanted

/obj/item/ammo_casing/strilka310/phasic
	name = ".310 Strilka phasic bullet casing"
	desc = "A phasic .310 Strilka bullet casing. "
	projectile_type = /obj/projectile/bullet/strilka310/phasic
// .223 (M-90gl Carbine)

/obj/item/ammo_casing/a223
	name = ".223 bullet casing"
	desc = "A .223 bullet casing."
	caliber = CALIBER_A223
	projectile_type = /obj/projectile/bullet/a223

/obj/item/ammo_casing/a223/phasic
	name = ".223 phasic bullet casing"
	desc = "A .223 phasic bullet casing."
	projectile_type = /obj/projectile/bullet/a223/phasic

/obj/item/ammo_casing/a223/weak
	projectile_type = /obj/projectile/bullet/a223/weak

// 40mm (Grenade Launcher)

/obj/item/ammo_casing/a40mm
	name = "40mm HE shell"
	desc = "A cased high explosive grenade that can only be activated once fired out of a grenade launcher."
	caliber = CALIBER_40MM
	icon_state = "40mmHE"
	projectile_type = /obj/projectile/bullet/a40mm
	newtonian_force = 1.25

/obj/item/ammo_casing/a40mm/rubber
	name = "40mm rubber shell"
	desc = "A cased rubber slug. The big brother of the beanbag slug, this thing will knock someone out in one. Doesn't do so great against anyone in armor."
	projectile_type = /obj/projectile/bullet/shotgun_beanbag/a40mm
