/datum/sprite_accessory/eyes
	abstract_type = /datum/sprite_accessory/eyes
	color_keys = 2
	color_key_names = list("First Eye", "Second Eye")
	icon = 'icons/mob/sprite_accessory/eyes/eyes.dmi'

/datum/sprite_accessory/eyes/is_visible(obj/item/organ/organ, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	if(!owner)
		return
	if(NOEYESPRITES in owner.dna?.species?.species_traits)
		return FALSE
	update_overlay(organ, owner)
	return is_human_part_visible(owner, HIDEEYES)

/datum/sprite_accessory/eyes/adjust_appearance_list(list/appearance_list, obj/item/organ/eyes/eyes, obj/item/bodypart/bodypart, mob/living/carbon/owner)
	generic_gender_feature_adjust(appearance_list, eyes, bodypart, owner, OFFSET_FACE)

/datum/sprite_accessory/eyes/proc/update_overlay(obj/item/organ/eyes/organ, mob/living/carbon/human/owner)
	if(!owner || !ishuman(owner) || !owner.client)
		return
	owner.cut_overlay(owner.eye_overlay)
	owner.cut_overlay(owner.eye_overlay2)
	//ways to hide your glowing ass eyes
	if(owner.wear_mask && owner.wear_mask.flags_cover & MASKCOVERSEYES)
		return
	if(owner.name == "Unknown" || owner.name == "Unknown Man" || owner.name == "Unknown Woman")
		return
	if(is_human_part_visible(owner, HIDEEYES) && organ.glows) //hideface so people can hide their glowy ass eyes with a mask etc.
		owner.eye_overlay = mutable_appearance(icon, "human_glow_1", MOUTH_LAYER, EMISSIVE_LAYER_UNBLOCKABLE, 255, owner.client.prefs.get_eye_color())
		owner.eye_overlay2 = mutable_appearance(icon, "human_glow_2", MOUTH_LAYER, EMISSIVE_LAYER_UNBLOCKABLE, 255, owner.client.prefs.get_eye_second_color())
		if(owner.eye_overlay && owner.eye_overlay2)
			var/use_female_sprites = FALSE
			if(owner.dna.species?.sexes)
				if(owner.gender == FEMALE && !owner.dna.species.swap_female_clothes || owner.gender == MALE && owner.dna.species.swap_male_clothes)
					use_female_sprites = FEMALE_SPRITES
			var/list/offsets
			if(use_female_sprites)
				offsets = owner.dna.species.offset_features_f
			else
				offsets = owner.dna.species.offset_features_m

			if(LAZYACCESS(offsets, OFFSET_FACE))
				owner.eye_overlay.pixel_x += offsets[OFFSET_FACE][1]
				owner.eye_overlay.pixel_y += offsets[OFFSET_FACE][2]
				owner.eye_overlay2.pixel_x += offsets[OFFSET_FACE][1]
				owner.eye_overlay2.pixel_y += offsets[OFFSET_FACE][2]
			owner.add_overlay(owner.eye_overlay)
			owner.add_overlay(owner.eye_overlay2)

/datum/sprite_accessory/eyes/moth
	name = "Fluvian Eyes"
	icon_state = "moth"

/datum/sprite_accessory/eyes/humanoid
	name = "Humanoid Eyes"
	icon_state = "human"

/datum/sprite_accessory/eyes/humanoid/kobold
	name = "Kobold Eyes"
	icon_state = "kobold"

/datum/sprite_accessory/eyes/humanoid/triton
	name = "Triton Eyes"
	icon_state = "triton"
	use_static = TRUE

/datum/sprite_accessory/eyes/humanoid_glow
	name = "Humanoid Glowing"
	icon_state = "human_glow"

/datum/sprite_accessory/eyes/humanoid_cyber
	name = "Humanoid Cyber"
	icon_state = "human_cyber"
