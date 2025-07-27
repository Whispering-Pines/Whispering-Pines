/obj/structure/stairs/slope
	name = "stone slope"
	icon = 'modular_whisper/icons/obj/slopes.dmi'
	icon_state = "rocky"

/obj/item/ore/coal/charcoal
	grind_results = list(/datum/reagent/charcoal = 15)

/obj/item/ore/iron
	grind_results = list(/datum/reagent/iron = 15)

/obj/item/ingot/iron
	grind_results = list(/datum/reagent/iron = 15)

//grass into dirt
/turf/open/floor/grass/attack_hand_secondary(mob/user, params)
	. = ..()
	if(user.cmode)
		return
	visible_message(span_notice("[user] starts removing the patch of grass from the dirt."), span_notice("I start removing the patch of grass from the dirt."))
	if(do_after(user, 8 SECONDS, user))
		visible_message(span_notice("[user] cleared up the grass from the ground."), span_notice("I clear up the grass from the ground."))
		turf_destruction()

//make equip update eye glow, any other way didnt work, this barely works either.
/obj/item/equipped(mob/user, slot, initial)
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(post_equip), user, slot), 1.8 SECONDS)

/obj/item/proc/post_equip(mob/user, slot)
	SEND_SIGNAL(user, COMSIG_MOB_POST_EQUIP_ITEM, src, slot)

/mob/living/carbon/human/Initialize()
	. = ..()
	RegisterSignal(src, COMSIG_MOB_POST_EQUIP_ITEM, PROC_REF(update_eye_glow))

/mob/living/carbon/human/proc/update_eye_glow(datum/source)
	SIGNAL_HANDLER
	if(QDELETED(src))
		return
	if(!client)
		return
	if(!ishuman(src) || !client.prefs)
		return
	var/obj/item/organ/eyes/organ = getorganslot(ORGAN_SLOT_EYES)
	cut_overlay(eye_overlay)
	cut_overlay(eye_overlay2)
	if(!organ.glows)
		return
	//ways to hide your glowing ass eyes
	if(wear_mask && (wear_mask.flags_cover & MASKCOVERSEYES))
		return
	if(head && (head.flags_cover & HEADCOVERSEYES))
		return
	if(name == "Unknown" || name == "Unknown Man" || name == "Unknown Woman")
		return
	if(is_human_part_visible(src, HIDEEYES)) //hideface so people can hide their glowy ass eyes with a mask etc.
		eye_overlay = mutable_appearance('icons/mob/sprite_accessory/eyes/eyes.dmi', "human_glow_1", MOUTH_LAYER, EMISSIVE_LAYER_UNBLOCKABLE, 100, client.prefs.get_eye_color())
		eye_overlay2 = mutable_appearance('icons/mob/sprite_accessory/eyes/eyes.dmi', "human_glow_2", MOUTH_LAYER, EMISSIVE_LAYER_UNBLOCKABLE, 100, client.prefs.get_eye_second_color())
		if(eye_overlay || eye_overlay2)
			var/use_female_sprites = FALSE
			if(dna.species?.sexes)
				if(gender == FEMALE && !dna.species.swap_female_clothes || gender == MALE && dna.species.swap_male_clothes)
					use_female_sprites = FEMALE_SPRITES
			var/list/offsets
			if(use_female_sprites)
				offsets = dna.species.offset_features_f
			else
				offsets = dna.species.offset_features_m

			if(LAZYACCESS(offsets, OFFSET_FACE))
				eye_overlay.pixel_x += offsets[OFFSET_FACE][1]
				eye_overlay.pixel_y += offsets[OFFSET_FACE][2]
				eye_overlay2.pixel_x += offsets[OFFSET_FACE][1]
				eye_overlay2.pixel_y += offsets[OFFSET_FACE][2]
			add_overlay(eye_overlay)
			add_overlay(eye_overlay2)
