/obj/item/organ
	///for genitals mostly
	var/organ_size = 0
	//size debuffs
	var/size_debuff_min = null

//size debuff stuff
/obj/item/organ/Insert(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	if(size_debuff_min)
		if(organ_size > size_debuff_min)
			to_chat(M, span_red("My [name] is massive and heavy... It may hinder me greatly."))

/obj/item/organ/on_life()
	. = ..()
	if(size_debuff_min)
		if(organ_size > size_debuff_min)
			if(!owner.has_status_effect(/datum/status_effect/debuff/bigboobs) && owner.get_stat_level(STATKEY_STR) < 13)
				owner.apply_status_effect(/datum/status_effect/debuff/bigboobs)
			else if(!owner.has_status_effect(/datum/status_effect/debuff/bigboobs) && owner.get_stat_level(STATKEY_STR) >= 13)
				owner.apply_status_effect(/datum/status_effect/debuff/bigboobs/lite)

/datum/status_effect/debuff/bigboobs
	id = "bigboobs"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bigboobs
	examine_text = span_notice("They have massive GOODS!")
	effectedstats = list(STATKEY_CON = 1, STATKEY_END = -2, STATKEY_SPD = -2)
	duration = 1 MINUTES //should wear off if organ is removed, so.

/datum/status_effect/debuff/bigboobs/lite
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bigboobs/lite
	examine_text = span_notice("They have massive GOODS!")
	effectedstats = list(STATKEY_CON = 1, STATKEY_END = -1, STATKEY_SPD = -1)

/atom/movable/screen/alert/status_effect/debuff/bigboobs
	name = "Oversized Genitals"
	desc = "They feel as heavy as gold and are massive... My back hurts."
	icon = 'modular_stonehedge/licensed-eaglephntm/icons/mob/screen_alert.dmi'
	icon_state = "bigboobs"

/atom/movable/screen/alert/status_effect/debuff/bigboobs/lite
	name = "Oversized Genitals (Supported)"
	desc = "They feel as heavy as gold and are massive... But my body is strong enough to support them somewhat."
	icon = 'modular_stonehedge/licensed-eaglephntm/icons/mob/screen_alert.dmi'
	icon_state = "bigboobslite"

/obj/item
	var/can_hold_endowed = FALSE

/obj/item/clothing/armor/chainmail
	can_hold_endowed = TRUE

/obj/item/clothing/armor/gambeson
	can_hold_endowed = TRUE

/obj/item/clothing/armor/leather
	can_hold_endowed = TRUE

/obj/item/clothing/pants/trou
	can_hold_endowed = TRUE

/datum/status_effect/debuff/bigboobs/on_apply()
	. = ..()
	var/mob/living/carbon/human/species/user = owner
	if(!user)
		return
	ADD_TRAIT(user, TRAIT_ENDOWMENT, id)
	var/obj/item/clothing/thepants = user.wear_pants
	if(thepants && !thepants?.can_hold_endowed)
		user.dropItemToGround(thepants)
	var/obj/item/clothing/theshirt = user.wear_shirt
	var/obj/item/clothing/thearmor = user.wear_armor
	if(theshirt && !theshirt?.can_hold_endowed)
		user.dropItemToGround(theshirt)
	if(thearmor && !thearmor?.can_hold_endowed)
		user.dropItemToGround(thearmor)

/datum/status_effect/debuff/bigboobs/on_remove()
	. = ..()
	var/mob/living/carbon/human/species/user = owner
	if(!user)
		return
	REMOVE_TRAIT(user, TRAIT_ENDOWMENT, id)

/obj/item/organ/penis
	name = "penis"
	icon_state = "penis"
	dropshrink = 0.5
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_PENIS
	organ_size = DEFAULT_PENIS_SIZE
	size_debuff_min = PENIS_DEBUFF_SIZE
	organ_dna_type = /datum/organ_dna/penis
	accessory_type = /datum/sprite_accessory/penis/human
	low_threshold_passed = "<span class='info'>My cock starts to burn a bit.</span>"
	high_threshold_passed = "<span class='info'>My cock feels like it's on a stove...</span>"
	now_failing = "<span class='warning'>My cock burns agonizingly! It's messed up!</span>"
	now_fixed = "<span class='info'>My cock isn't totally chaffed anymore.</span>"
	high_threshold_cleared = "<span class='info'>My cock burns not so agonizingly now.</span>"
	low_threshold_cleared = "<span class='info'>My cock feels alright now.</span>"
	var/sheath_type = SHEATH_TYPE_NONE
	var/erect_state = ERECT_STATE_NONE
	var/penis_type = PENIS_TYPE_PLAIN
	var/always_hard = FALSE
	var/strapon = FALSE


/obj/item/organ/penis/proc/update_erect_state()
	if(istype(src, /obj/item/organ/penis/internal))
		return
	var/oldstate = erect_state
	var/new_state = ERECT_STATE_NONE
	if(owner)
		var/mob/living/carbon/human/human = owner
		if(always_hard || human.sexcon.arousal > 20 && human.sexcon.manual_arousal == 1 || human.sexcon.manual_arousal == 4)
			new_state = ERECT_STATE_HARD
		else if(human.sexcon.arousal > 10 && human.sexcon.manual_arousal == 1 || human.sexcon.manual_arousal == 3)
			new_state = ERECT_STATE_PARTIAL
		else
			new_state = ERECT_STATE_NONE

	erect_state = new_state
	if(oldstate != erect_state && owner)
		owner.update_body_parts(TRUE)

/obj/item/organ/penis/knotted
	name = "knotted penis"
	penis_type = PENIS_TYPE_KNOTTED
	sheath_type = SHEATH_TYPE_NORMAL
	icon_state = "knotpenis"

/obj/item/organ/penis/knotted/big
	organ_size = 5

/obj/item/organ/penis/equine
	name = "equine penis"
	penis_type = PENIS_TYPE_EQUINE
	sheath_type = SHEATH_TYPE_NORMAL
	icon_state = "equinepenis"

/obj/item/organ/penis/tapered_mammal
	name = "tapered penis"
	penis_type = PENIS_TYPE_TAPERED
	sheath_type = SHEATH_TYPE_NORMAL
	icon_state = "taperedpenis"

/obj/item/organ/penis/tapered
	name = "tapered penis"
	penis_type = PENIS_TYPE_TAPERED
	sheath_type = SHEATH_TYPE_SLIT
	icon_state = "taperedpenis"

/obj/item/organ/penis/tapered_double
	name = "hemi tapered penis"
	penis_type = PENIS_TYPE_TAPERED_DOUBLE
	sheath_type = SHEATH_TYPE_SLIT
	icon_state = "hemipenis"

/obj/item/organ/penis/tapered_double_knotted
	name = "hemi knotted tapered penis"
	penis_type = PENIS_TYPE_TAPERED_DOUBLE_KNOTTED
	sheath_type = SHEATH_TYPE_SLIT
	icon_state = "hemiknotpenis"

/obj/item/organ/penis/barbed
	name = "barbed penis"
	penis_type = PENIS_TYPE_BARBED
	sheath_type = SHEATH_TYPE_NORMAL
	icon_state = "barbpenis"

/obj/item/organ/penis/barbed_knotted
	name = "barbed knotted penis"
	penis_type = PENIS_TYPE_BARBED_KNOTTED
	sheath_type = SHEATH_TYPE_NORMAL
	icon_state = "barbpenis"

/obj/item/organ/penis/tentacle
	name = "tentacle penis"
	penis_type = PENIS_TYPE_TENTACLE
	sheath_type = SHEATH_TYPE_NONE
	icon_state = "tentapenis"

/obj/item/organ/filling_organ/vagina
	name = "vagina"
	icon = 'modular_stonehedge/licensed-eaglephntm/icons/obj/surgery.dmi'
	icon_state = "vagina"
	dropshrink = 0.5
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_VAGINA
	accessory_type = /datum/sprite_accessory/vagina/human
	max_reagents = 40 //big cap, ordinary absorbtion.
	absorbing = TRUE
	fertility = TRUE
	altnames = list("vagina", "cunt", "womb", "pussy", "slit", "kitty", "snatch") //used in thought messages.
	spiller = TRUE
	blocker = ITEM_SLOT_PANTS
	bloatable = TRUE
	low_threshold_passed = "<span class='info'>My pussy burns a bit...</span>"
	high_threshold_passed = "<span class='info'>My pussy is all bruised up and red...</span>"
	now_failing = "<span class='warning'>My pussy... is torn apart!</span>"
	now_fixed = "<span class='info'>My pussy isn't absolutely torn up anymore.</span>"
	high_threshold_cleared = "<span class='info'>My pussy is less beaten up now.</span>"
	low_threshold_cleared = "<span class='info'>My pussy is alright now!</span>"

	var/preggotimer //dumbass timer
	var/pre_pregnancy_size = 0

//we handle all of this here because cant timer another goddamn thing from here correctly.
/obj/item/organ/filling_organ/vagina/proc/be_impregnated()
	if(!owner)
		return
	if(owner.stat == DEAD)
		return
	if(owner.has_quirk(/datum/quirk/selfawaregeni))
		to_chat(owner, span_lovebold("I feel a surge of warmth in my [src.name], I’m definitely pregnant!"))
	reagents.maximum_volume *= 0.5 //ick ock, should make the thing recalculate on next life tick.
	pregnant = TRUE
	if(owner.getorganslot(ORGAN_SLOT_BREASTS)) //shitty default behavior i guess, i aint gonna customiza-ble this fuck that.
		var/obj/item/organ/filling_organ/breasts/breasties = owner.getorganslot(ORGAN_SLOT_BREASTS)
		if(!breasties.refilling)
			breasties.refilling = TRUE
			if(owner.has_quirk(/datum/quirk/selfawaregeni))
				to_chat(owner, span_lovebold("My breasts should start lactating soon..."))
	if(owner.getorganslot(ORGAN_SLOT_BELLY)) //shitty default behavior i guess, i aint gonna customiza-ble this fuck that.
		var/obj/item/organ/belly/belly = owner.getorganslot(ORGAN_SLOT_BELLY)
		pre_pregnancy_size = belly.organ_size
		addtimer(CALLBACK(src, PROC_REF(handle_preggoness)), 30 MINUTES, TIMER_STOPPABLE)

/obj/item/organ/filling_organ/vagina/proc/be_itempregnated(var/obj/item/pregitem, max_amount = 1)
	if(owner.has_quirk(/datum/quirk/selfawaregeni))
		to_chat(owner, span_lovebold("I feel a strange surge in my [src.name]..?"))
	sleep(5 MINUTES)
	to_chat(owner, span_red("I feel there is something unnatural grown inside my womb..."))
	for(var/index in 1 to rand(1,max_amount))
		new pregitem(contents)

/obj/item/organ/filling_organ/vagina/proc/undo_preggoness()
	if(!pregnant)
		return
	deltimer(preggotimer)
	pregnant = FALSE
	to_chat(owner, span_love("I feel my [src] shrink to how it was before. Pregnancy is no more."))
	if(owner.getorganslot(ORGAN_SLOT_BELLY))
		var/obj/item/organ/belly/bellyussy = owner.getorganslot(ORGAN_SLOT_BELLY)
		bellyussy.organ_size = pre_pregnancy_size
	owner.update_body_parts(TRUE)

/obj/item/organ/filling_organ/vagina/proc/handle_preggoness()
	if(owner.getorganslot(ORGAN_SLOT_BELLY))
		var/obj/item/organ/belly/bellyussy = owner.getorganslot(ORGAN_SLOT_BELLY)
		if(bellyussy.organ_size <= 2) //dont go above size 3
			to_chat(owner, span_lovebold("I notice my belly has grown due to pregnancy...")) //dont need to repeat this probably if size cant grow anyway.
			bellyussy.organ_size = bellyussy.organ_size + 1
			owner.update_body_parts(TRUE)
			preggotimer = addtimer(CALLBACK(src, PROC_REF(handle_preggoness)), 30 MINUTES, TIMER_STOPPABLE)
		else
			deltimer(preggotimer)

/obj/item/organ/filling_organ/breasts
	name = "breasts"
	icon = 'modular_stonehedge/licensed-eaglephntm/icons/obj/surgery.dmi'
	icon_state = "breasts"
	dropshrink = 0.8
	visible_organ = TRUE
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_BREASTS
	organ_dna_type = /datum/organ_dna/breasts
	accessory_type = /datum/sprite_accessory/breasts/pair
	organ_size = DEFAULT_BREASTS_SIZE
	size_debuff_min = BREASTS_DEBUFF_SIZE
	reagent_to_make = /datum/reagent/consumable/milk
	hungerhelp = TRUE
	organ_sizeable = TRUE
	absorbing = FALSE //funny liquid tanks
	altnames = list("breasts", "tits", "milkers", "tiddies", "badonkas", "boobas") //used in thought messages.
	startsfilled = TRUE
	blocker = ITEM_SLOT_SHIRT
	low_threshold_passed = "<span class='info'>My tits are getting hurt...</span>"
	high_threshold_passed = "<span class='info'>My tits are torn up...</span>"
	now_failing = "<span class='warning'>My tits are fully torn apart..!</span>"
	now_fixed = "<span class='info'>My tits are not fully torn up anymore.</span>"
	high_threshold_cleared = "<span class='info'>My tits are less torn up now.</span>"
	low_threshold_cleared = "<span class='info'>My tits are okay now.</span>"

/obj/item/organ/filling_organ/breasts/Insert(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	if(!refilling)
		reagents.clear_reagents()

/obj/item/organ/belly
	name = "belly"
	icon = 'modular_stonehedge/licensed-eaglephntm/icons/obj/surgery.dmi'
	icon_state = "belly"
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_STOMACH
	slot = ORGAN_SLOT_BELLY
	organ_dna_type = /datum/organ_dna/belly
	accessory_type = /datum/sprite_accessory/belly
	organ_size = DEFAULT_BELLY_SIZE
	size_debuff_min = BELLY_DEBUFF_SIZE

/obj/item/organ/filling_organ/testicles
	name = "testicles"
	icon = 'modular_stonehedge/licensed-eaglephntm/icons/obj/surgery.dmi'
	icon_state = "testicles"
	dropshrink = 0.5
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_TESTICLES
	organ_dna_type = /datum/organ_dna/testicles
	accessory_type = /datum/sprite_accessory/testicles/pair
	organ_size = DEFAULT_TESTICLES_SIZE
	size_debuff_min = TESTICLES_DEBUFF_SIZE
	reagent_to_make = /datum/reagent/consumable/cum
	refilling = TRUE
	reagent_generate_rate = 6
	storage_per_size = 200 //more size since they have so little size selections.
	organ_sizeable = TRUE
	altnames = list("balls", "testicles", "testes", "orbs", "cum tanks", "seed tanks") //used in thought messages.
	startsfilled = TRUE
	blocker = ITEM_SLOT_PANTS
	low_threshold_passed = "<span class='info'>My balls are bruised...</span>"
	high_threshold_passed = "<span class='info'>My balls are almost busted up..!</span>"
	now_failing = "<span class='warning'>My balls are torn..!</span>"
	now_fixed = "<span class='info'>My balls are not torn up anymore.</span>"
	high_threshold_cleared = "<span class='info'>My balls are less beaten now.</span>"
	low_threshold_cleared = "<span class='info'>My balls are okay now.</span>"
	var/virility = TRUE

/obj/item/organ/filling_organ/testicles/Insert(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	if(!virility)
		reagent_to_make = /datum/reagent/consumable/cum/sterile
		reagents.clear_reagents()
		reagents.add_reagent(reagent_to_make, reagents.maximum_volume)

/obj/item/organ/butt
	name = "butt"
	icon = 'modular_stonehedge/licensed-eaglephntm/icons/obj/surgery.dmi'
	icon_state = "butt"
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_BUTT
	organ_dna_type = /datum/organ_dna/butt
	accessory_type = /datum/sprite_accessory/butt/pair
	organ_size = DEFAULT_BUTT_SIZE

/obj/item/organ/filling_organ/testicles/internal
	name = "internal testicles"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/penis/internal
	name = "internal penis"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/filling_organ/vagina/internal
	name = "internal vagina"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/filling_organ/breasts/internal
	name = "internal breasts"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/belly/internal
	name = "internal belly"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/butt/internal
	name = "internal butt"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none
