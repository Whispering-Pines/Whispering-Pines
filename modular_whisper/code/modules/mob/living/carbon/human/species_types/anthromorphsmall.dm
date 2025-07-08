/mob/living/carbon/human/species/anthromorphsmall
	race = /datum/species/anthromorphsmall

/datum/species/anthromorphsmall
	name = "Verminvolk"
	id = "anthromorphsmall"
	desc = "A race akin to wild-kin, except afflicted with significantly smaller stature. A bit less respected than their kin due to their closer resemblance to vermin, like the dichotomy between Kobold and Sissean.<br>"
	default_color = "444"
	skin_tone_wording = "Color"
	use_skintones = TRUE
	species_traits = list(
		MUTCOLORS,
		EYECOLOR,
		LIPS,
		HAIR,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	inherent_traits = list(TRAIT_NOMOBSWAP)
	changesource_flags = WABBAJACK
	possible_ages = NORMAL_AGES_LIST_CHILD
	limbs_icon_m = 'icons/mob/species/anthro_small_femalea.dmi'
	limbs_icon_f = 'icons/mob/species/anthro_small_femalea.dmi'
	dam_icon_m = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	soundpack_m = /datum/voicepack/male/elf
	soundpack_f = /datum/voicepack/female/elf
	custom_id = "dwarf"
	custom_clothes = TRUE

	swap_male_clothes = TRUE
	offset_features_f = list(
		OFFSET_RING = list(0,-4),\
		OFFSET_GLOVES = list(0,0),\
		OFFSET_WRISTS = list(0,0),\
		OFFSET_HANDS = list(0,-4),\
		OFFSET_CLOAK = list(0,0),\
		OFFSET_FACEMASK = list(0,-5),\
		OFFSET_HEAD = list(0,-5),\
		OFFSET_FACE = list(0,-5),\
		OFFSET_BELT = list(0,0),\
		OFFSET_BACK = list(0,-5),\
		OFFSET_NECK = list(0,-5),\
		OFFSET_MOUTH = list(0,-5),\
		OFFSET_PANTS = list(0,0),\
		OFFSET_SHIRT = list(0,0),\
		OFFSET_ARMOR = list(0,0),\
		OFFSET_UNDIES = list(0,0),\
		OFFSET_BUTT = list(0,-4),\
	)
	specstats_m = list(STATKEY_STR = -2, STATKEY_PER = 1, STATKEY_INT = 0, STATKEY_CON = -1, STATKEY_END = 1, STATKEY_SPD = 2, STATKEY_LCK = 0)
	specstats_f = list(STATKEY_STR = -2, STATKEY_PER = 1, STATKEY_INT = 0, STATKEY_CON = -1, STATKEY_END = 1, STATKEY_SPD = 2, STATKEY_LCK = 0)
	enflamed_icon = "widefire"
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue/wild_tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_GUTS = /obj/item/organ/filling_organ/guts,
		)
	bodypart_features = list(
		/datum/bodypart_feature/hair/head,
		/datum/bodypart_feature/hair/facial,
	)
	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/bodypart_feature/underwear,
		/datum/customizer/organ/tail/anthro,
		/datum/customizer/organ/tail_feature/anthro,
		/datum/customizer/organ/snout/anthrosmall,
		/datum/customizer/organ/ears/anthro,
		/datum/customizer/organ/horns/anthro,
		/datum/customizer/organ/frills/anthro,
		/datum/customizer/organ/wings/anthro,
		/datum/customizer/organ/neck_feature/anthro,
		/datum/customizer/organ/testicles/anthro,
		/datum/customizer/organ/penis/anthro,
		/datum/customizer/organ/breasts/animal,
		/datum/customizer/organ/vagina/anthro,
		/datum/customizer/organ/belly/animal,
		/datum/customizer/organ/butt/animal
		)
	body_marking_sets = list(
		/datum/body_marking_set/none,
	)
	body_markings = list(
		/datum/body_marking/flushed_cheeks,
		/datum/body_marking/eyeliner,
		/datum/body_marking/small/plain,
		/datum/body_marking/small/sock,
		/datum/body_marking/small/socklonger,
		/datum/body_marking/small/tips,
		/datum/body_marking/small/belly,
		/datum/body_marking/small/bellyslim,
		/datum/body_marking/small/butt,
		/datum/body_marking/small/tie,
		/datum/body_marking/small/tiesmall,
		/datum/body_marking/small/backspots,
		/datum/body_marking/small/front,
		/datum/body_marking/small/spotted,
		/datum/body_marking/small/nose,
	)
	descriptor_choices = list(
		/datum/descriptor_choice/height,
		/datum/descriptor_choice/body,
		/datum/descriptor_choice/stature,
		/datum/descriptor_choice/face,
		/datum/descriptor_choice/face_exp,
		/datum/descriptor_choice/skin_all,
		/datum/descriptor_choice/voice,
		/datum/descriptor_choice/prominent_one_wild,
		/datum/descriptor_choice/prominent_two_wild,
		/datum/descriptor_choice/prominent_three_wild,
		/datum/descriptor_choice/prominent_four_wild,
	)

	exotic_bloodtype = /datum/blood_type/human/anthrosmall
	meat = /obj/item/reagent_containers/food/snacks/meat/steak/human

/datum/blood_type/human/anthrosmall
	name = "Verminvolk"
	compatible_types = list(
		/datum/blood_type/human/o_minus,
	)
	reagent_type = /datum/reagent/blood
	contains_lux = TRUE


/datum/species/anthromorphsmall/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.grant_language(/datum/language/common)
	C.grant_language(/datum/language/beast)

/datum/species/anthromorphsmall/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.remove_language(/datum/language/common)
	C.remove_language(/datum/language/beast)

/datum/species/anthromorphsmall/check_roundstart_eligible()
	return TRUE

/datum/species/anthromorphsmall/qualifies_for_rank(rank, list/features)
	return TRUE
