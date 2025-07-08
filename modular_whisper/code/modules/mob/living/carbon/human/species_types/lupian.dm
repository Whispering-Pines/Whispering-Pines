/mob/living/carbon/human/species/lupian
	race = /datum/species/lupian

/datum/species/lupian
	name = "Lupian"
	id = "lupian"
	desc = "Lupians are the sons and daughters of Lunaria. They are a volf-like people hailing from the Northern Regions of the world. \
	They are resilient, cunning and fight ready creachures capable of surviving the north thanks to their rugged pelts, \
	sharp teeth and deep-rooted spirit of community. They are very dutiful individuals and make fantastic and fearsome \
	warriors to those who earn their loyalty. Thanks to their pack minded nature they are slow to trust the other races \
	but form deep connections with those they do. In recent years they have been driven from the forests by unrest and pressed \
	into cohabitation with races they'd deem lesser.)"
	skin_tone_wording = "Pack"
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
	use_skintones = 1
	liked_food = GROSS | MEAT | FRIED
	changesource_flags = WABBAJACK
	possible_ages = NORMAL_AGES_LIST_CHILD
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
	specstats_m = list(STATKEY_STR = 0, STATKEY_PER = 0, STATKEY_INT = 1, STATKEY_CON = 0, STATKEY_END = 0, STATKEY_SPD = 0, STATKEY_LCK = 0)
	specstats_f = list(STATKEY_STR = 0, STATKEY_PER = 0, STATKEY_INT = 1, STATKEY_CON = 0, STATKEY_END = 0, STATKEY_SPD = 0, STATKEY_LCK = 0)
	enflamed_icon = "widefire"
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears/lupian,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue/wild_tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_TAIL = /obj/item/organ/tail/lupian,
		ORGAN_SLOT_SNOUT = /obj/item/organ/snout/lupian,
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
		/datum/customizer/organ/tail/lupian,
		/datum/customizer/organ/snout/lupian,
		/datum/customizer/organ/ears/lupian,
		/datum/customizer/organ/neck_feature/anthro,
		/datum/customizer/organ/testicles/anthro,
		/datum/customizer/organ/penis/anthro,
		/datum/customizer/organ/breasts/animal,
		/datum/customizer/organ/vagina/animal,
		/datum/customizer/organ/belly/animal,
		/datum/customizer/organ/butt/animal
		)
	body_marking_sets = list(
		/datum/body_marking_set/none,
		/datum/body_marking_set/belly,
		/datum/body_marking_set/bellysocks,
		/datum/body_marking_set/tiger,
		/datum/body_marking_set/tiger_dark,
	)
	body_markings = list(
		/datum/body_marking/flushed_cheeks,
		/datum/body_marking/eyeliner,
		/datum/body_marking/plain,
		/datum/body_marking/belly,
		/datum/body_marking/bellyslim,
		/datum/body_marking/butt,
		/datum/body_marking/sock,
		/datum/body_marking/socklonger,
		/datum/body_marking/tips,
		/datum/body_marking/backspots,
		/datum/body_marking/front,
		/datum/body_marking/tonage,
		/datum/body_marking/nose,
		/datum/body_marking/harlequin,
		/datum/body_marking/harlequinreversed,
	)
	descriptor_choices = list(
		/datum/descriptor_choice/height,
		/datum/descriptor_choice/body,
		/datum/descriptor_choice/stature,
		/datum/descriptor_choice/face,
		/datum/descriptor_choice/face_exp,
		/datum/descriptor_choice/fur,
		/datum/descriptor_choice/voice,
		/datum/descriptor_choice/prominent_one,
		/datum/descriptor_choice/prominent_two,
		/datum/descriptor_choice/prominent_three,
		/datum/descriptor_choice/prominent_four,
	)
	exotic_bloodtype = /datum/blood_type/human/lupian
	meat = /obj/item/reagent_containers/food/snacks/meat/steak/human

/datum/blood_type/human/lupian
	name = "Lupian"
	compatible_types = list(
		/datum/blood_type/human/o_minus,
	)
	reagent_type = /datum/reagent/blood
	contains_lux = TRUE


/datum/species/lupian/check_roundstart_eligible()
	return TRUE

/datum/species/lupian/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/lupian/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))
	C.grant_language(/datum/language/common)
	C.grant_language(/datum/language/beast)

/datum/species/lupian/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
	C.remove_language(/datum/language/common)
	C.remove_language(/datum/language/beast)

/datum/species/lupian/get_skin_list()
	return list(
		"Vakran" = "271f1b",
		"Lanarain" = "271f1c",
		"Frostfell" = "271f1d",
		"Varghelm" = "271f1e",
		"Dawnbreak" = "271f1f",
		"Bloodmoon" = "271f2a",
		"Felsaad" = "271f2b",
		"Hizmut" = "271f2c",
		"Langqan" = "271f2d",
		"a tangled lineage" = "271f2e",
		"disputed" = "271f2f",
		"bastardized" = "271f3a"
	) // This is a dirty hack that stops me using mob defines, the colors do not do anything, it just a var that relates to their pack name on examine
