//fucking annoying -vide
//cock and ball torture from wikipedie the free encylopedia https://www.youtube.com/watch?v=nOPIu7isD3s
/datum/sprite_accessory/penis
	icon = 'modular_stonehedge/icons/mob/sprite_accessory/genitals/penis.dmi'
	relevant_layers = list(BODY_BEHIND_LAYER,BODY_FRONT_FRONT_FRONT_LAYER)

/datum/sprite_accessory/penis/adjust_appearance_list(list/appearance_list, obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	generic_gender_feature_adjust(appearance_list, organ, bodypart, owner, OFFSET_BELT)

/datum/sprite_accessory/penis/get_icon_state(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	var/obj/item/organ/penis/pp = organ
	if(pp.sheath_type != SHEATH_TYPE_NONE && pp.erect_state != ERECT_STATE_HARD)
		switch(pp.sheath_type)
			if(SHEATH_TYPE_NORMAL)
				if(pp.erect_state == ERECT_STATE_NONE)
					return "sheath_1"
				else
					return "sheath_2"
			if(SHEATH_TYPE_SLIT)
				if(pp.erect_state == ERECT_STATE_NONE)
					return "slit_1"
				else
					return "slit_2"
	if(pp.erect_state == ERECT_STATE_HARD)
		return "penis_[icon_state]_[pp.organ_size]_1"
	else
		return "penis_[icon_state]_[pp.organ_size]_0"

/datum/sprite_accessory/penis/is_visible(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/human/owner)
	if(!organ.visible_organ)
		return FALSE
	if(owner.age == AGE_CHILD)
		return FALSE
	return is_human_part_visible(owner, HIDEJUMPSUIT|HIDECROTCH)

/datum/sprite_accessory/penis/human
	icon_state = "human"
	name = "Plain"
	color_key_defaults = list(KEY_CHEST_COLOR, KEY_CHEST_COLOR)

/datum/sprite_accessory/penis/thick
	icon_state = "thick"
	name = "Thick"
	color_key_defaults = list(KEY_CHEST_COLOR, KEY_CHEST_COLOR)

/datum/sprite_accessory/penis/knotted
	icon_state = "knotted"
	name = "Knotted"
	color_key_defaults = list(null, KEY_CHEST_COLOR)
	default_colors = list("C52828", null)

/datum/sprite_accessory/penis/flared
	icon_state = "flared"
	name = "Flared"
	color_key_defaults = list(KEY_CHEST_COLOR, KEY_CHEST_COLOR)

/datum/sprite_accessory/penis/barbknot
	icon_state = "barbknot"
	name = "Barbed, Knotted"
	color_key_defaults = list(null, KEY_CHEST_COLOR)
	default_colors = list("C52828", null)

/datum/sprite_accessory/penis/tapered
	icon_state = "tapered"
	name = "Tapered"
	default_colors = list("C52828", "C52828")

/datum/sprite_accessory/penis/tapered_mammal
	icon_state = "tapered"
	name = "Tapered"
	color_key_defaults = list(null, KEY_CHEST_COLOR)
	default_colors = list("C52828", null)

/datum/sprite_accessory/penis/tentacle
	icon_state = "tentacle"
	name = "Tentacled"
	default_colors = list("C52828", "C52828")

/datum/sprite_accessory/penis/hemi
	icon_state = "hemi"
	name = "Hemi"
	default_colors = list("C52828", "C52828")

/datum/sprite_accessory/penis/hemiknot
	icon_state = "hemiknot"
	name = "Knotted Hemi"
	default_colors = list("C52828", "C52828")

/datum/sprite_accessory/testicles
	icon = 'modular_stonehedge/icons/mob/sprite_accessory/genitals/testicles.dmi'
	color_key_name = "Sack"
	relevant_layers = list(BODY_BEHIND_LAYER,BODY_FRONT_FRONT_LAYER)

/datum/sprite_accessory/testicles/adjust_appearance_list(list/appearance_list, obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	generic_gender_feature_adjust(appearance_list, organ, bodypart, owner, OFFSET_SHIRT)

/datum/sprite_accessory/testicles/get_icon_state(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	return "[icon_state]_[organ.organ_size]"

/datum/sprite_accessory/testicles/is_visible(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/human/owner)
	if(!organ.visible_organ)
		return FALSE
	if(owner.age == AGE_CHILD)
		return FALSE
	return is_human_part_visible(owner, HIDEJUMPSUIT|HIDECROTCH)

/datum/sprite_accessory/testicles/pair
	name = "Pair"
	icon_state = "pair"
	color_key_defaults = list(KEY_SKIN_COLOR)

/datum/sprite_accessory/breasts
	icon = 'modular_stonehedge/icons/mob/sprite_accessory/genitals/breasts.dmi'
	color_key_name = "Breasts"
	relevant_layers = list(BODY_BEHIND_LAYER,BODY_FFFFFRONT_LAYER)

/datum/sprite_accessory/breasts/get_icon_state(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	var/obj/item/organ/filling_organ/breasts/badonkers = organ
	return "[icon_state]_[badonkers.organ_size]"

/datum/sprite_accessory/breasts/adjust_appearance_list(list/appearance_list, obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	generic_gender_feature_adjust(appearance_list, organ, bodypart, owner, OFFSET_RING)

/datum/sprite_accessory/breasts/is_visible(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/human/owner)
	if(!organ.visible_organ)
		return FALSE
	update_nipple_overlay(organ, owner)
	return is_human_part_visible(owner, HIDEBOOB|HIDEJUMPSUIT)

/datum/sprite_accessory/breasts/proc/update_nipple_overlay(obj/item/organ/organ, mob/living/carbon/human/owner)
	if(!owner || !ishuman(owner))
		return
	owner.cut_overlay(owner.nipple_overlay)
	if(is_human_part_visible(owner, HIDEBOOB|HIDEJUMPSUIT))
		if(isresurgentis(owner))
			owner.nipple_overlay = mutable_appearance('modular_stonehedge/icons/mob/sprite_accessory/genitals/nipples.dmi', "pair_[organ.organ_size]_FRONT", BODY_FFFFFRONT_LAYER, EMISSIVE_LAYER_UNBLOCKABLE, 255, owner.get_hair_color()) //someone plz figure a way to put this behind fovs
		else
			owner.nipple_overlay = mutable_appearance('modular_stonehedge/icons/mob/sprite_accessory/genitals/nipples.dmi', "pair_[organ.organ_size]_FRONT", BODY_FFFFFRONT_LAYER, GAME_PLANE_FOV_HIDDEN, 100, "#ffa0a2ff") //low alpha so it merges with skin color
			owner.nipple_overlay.alpha = 100 //for some reason it isnt semi transparent anyway.
		owner.add_overlay(owner.nipple_overlay)

/datum/sprite_accessory/breasts/pair
	icon_state = "pair"
	name = "Pair"
	color_key_defaults = list(KEY_CHEST_COLOR)

/datum/sprite_accessory/breasts/quad
	icon_state = "quad"
	name = "Quad"
	color_key_defaults = list(KEY_CHEST_COLOR)

/datum/sprite_accessory/breasts/sextuple
	icon_state = "sextuple"
	name = "Sextuple"
	color_key_defaults = list(KEY_CHEST_COLOR)

/datum/sprite_accessory/vagina
	icon = 'modular_stonehedge/icons/mob/sprite_accessory/genitals/vagina.dmi'
	color_key_name = "Nethers"
	relevant_layers = list(BODY_FRONT_LAYER)

/datum/sprite_accessory/vagina/adjust_appearance_list(list/appearance_list, obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	generic_gender_feature_adjust(appearance_list, organ, bodypart, owner, OFFSET_BELT)

/datum/sprite_accessory/vagina/is_visible(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/human/owner)
	if(!organ.visible_organ)
		return FALSE
	if(owner.age == AGE_CHILD)
		return FALSE
	update_overlay(organ, owner)
	return is_human_part_visible(owner, HIDECROTCH|HIDEBUTT|HIDEJUMPSUIT)

/datum/sprite_accessory/vagina/proc/update_overlay(obj/item/organ/organ, mob/living/carbon/human/owner)
	if(!owner || !ishuman(owner))
		return
	owner.cut_overlay(owner.vag_overlay)
	if(is_human_part_visible(owner, HIDECROTCH|HIDEBUTT|HIDEJUMPSUIT))
		if(isresurgentis(owner))
			owner.vag_overlay = mutable_appearance('modular_stonehedge/icons/mob/sprite_accessory/genitals/vagina.dmi', "[icon_state]_FRONT", BODY_FRONT_LAYER, EMISSIVE_LAYER_UNBLOCKABLE, 255, owner.get_hair_color())
		owner.add_overlay(owner.vag_overlay)

/datum/sprite_accessory/vagina/human
	icon_state = "human"
	name = "Plain"
	default_colors = list("ea6767")

/datum/sprite_accessory/vagina/hairy
	icon_state = "hairy"
	name = "Hairy"
	color_key_name = "Pubes"
	use_static = FALSE
	color_key_defaults = list(KEY_HAIR_COLOR)

/datum/sprite_accessory/vagina/extrahairy
	icon_state = "extrahairy"
	name = "Extra Hairy"
	color_key_name = "Pubes"
	use_static = FALSE
	color_key_defaults = list(KEY_HAIR_COLOR)

/datum/sprite_accessory/vagina/spade
	icon_state = "spade"
	name = "Spade"
	default_colors = list("C52828")

/datum/sprite_accessory/vagina/furred
	icon_state = "furred"
	name = "Furred"
	color_key_defaults = list(KEY_MUT_COLOR_ONE)

/datum/sprite_accessory/vagina/gaping
	icon_state = "gaping"
	name = "Gaping"
	default_colors = list("f99696")

/datum/sprite_accessory/vagina/cloaca
	icon_state = "tentacle"
	name = "Tentacle"
	default_colors = list("f99696")

/datum/sprite_accessory/vagina/tentacle
	icon_state = "human"
	name = "Plain"
	color_key_defaults = list(KEY_MUT_COLOR_ONE)

//teeth pussy, nightmare fuel.
/datum/sprite_accessory/vagina/dentata
	icon_state = "dentata"
	name = "Dentata"

/datum/sprite_accessory/belly
	icon = 'modular_stonehedge/icons/mob/sprite_accessory/genitals/belly.dmi'
	color_key_name = "Belly"
	relevant_layers = list(BODY_BEHIND_LAYER,BODY_FFFFRONT_LAYER)

/datum/sprite_accessory/belly/get_icon_state(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	var/obj/item/organ/belly/belleh = organ
	return "belly_[icon_state]_[belleh.organ_size]"

/datum/sprite_accessory/belly/adjust_appearance_list(list/appearance_list, obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	generic_gender_feature_adjust(appearance_list, organ, bodypart, owner, OFFSET_BELT)

/datum/sprite_accessory/belly/is_visible(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	if(!organ.visible_organ)
		return FALSE
	/*if(owner.age == AGE_CHILD) I guess this isn't a nsfw organ..?
		return FALSE*/
	return is_human_part_visible(owner, HIDEBELLY|HIDEJUMPSUIT)

/datum/sprite_accessory/belly
	icon_state = "pair"
	name = "Belly"
	color_key_defaults = list(KEY_CHEST_COLOR)

/datum/sprite_accessory/butt
	icon = 'modular_stonehedge/icons/mob/sprite_accessory/genitals/butt.dmi'
	color_key_name = "Butt"
	relevant_layers = list(BODY_ADJ_LAYER)

/datum/sprite_accessory/butt/adjust_appearance_list(list/appearance_list, obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	if(!isdwarf(owner) && !isgoblinp(owner) && !iskobold(owner))
		generic_gender_feature_adjust(appearance_list, organ, bodypart, owner, OFFSET_PANTS)
	else
		generic_gender_feature_adjust(appearance_list, organ, bodypart, owner, OFFSET_BUTT)
/datum/sprite_accessory/butt/get_icon_state(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	var/obj/item/organ/butt/buttie = organ
	return "butt_[icon_state]_[buttie.organ_size]"

/datum/sprite_accessory/butt/is_visible(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/human/owner)
	if(!organ.visible_organ)
		return FALSE
	return is_human_part_visible(owner, HIDEJUMPSUIT|HIDEBUTT)

/datum/sprite_accessory/butt/pair
	name = "Pair"
	icon_state = "pair"
	color_key_defaults = list(KEY_SKIN_COLOR)
