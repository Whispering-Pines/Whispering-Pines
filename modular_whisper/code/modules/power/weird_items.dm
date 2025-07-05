/obj/item/balm
	name = "balm"
	desc = "Something that is used to preserve bodies for whatever reason, prevents rotting. It is single use."
	gender = PLURAL
	icon = 'modular_whisper/icons/obj/misc.dmi'
	icon_state = "balm"
	w_class = WEIGHT_CLASS_TINY
	item_flags = NOBLUDGEON
	throwforce = 0
	throw_speed = 1
	throw_range = 7

/obj/item/balm/attack(mob/living/carbon/human/target, mob/living/carbon/user)
	. = ..()
	user.changeNext_move(CLICK_CD_MELEE)
	if(!ishuman(target))
		to_chat(user, span_warning("I can only do this to humanoids."))
		return
	if(!do_after(user, 10 SECONDS, target))
		return
	to_chat(user, span_warning("I preserve [target]"))
	ADD_TRAIT(target, TRAIT_EMBALMED, TRAIT_GENERIC)
	qdel(src)
