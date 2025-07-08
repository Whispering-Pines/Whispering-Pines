/mob/living/carbon/human/species/akula
	race = /datum/species/akula

/datum/species/akula
	name = "Axian"
	id = "akula"
	desc = "<b>Axian</b><br>\
	Axians are a proud, shark-like people that have a heritage founded in maritime trade, \
	tax evasion, and piracy. They have a strong distaste for the nobility and taxation, \
	making them a target of discrimination in the Blackmoorian lands. They are oftentimes scapegoats for crime. \
	Due to their penchant for trade and travel, they can be found all over the world, oftentimes \
	seeing places many could not even dream of. They look down at those they considered the 'settled' \
	and often uproot themselves quite often in their lifetimes. However, due to the isolation in Blackmoor, many Axians \
	find their sanity being clawed away as they find themselves stuck in one place.<br>\
	(+1 Constitution, +1 Endurance)"
	species_traits = list(EYECOLOR,LIPS,STUBBLE,MUTCOLORS)
	default_color = "444"
	skin_tone_wording = "Color"
	use_skintones = TRUE
	inherent_traits = list(TRAIT_WATER_BREATHING,TRAIT_GOOD_SWIM, TRAIT_SEA_DRINKER)
	inherent_traits = list(TRAIT_NOMOBSWAP)
	possible_ages = NORMAL_AGES_LIST_CHILD
	changesource_flags = WABBAJACK
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mta.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fma.dmi'
	dam_icon_m = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
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
	specstats_m = list(STATKEY_STR = 0, STATKEY_PER = -1, STATKEY_INT = 0, STATKEY_CON = 1, STATKEY_END = 1, STATKEY_SPD = 0, STATKEY_LCK = 0)
	specstats_f = list(STATKEY_STR = 0, STATKEY_PER = -1, STATKEY_INT = 0, STATKEY_CON = 1, STATKEY_END = 1, STATKEY_SPD = 0, STATKEY_LCK = 0)
	enflamed_icon = "widefire"
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears/akula,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_TAIL = /obj/item/organ/tail/akula,
		ORGAN_SLOT_SNOUT = /obj/item/organ/snout/akula,
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
		/datum/customizer/organ/snout/akula,
		/datum/customizer/organ/tail/axian,
		/datum/customizer/organ/ears/axian,
		/datum/customizer/organ/testicles/anthro,
		/datum/customizer/organ/penis/anthro,
		/datum/customizer/organ/breasts/human,
		/datum/customizer/organ/vagina/human_anthro,
		/datum/customizer/organ/belly/animal,
		/datum/customizer/organ/butt/animal
		)
	body_marking_sets = list(
		/datum/body_marking_set/none,
		/datum/body_marking_set/belly,
	)
	body_markings = list(
		/datum/body_marking/flushed_cheeks,
		/datum/body_marking/eyeliner,
		/datum/body_marking/belly,
		/datum/body_marking/bellyslim,
		/datum/body_marking/butt,
		/datum/body_marking/tonage,
		/datum/body_marking/tiger/dark,
		/datum/body_marking/nose,
	)
	descriptor_choices = list(
		/datum/descriptor_choice/height,
		/datum/descriptor_choice/body,
		/datum/descriptor_choice/stature,
		/datum/descriptor_choice/face,
		/datum/descriptor_choice/face_exp,
		/datum/descriptor_choice/scales,
		/datum/descriptor_choice/voice,
		/datum/descriptor_choice/prominent_one,
		/datum/descriptor_choice/prominent_two,
		/datum/descriptor_choice/prominent_three,
		/datum/descriptor_choice/prominent_four,
	)

/datum/species/akula/check_roundstart_eligible()
	return TRUE

/datum/species/akula/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/akula/random_name(gender,unique,lastname)
	var/randname
	if(gender == MALE)
		randname = pick(world.file2list("strings/names/roguetown/axianmale.txt"))
	if(gender == FEMALE)
		randname = pick(world.file2list("strings/names/roguetown/axianfemale.txt"))
	if(prob(33))
		//Prefix
		var/prefix = pick(world.file2list("strings/names/roguetown/axianprefix.txt"))
		randname = "[prefix] [randname]"
	else
		//Suffix
		var/suffix = pick(world.file2list("strings/names/roguetown/axiansuffix.txt"))
		randname = "[randname] [suffix]"
	return randname

/datum/species/akula/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/datum/species/akula/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
