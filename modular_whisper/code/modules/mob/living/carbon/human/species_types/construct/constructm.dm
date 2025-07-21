/datum/species
	var/construct = 0

/mob/living
	var/construct = 0

/mob/living/carbon/human/species/construct/metal
	race = /datum/species/construct/metal
	construct = 1

/datum/species/construct/metal
	name = "Metal Construct"
	id = SPEC_ID_CONSTRUCT
	desc = "<b>Metallic Construct</b><br>\
	Masterworks of artifice, old world technology and magic combined, metal contructs are as the name implies- entirely constructed by mortal hands. \
	They are beings not of flesh and blood, but cold metal and the arcyne.\n\n \
	Constructs have hair, eyes and other should-be soft bits made of gel-like substance made of lux, usually with neon color but not straight up glowing unlike resurgentis' bits.\
	Their eyes and nipples do glow however as the shell of the gel is thinner there. They bleed this life substance when they are hurt."

	construct = 1
	skin_tone_wording = "Material"
	default_color = "#525352"
	species_traits = list(EYECOLOR,HAIR,LIPS,OLDGREY)
	default_features = MANDATORY_FEATURE_LIST
	use_skintones = 1
	possible_ages = ALL_AGES_LIST
	meat = /obj/item/ingot/steel
	disliked_food = NONE
	liked_food = NONE
	inherent_traits = list(TRAIT_NOHUNGER, TRAIT_NOBREATH)
	changesource_flags = WABBAJACK
	limbs_icon_m = 'icons/roguetown/mob/bodies/m/mcom.dmi'
	limbs_icon_f = 'icons/roguetown/mob/bodies/f/fcom.dmi'
	dam_icon_m = 'icons/roguetown/mob/bodies/dam/dam_male.dmi'
	dam_icon_f = 'icons/roguetown/mob/bodies/dam/dam_female.dmi'
	soundpack_m = /datum/voicepack/male
	soundpack_f = /datum/voicepack/female
	offset_features_m = list(OFFSET_RING = list(0,1), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1),\
		OFFSET_CLOAK = list(0,1), OFFSET_FACEMASK = list(0,1), OFFSET_HEAD = list(0,1), \
		OFFSET_FACE = list(0,1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,1), \
		OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,1), OFFSET_PANTS = list(0,1), \
		OFFSET_SHIRT = list(0,1), OFFSET_ARMOR = list(0,1), OFFSET_HANDS = list(0,1), OFFSET_UNDIES = list(0,1)
		)
	offset_features_f = list(OFFSET_RING = list(0,-1), OFFSET_GLOVES = list(0,0), OFFSET_WRISTS = list(0,0), OFFSET_HANDS = list(0,0), \
		OFFSET_CLOAK = list(0,0), OFFSET_FACEMASK = list(0,-1), OFFSET_HEAD = list(0,-1), \
		OFFSET_FACE = list(0,-1), OFFSET_BELT = list(0,0), OFFSET_BACK = list(0,-1), \
		OFFSET_NECK = list(0,-1), OFFSET_MOUTH = list(0,-1), OFFSET_PANTS = list(0,0), \
		OFFSET_SHIRT = list(0,0), OFFSET_ARMOR = list(0,0), OFFSET_UNDIES = list(0,-1), \
		)
	specstats_m = list(STATKEY_STR = 1, STATKEY_PER = 0, STATKEY_INT = 0, STATKEY_CON = 1, STATKEY_END = 1, STATKEY_SPD = -2, STATKEY_LCK = 0)
	specstats_f = list(STATKEY_STR = 1, STATKEY_PER = 0, STATKEY_INT = 0, STATKEY_CON = 1, STATKEY_END = 1, STATKEY_SPD = -2, STATKEY_LCK = 0)
	enflamed_icon = "widefire"
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain/construct,
		ORGAN_SLOT_HEART = /obj/item/organ/heart/construct,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs/construct,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes/construct,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue/construct,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver/construct,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach/construct,
		ORGAN_SLOT_GUTS = /obj/item/organ/filling_organ/guts,
		)
	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head,
		/datum/customizer/bodypart_feature/crest,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/bodypart_feature/underwear,
		/datum/customizer/organ/penis/anthro,
		/datum/customizer/organ/testicles/anthro,
		/datum/customizer/organ/breasts/animal,
		/datum/customizer/organ/vagina/human_anthro,
		/datum/customizer/organ/belly/animal,
		/datum/customizer/organ/butt/animal,
		)
	body_marking_sets = list(
		/datum/body_marking_set/none,
	)
	body_markings = list(
		/datum/body_marking/eyeliner,
		/datum/body_marking/tonage,
		/datum/body_marking/nose,
	)

/datum/species/construct/metal/check_roundstart_eligible()
	return TRUE

/datum/species/construct/metal/get_skin_list()
	return list(
		"BRASS" = "dfbd6c",
		"IRON" = "525352",
		"STEEL" = "babbb9",
		"BRONZE" = "e2a670"
	)

/obj/item/organ/brain/construct
	name = "construct brain"
	desc = "The centre of thought for a construct. It crackles with knowledge... and something more sinister."
	icon_state = "brain-con"

/obj/item/organ/heart/construct
	name = "construct core"
	desc = "Swirling with a blessing of Astrata and pulsing with lux inside. This allows a construct to move."
	icon_state = "heartcon-on"
	icon_base = "heartcon"

/obj/item/organ/lungs/construct
	name = "construct aersource"
	desc = "A complex hollow crystal, which courses with air through unknowable means. Steam wisps around it in a vortex."
	icon_state = "lungs-con"

/obj/item/organ/eyes/construct
	name = "construct eyes"
	desc = "Some beast's eyes, preserved through artifice and with magical rock embedded in their back. Seems to fit a construct's head."
	icon_state = "eyeball-con"
	glows = TRUE

/obj/item/organ/tongue/construct
	name = "construct tongue"
	desc = "A beast's tongue, preserved through artifice and with crystals embedded in the base. It seems rather dead..."
	icon_state = "tongue-con"
	say_mod = "crackles"
	taste_sensitivity = 30 //It's dead, jim.

/obj/item/organ/liver/construct
	name = "construct decay regulator"
	icon_state = "liver-con"
	desc = "A construct's decay regulator. Swirling with pestran energies, it prevents corrosion and rot. Unfortunately, this makes them susceptible to toxins."

/obj/item/organ/stomach/construct
	name = "construct soulseed"
	icon_state = "stomach-con"
	desc = "The seat of a construct's soul, where a stomach would go. Wisps of lux cycle about, impossible to grab."

/obj/item/organ/filling_organ/guts/construct
	name = "construct guts"
	desc = "Alot of fleshy mass that act as.. guts, a construct produces biowaste out of the lux it processed, somehow.."
