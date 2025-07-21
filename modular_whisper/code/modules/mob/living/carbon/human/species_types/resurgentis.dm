/mob/living/carbon/human/species/resurgentis
	race = /datum/species/human/resurgentis

/datum/species/human/resurgentis
	name = "Resurgentis"
	id = SPEC_ID_RESURGENTIS
	desc = "The children of Last Death. \
	\n\n\
	Resurgentis are descendants of their immortal 'Ancestor', The resurgentis semi undead Monarch, \
	who's said to be the creation of the Last Death himself, a semi living semi dead thing feeding on manflesh.  \
	Even if the Monarch is/was a rotting monstrosity, offsprings of it come out fine as blessed by Life, Solaria, (at sword point.) \
	\n\n\
	Resurgentis male are bulky, physically similiar to orcs except they are purple and not as lacking in intelligence, \
	While female are more agile and with more endurance. \
	Their behavior is more akin to humans, for parenting and overall if not for their high libido and short fuse. \
	Since their species are the natives of Phantom Kingdom and it's island, they have easier time here than most. \
	They can safely consume raw meat like their ancestor, though it is considered absolutely disgusting by their society and likely themselves.\
	Resurgentis generally have a hard time sneaking without proper coverage due their glowing eyes and hair, and their appetite is larger than most.\
	Resurgentis live about as long as any human, but their fertility is nearly as bad as elves, therefore their libido tends to be a saving point.\
	\n\n\
	-Essence-\
	White 'essence' resurgentis are the rarest of all, and are usually nobility or... premium slaves.\
	<bold>It is abominable to have a mixed essence color. It means your essence is murked, you are not pureblooded or are deformed</bold>.\
	Half-resurgentis are still fullblooded resurgentis due their oppressive genes, except with likely disabilities and murked essence,\
	still taking subtle physical traits of other species,\
	Older resurgentis' essence grows dimmer, as it's directly connected to their blood and wellbeing.\
	\n\n\
	Their cannibal immoral sort are called 'reapers', for their history is related to undeath and are similiar to vultures thanks to their ability to feed on corpses.\
	It is the most common slur towards all of Resurgentis kind.\
	\n\n\
	<i>(IF YOUR GLOWING BITS ARE EXPOSED THEY CAN BE SEEN THROUGH FOV BLOCKERS, I COULD NOT FIGURE A WAY AROUND. This is a coder cry for help.)</i>"

	species_traits = list(EYECOLOR, HAIR, FACEHAIR, LIPS, STUBBLE, OLDGREY)
	inherent_traits = list(TRAIT_NOMOBSWAP, TRAIT_ORGAN_EATER)

	use_skintones = 1

	possible_ages = NORMAL_AGES_LIST_CHILD
	changesource_flags = WABBAJACK

	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mt_muscular.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fm.dmi'

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

	//i guess more than usual stats for having major visibility disadvantage. (4)
	specstats_m = list(STATKEY_STR = 2, STATKEY_PER = 0, STATKEY_INT = 0, STATKEY_CON = 1, STATKEY_END = 0, STATKEY_SPD = -1, STATKEY_LCK = 0)
	specstats_f = list(STATKEY_STR = 1, STATKEY_PER = 0, STATKEY_INT = 0, STATKEY_CON = 0, STATKEY_END = 1, STATKEY_SPD = 1, STATKEY_LCK = 0)

	enflamed_icon = "widefire"

	exotic_bloodtype = /datum/blood_type/human/resurgentis
	meat = /obj/item/reagent_containers/food/snacks/meat/steak/human

	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid/nonatgradient,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/bodypart_feature/underwear,
		/datum/customizer/organ/testicles/human,
		/datum/customizer/organ/penis/human,
		/datum/customizer/organ/breasts/human,
		/datum/customizer/organ/vagina/human,
		/datum/customizer/organ/belly/human,
		/datum/customizer/organ/butt/human,
	)

	bodypart_features = list(
		/datum/bodypart_feature/hair/head,
		/datum/bodypart_feature/hair/facial,
	)

	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes/resurgentis,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_GUTS = /obj/item/organ/filling_organ/guts,
	)

	nutrition_mod = 1.5 // 150% higher hunger rate.

/datum/species/human/resurgentis/check_roundstart_eligible()
	return TRUE

/datum/species/human/resurgentis/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/human/resurgentis/get_skin_list()
	return list(
		"purple - pale" = "df78f9",
		"purple - sunless" = "ba67cf",
		"purple - lightish" = "9752a2",
		"purple" = "83458d",
		"purple - tanned" = "582560",
		"purple - scorched" = "4d1255"
	)

/datum/species/human/resurgentis/get_hairc_list()
	return sortList(list(
	"brown - dirt" = "785547",
	"red - anger" = "ff0000",
	"orange - fuzz" = "ff8c00",
	"yellow - bright" = "ffd000",
	"yellow - blonde" = "dab326",
	"green - sickly" = "bfff00",
	"green - maneater" = "458745",
	"green - venom" = "6aff00",
	"blue - ocean" = "001aff",
	"blue - pond" = "0088ff",
	"blue - chronos" = "00bfff",
	"blurple - crisis" = "5c26da",
	"purple - flower" = "b500b5",
	"pink - pop" = "cc00ff",
	"pink - candy" = "e88cff",
	"pink - strange" = "ff006a",
	"white - royalty" = "ffffff",
	))

/datum/species/human/resurgentis/get_oldhc_list()
	return sortList(list(
	"brown - dirt" = "624e46",
	"red - anger" = "7e0000",
	"orange - fuzz" = "9d5600",
	"yellow - bright" = "b79500",
	"yellow - blonde" = "886f16",
	"green - sickly" = "729703",
	"green - maneater" = "2d5a2d",
	"green - venom" = "265a00",
	"blue - ocean" = "000b6e",
	"blue - pond" = "004a8a",
	"blue - chronos" = "005e7d",
	"blurple - crisis" = "381883",
	"purple - flower" = "790279",
	"pink - pop" = "770195",
	"pink - candy" = "7d488a",
	"pink - strange" = "840037",
	"white - royalty" = "9a9a9a",
	))

//stuff for em
/obj/item/organ/eyes/resurgentis
	name = "resurgentis eyes"
	desc = ""
	see_in_dark = 3
	glows = TRUE
	lighting_alpha = LIGHTING_PLANE_ALPHA_NV_TRAIT

/datum/blood_type/human/resurgentis
	name = "Resurgentis"
	compatible_types = list(
		/datum/blood_type/human/o_minus,
	)
	reagent_type = /datum/reagent/blood/resurgentis
	contains_lux = TRUE

/datum/reagent/blood/resurgentis
	name = "Resurgentis Blood"
	glows = TRUE

//need beard and hair emissives, nipple emissives according to tiddy size (sprites done.) and vagina emissive if not hairy. I couldn't code those.
