/mob/living/carbon/human/species/goblinp
	race = /datum/species/goblinp

/datum/species/goblinp
	name = "Goblin"
	id = SPEC_ID_GOBLINPLAYER
	desc = "<b>Goblin</b><br>\
	A clever and stubborn nature are two charitable qualities of a goblin - scheming and selfish are less so. The Fell Gods use them as an avatar of malice, sending out \
	mindless, enthralled waves of the creatures to attack civilization from lunar portals. It leaves the typical goblinoid to cloister in their hidden away tribes, stealing \
	from the scraps out of fear of reprisal while shooing away outsiders. The cities of Man typically shun them, but it's not unheard of to see one pushing their luck in a \
	town square or out on a well-traveled road, as even the most backwater peasant can tell the difference between a sapient one and portal-spawn. Usually."
	species_traits = list(EYECOLOR,LIPS,STUBBLE)
	possible_ages = NORMAL_AGES_LIST
	use_skintones = TRUE
	skin_tone_wording = "Skin Color"
	limbs_icon_m = 'icons/mob/species/anthro_small_male.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fd.dmi'
	dam_icon_m = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	soundpack_m = /datum/voicepack/male/elf
	soundpack_f = /datum/voicepack/female/elf
	custom_clothes = TRUE
	swap_male_clothes = TRUE
	changesource_flags = WABBAJACK
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_GUTS = /obj/item/organ/filling_organ/guts,
		)
	offset_features_m = list(
		OFFSET_ID = list(0,-4), OFFSET_GLOVES = list(0,-4), OFFSET_WRISTS = list(0,-4),\
		OFFSET_CLOAK = list(0,0), OFFSET_FACEMASK = list(0,-5), OFFSET_HEAD = list(0,-4), \
		OFFSET_FACE = list(0,-5), OFFSET_BELT = list(0,-4), OFFSET_BACK = list(0,-4), \
		OFFSET_NECK = list(0,-4), OFFSET_MOUTH = list(0,-4), OFFSET_PANTS = list(0,0), \
		OFFSET_SHIRT = list(0,0), OFFSET_ARMOR = list(0,0), OFFSET_HANDS = list(0,-3), OFFSET_BUTT = list(0,-4),\ OFFSET_UNDIES = list(0,-4)
		)
	offset_features_f = list(
		OFFSET_ID = list(0,-5), OFFSET_GLOVES = list(0,-4), OFFSET_WRISTS = list(0,-4), OFFSET_HANDS = list(0,-4), \
		OFFSET_CLOAK = list(0,0), OFFSET_FACEMASK = list(0,-5), OFFSET_HEAD = list(0,-5), \
		OFFSET_FACE = list(0,-5), OFFSET_BELT = list(0,-4), OFFSET_BACK = list(0,-5), \
		OFFSET_NECK = list(0,-5), OFFSET_MOUTH = list(0,-5), OFFSET_PANTS = list(0,0), \
		OFFSET_SHIRT = list(0,0), OFFSET_ARMOR = list(0,0), OFFSET_BUTT = list(0,-4),\ OFFSET_UNDIES = list(0,-4)
		)
	inherent_traits = list(TRAIT_DARKVISION)
	specstats_m = list(STATKEY_STR = -1, STATKEY_PER = 0, STATKEY_INT = -1, STATKEY_CON = 0, STATKEY_END = 1, STATKEY_SPD = 1, STATKEY_LCK = 0)
	specstats_f = list(STATKEY_STR = -1, STATKEY_PER = 0, STATKEY_INT = -1, STATKEY_CON = 0, STATKEY_END = 1, STATKEY_SPD = 1, STATKEY_LCK = 0)
	enflamed_icon = "widefire"
	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/bodypart_feature/underwear,
		/datum/customizer/organ/testicles/anthro,
		/datum/customizer/organ/penis/anthro,
		/datum/customizer/organ/breasts/human,
		/datum/customizer/organ/vagina/human_anthro,
		/datum/customizer/organ/ears/goblin,
		/datum/customizer/organ/horns/tusks,
		/datum/customizer/organ/belly/human,
		/datum/customizer/organ/butt/human,
		)

	descriptor_choices = list(
		/datum/descriptor_choice/height,
		/datum/descriptor_choice/body,
		/datum/descriptor_choice/stature,
		/datum/descriptor_choice/face,
		/datum/descriptor_choice/face_exp,
		/datum/descriptor_choice/skin,
		/datum/descriptor_choice/voice,
		/datum/descriptor_choice/prominent_one_wild,
		/datum/descriptor_choice/prominent_two_wild,
		/datum/descriptor_choice/prominent_three_wild,
		/datum/descriptor_choice/prominent_four_wild,
	)

	exotic_bloodtype = /datum/blood_type/human/goblin
	meat = /obj/item/reagent_containers/food/snacks/meat/steak/human

/datum/blood_type/human/goblin
	name = "Goblin"
	compatible_types = list(
		/datum/blood_type/human/o_minus,
	)
	reagent_type = /datum/reagent/blood
	contains_lux = TRUE

/datum/species/goblinp/get_span_language(datum/language/message_language)
	if(!message_language)
		return
	if(message_language.type == /datum/language/orcish)
		return list(SPAN_ORC)
	return message_language.spans

/datum/species/goblinp/check_roundstart_eligible()
	return TRUE

/datum/species/goblinp/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/goblinp/get_skin_list()
	return list(
		"Ochre" = SKIN_COLOR_OCHRE,
		"Meadow" = SKIN_COLOR_MEADOW,
		"Olive" = SKIN_COLOR_OLIVE,
		"Green" = SKIN_COLOR_GREEN,
		"Moss" = SKIN_COLOR_MOSS,
		"Taiga" = SKIN_COLOR_TAIGA,
		"Bronze" = SKIN_COLOR_BRONZE,
		"Red" = SKIN_COLOR_RED,
		"Frost" = SKIN_COLOR_FROST,
		"Abyss" = SKIN_COLOR_ABYSS,
		"Teal" = SKIN_COLOR_TEAL,
		"Hadal" = SKIN_COLOR_HADAL
	)

/datum/species/goblinp/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	C.cmode_music = 'sound/music/cmode/antag/combat_bandit2.ogg'
	RegisterSignal(C, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/datum/species/goblinp/on_species_loss(mob/living/carbon/C)
	. = ..()
	UnregisterSignal(C, COMSIG_MOB_SAY)
