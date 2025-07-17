/obj/item/firing_pin
	name = "electronic firing pin"
	desc = "A small authentication device, to be inserted into a firearm receiver to allow operation. NT safety regulations require all new designs to incorporate one."
	icon = 'modular_whisper/icons/obj/devices/gunmod.dmi'
	icon_state = "firing_pin"



	w_class = WEIGHT_CLASS_TINY
	attack_verb = list("pokes")

	var/fail_message = "invalid user!"
	/// Explode when user check is failed.
	var/selfdestruct = FALSE
	/// Can forcefully replace other pins.
	var/force_replace = FALSE
	/// Can be replaced by any pin.
	var/pin_hot_swappable = FALSE
	///Can be removed from the gun using tools or replaced by a pin with force_replace
	var/pin_removable = TRUE
	var/obj/item/gun/gun

/obj/item/firing_pin/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if(!isgun(interacting_with))
		return NONE

	var/obj/item/gun/targeted_gun = interacting_with
	var/obj/item/firing_pin/old_pin = targeted_gun.pin
	if(old_pin?.pin_removable && (force_replace || old_pin.pin_hot_swappable))
		if(Adjacent(user))
			user.put_in_hands(old_pin)
		else
			old_pin.forceMove(targeted_gun.drop_location())
		old_pin.gun_remove(user)

	if(!targeted_gun.pin)
		if(!user.temporarilyRemoveItemFromInventory(src))
			return .
		if(gun_insert(user, targeted_gun))
			if(old_pin)
				balloon_alert(user, "swapped firing pin")
			else
				balloon_alert(user, "inserted firing pin")
	else
		to_chat(user, span_notice("This firearm already has a firing pin installed."))

	return TRUE

/obj/item/firing_pin/proc/gun_insert(mob/living/user, obj/item/gun/new_gun)
	gun = new_gun
	forceMove(gun)
	gun.pin = src
	return TRUE

/obj/item/firing_pin/proc/gun_remove(mob/living/user)
	gun.pin = null
	gun = null
	return

/obj/item/firing_pin/proc/pin_auth(mob/living/user)
	return TRUE

/obj/item/firing_pin/proc/auth_fail(mob/living/user)
	if(user)
		balloon_alert(user, fail_message)
	if(selfdestruct)
		if(user)
			user.show_message("[span_danger("SELF-DESTRUCTING...")]<br>", MSG_VISUAL)
			to_chat(user, span_userdanger("[gun] explodes!"))
		explosion(src, devastation_range = -1, light_impact_range = 2, flash_range = 3)
		if(gun)
			qdel(gun)

// DNA-keyed pin.
// When you want to keep your toys for yourself.
/obj/item/firing_pin/dna
	name = "DNA-keyed firing pin"
	desc = "This is a DNA-locked firing pin which only authorizes one user. Attempt to fire once to DNA-link."
	icon_state = "firing_pin_dna"
	fail_message = "dna check failed!"
	var/unique_enzymes = null

/obj/item/firing_pin/dna/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	if(iscarbon(interacting_with))
		var/mob/living/carbon/M = interacting_with
		if(M.dna && M.dna.unique_enzymes)
			unique_enzymes = M.dna.unique_enzymes
			balloon_alert(user, "dna lock set")
			return TRUE
		return FALSE
	return ..()

/obj/item/firing_pin/dna/pin_auth(mob/living/carbon/user)
	if(user && user.dna && user.dna.unique_enzymes)
		if(user.dna.unique_enzymes == unique_enzymes)
			return TRUE
	return FALSE

/obj/item/firing_pin/dna/auth_fail(mob/living/carbon/user)
	if(!unique_enzymes)
		if(user && user.dna && user.dna.unique_enzymes)
			unique_enzymes = user.dna.unique_enzymes
			balloon_alert(user, "dna lock set")
	else
		..()

/obj/item/firing_pin/dna/dredd
	desc = "This is a DNA-locked firing pin which only authorizes one user. Attempt to fire once to DNA-link. It has a small explosive charge on it."
	selfdestruct = TRUE

/obj/item/firing_pin/Destroy()
	if(gun)
		gun.pin = null
		gun = null
	return ..()
