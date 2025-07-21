/mob/living/carbon/human/species/plantoid
	race = /datum/species/plantoid

/datum/species/plantoid
	name = "Plantoid"
	id = SPEC_ID_PLANTOID
	desc = "Children of blissrose, extremely rare plantoids, or plantpeople as commonly called. \
	Are one in a million chance product of a plantperson mating and planting such seeds. \
	They are entirely made of plant matter and sustain themselves on sunlight, they lack organs but still have blood-like substance to maintain themselves and are easier to delimb due lack of bone. They are overall pretty stupid and unable to speak or comprehend languages, animalistic a tad. They need to eat meat as they can't consume plant matter... But they are satiated by sunlight aswell.<br><br>\
	Male of their kind is even rare-r."
	default_color = "#115b10"
	skin_tone_wording = "Color"
	use_skintones = TRUE
	species_traits = list(
		EYECOLOR,
		LIPS,
		HAIR,
		NOZOMBIE,
	)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	inherent_traits = list(TRAIT_NOMOBSWAP,TRAIT_APRICITY,TRAIT_SEEDKNOW,TRAIT_LANGUAGE_BARRIER,TRAIT_EASYDISMEMBER,TRAIT_TOXIMMUNE,TRAIT_NOBREATH,TRAIT_FLOWERFIELD_IMMUNITY)
	liked_food = MEAT
	disliked_food = GROSS | VEGETABLES
	changesource_flags = WABBAJACK
	possible_ages = NORMAL_AGES_LIST_CHILD
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mta.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fma.dmi'
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mta.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fma.dmi'
	soundpack_m = /datum/voicepack/male/elf
	soundpack_f = /datum/voicepack/female/elf

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
	specstats_m = list(STATKEY_STR = 0, STATKEY_PER = 0, STATKEY_INT = -3, STATKEY_CON = 1, STATKEY_END = 1, STATKEY_SPD = 0, STATKEY_LCK = 0)
	specstats_f = list(STATKEY_STR = 0, STATKEY_PER = 0, STATKEY_INT = -3, STATKEY_CON = 1, STATKEY_END = 1, STATKEY_SPD = 0, STATKEY_LCK = 0)
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

	exotic_bloodtype = /datum/blood_type/human/plant
	meat = /obj/item/natural/bundle/fibers/full

/datum/species/plantoid/spec_life(mob/living/carbon/human/H)
	. = ..()
	if(GLOB.tod == "day")
		var/area/cur_area = get_area(H)
		if(cur_area.outdoors)
			H.adjust_nutrition(2)

/datum/blood_type/human/plant
	name = "Plant"
	color = COLOR_CYAN
	compatible_types = list(
		/datum/blood_type/human/o_minus,
	)
	reagent_type = /datum/reagent/consumable/cum/plant //cum in your veins
	contains_lux = TRUE

/datum/species/plantoid/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/datum/species/plantoid/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)

/datum/species/plantoid/check_roundstart_eligible()
	return TRUE

/datum/species/plantoid/qualifies_for_rank(rank, list/features)
	return TRUE
