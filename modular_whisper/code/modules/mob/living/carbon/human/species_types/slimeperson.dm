/mob/living/carbon/human/species/slimeperson
	race = /datum/species/slimeperson

/datum/species/slimeperson
	name = "Slimeperson"
	id = "slimeperson"
	desc = "Strange living gelatinous things with human organs which gained a basic level of sentience... Such type of slimes are said to form using corpses, They have simple organs and a skeleton inside. They are quite fragile but may reattach their severed bits."
	default_color = "#115b10"
	skin_tone_wording = "Color"
	use_skintones = TRUE
	species_traits = list(
		EYECOLOR,
		LIPS,
		HAIR,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	inherent_traits = list(TRAIT_NOMOBSWAP,TRAIT_EASYDISMEMBER,TRAIT_NOLIMBDISABLE,TRAIT_LIMBATTACHMENT,TRAIT_CRITICAL_WEAKNESS, TRAIT_NOBREATH)
	changesource_flags = WABBAJACK
	possible_ages = NORMAL_AGES_LIST_CHILD
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mta.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fma.dmi'
	dam_icon_m = null
	dam_icon_f = null
	soundpack_m = /datum/voicepack/male
	soundpack_f = /datum/voicepack/female

	offset_features_m = list(
		OFFSET_RING = list(0,1),\
		OFFSET_GLOVES = list(0,1),\
		OFFSET_WRISTS = list(0,1),\
		OFFSET_HANDS = list(0,1),\
		OFFSET_CLOAK = list(0,1),\
		OFFSET_FACEMASK = list(0,1),\
		OFFSET_HEAD = list(0,1),\
		OFFSET_FACE = list(0,1),\
		OFFSET_BELT = list(0,1),\
		OFFSET_BACK = list(0,1),\
		OFFSET_NECK = list(0,1),\
		OFFSET_MOUTH = list(0,1),\
		OFFSET_PANTS = list(0,1),\
		OFFSET_SHIRT = list(0,1),\
		OFFSET_ARMOR = list(0,1),\
		OFFSET_UNDIES = list(0,1),\
	)

	offset_features_f = list(
		OFFSET_RING = list(0,-1),\
		OFFSET_GLOVES = list(0,0),\
		OFFSET_WRISTS = list(0,0),\
		OFFSET_HANDS = list(0,0),\
		OFFSET_CLOAK = list(0,0),\
		OFFSET_FACEMASK = list(0,-1),\
		OFFSET_HEAD = list(0,-1),\
		OFFSET_FACE = list(0,-1),\
		OFFSET_BELT = list(0,0),\
		OFFSET_BACK = list(0,-1),\
		OFFSET_NECK = list(0,-1),\
		OFFSET_MOUTH = list(0,-1),\
		OFFSET_PANTS = list(0,0),\
		OFFSET_SHIRT = list(0,0),\
		OFFSET_ARMOR = list(0,0),\
		OFFSET_UNDIES = list(0,0),\
	)
	specstats_m = list(STATKEY_STR = 0, STATKEY_PER = 0, STATKEY_INT = -1, STATKEY_CON = 1, STATKEY_END = 0, STATKEY_SPD = -1, STATKEY_LCK = 0)
	specstats_f = list(STATKEY_STR = 0, STATKEY_PER = 0, STATKEY_INT = -1, STATKEY_CON = 1, STATKEY_END = 0, STATKEY_SPD = -1, STATKEY_LCK = 0)
	enflamed_icon = "widefire"
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
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
		/datum/customizer/organ/testicles/human,
		/datum/customizer/organ/penis/human,
		/datum/customizer/organ/breasts/human,
		/datum/customizer/organ/vagina/human,
		/datum/customizer/organ/belly/human,
		/datum/customizer/organ/butt/human
		)

	exotic_bloodtype = /datum/blood_type/human/slime
	meat = /obj/item/reagent_containers/food/snacks/meat/strange


/datum/blood_type/human/slime
	name = "Slime"
	color = COLOR_CYAN
	compatible_types = list(
		/datum/blood_type/human/o_minus,
	)
	reagent_type = /datum/reagent/toxin //not good for homan
	contains_lux = TRUE

/datum/species/slimeperson/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.grant_language(/datum/language/common)

/datum/species/slimeperson/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.remove_language(/datum/language/common)

/datum/species/slimeperson/check_roundstart_eligible()
	return TRUE

/datum/species/slimeperson/qualifies_for_rank(rank, list/features)
	return TRUE
