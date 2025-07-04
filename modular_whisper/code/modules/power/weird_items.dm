/obj/item/balm
	name = "balm"
	desc = "Something that is used to preserve bodies for whatever reason, prevents rotting. It is single use."
	gender = PLURAL
	icon = 'modular_whisper/icons/obj/misc.dmi'
	icon_state = "soap"
	w_class = WEIGHT_CLASS_TINY
	item_flags = NOBLUDGEON
	throwforce = 0
	throw_speed = 1
	throw_range = 7

/obj/item/balm/attack(mob/living/carbon/human/target, mob/living/carbon/user)
	user.changeNext_move(CLICK_CD_MELEE)
