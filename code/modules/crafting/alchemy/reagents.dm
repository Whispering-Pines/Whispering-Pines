// Catalyst. This reagent combined with normal potion reagent makes the strong potion reagent. Reactions defined by the end of this doccument
/datum/reagent/additive
	name = "additive"
	reagent_state = LIQUID

//Potions

/datum/reagent/medicine/minorhealthpot
	name = "Lesser Health Potion"
	description = "Somewhat regenerates all types of damage."
	reagent_state = LIQUID
	color = "#ff9494"
	taste_description = "tangy sweetness"
	overdose_threshold = 0
	metabolization_rate = REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/minorhealthpot/on_mob_life(mob/living/carbon/M) // Heals half as much as health potion, but not wounds.
	var/list/wCount = M.get_wounds()
	if(M.blood_volume < BLOOD_VOLUME_NORMAL) //can not overfill
		M.blood_volume = min(M.blood_volume+5, BLOOD_VOLUME_MAXIMUM)
	if(wCount.len > 0)
		M.heal_wounds(10)
		M.update_damage_overlays()
		if(prob(10))
			to_chat(M, span_nicegreen("I feel my wounds mending."))
	for(var/datum/reagent/toxin/R in M.reagents.reagent_list)
		if(R != src)
			M.reagents.remove_reagent(R.type,1)
	M.adjustBruteLoss(-1, 0)
	M.adjustFireLoss(-1, 0)
	M.adjustToxLoss(-1, 0)
	M.adjustOxyLoss(-1.5, 0)
	M.adjustCloneLoss(-1, 0)
	for(var/obj/item/organ/organny in M.internal_organs)
		M.adjustOrganLoss(organny.slot, -3)
	..()
	. = 1

/datum/chemical_reaction/minorpot
	name = "Lesser Health Potion"
	id = /datum/reagent/medicine/minorhealthpot
	results = list(/datum/reagent/medicine/minorhealthpot = 10)
	required_reagents = list(/datum/reagent/medicine/healthpot = 5, /datum/reagent/water = 5)

/datum/chemical_reaction/minorpot
	name = "Health Potion"
	id = /datum/reagent/medicine/healthpot
	results = list(/datum/reagent/medicine/healthpot = 10)
	required_reagents = list(/datum/reagent/medicine/stronghealth = 5, /datum/reagent/water = 5)

/datum/reagent/medicine/healthpot
	name = "Health Potion"
	description = "Gradually regenerates all types of damage."
	reagent_state = LIQUID
	random_reagent_color = TRUE
	color = "#ff0000"
	taste_description = "lifeblood"
	scent_description = "metal"
	overdose_threshold = 0
	metabolization_rate = REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/healthpot/on_mob_life(mob/living/carbon/M)
	var/list/wCount = M.get_wounds()
	if(M.blood_volume < BLOOD_VOLUME_NORMAL)
		M.blood_volume = min(M.blood_volume+20, BLOOD_VOLUME_MAXIMUM)
	else
		//can overfill you with blood, but at a slower rate
		M.blood_volume = min(M.blood_volume+10, BLOOD_VOLUME_MAXIMUM)
	if(wCount.len > 0)
		//some peeps dislike the church, this allows an alternative thats not a doctor or sleep.
		M.heal_wounds(20)
		M.update_damage_overlays()
		if(prob(10))
			to_chat(M, span_nicegreen("I feel my wounds mending."))
	M.adjustBruteLoss(-3, 0)
	M.adjustFireLoss(-3, 0)
	M.adjustOxyLoss(-3, 0)
	M.adjustCloneLoss(-3, 0)
	for(var/obj/item/organ/organny in M.internal_organs)
		M.adjustOrganLoss(organny.slot, -3)
	..()
	. = 1

/datum/reagent/medicine/stronghealth
	name = "Strong Health Potion"
	description = "Quickly regenerates all types of damage."
	random_reagent_color = TRUE
	color = "#820000be"
	taste_description = "rich lifeblood"
	scent_description = "metal"
	metabolization_rate = REAGENTS_METABOLISM * 3

/datum/reagent/medicine/stronghealth/on_mob_life(mob/living/carbon/M)
	var/list/wCount = M.get_wounds()
	if(M.blood_volume < BLOOD_VOLUME_NORMAL)
		M.blood_volume = min(M.blood_volume+40, BLOOD_VOLUME_MAXIMUM)
	else
		M.blood_volume = min(M.blood_volume+20, BLOOD_VOLUME_MAXIMUM)
	if(wCount.len > 0)
		M.heal_wounds(30)
		M.update_damage_overlays()
		if(prob(10))
			to_chat(M, span_nicegreen("I feel my wounds mending."))
	M.adjustBruteLoss(-7, 0) // 20u = 50 points of healing
	M.adjustFireLoss(-7, 0)
	M.adjustOxyLoss(-5, 0)
	M.adjustCloneLoss(-7, 0)
	for(var/obj/item/organ/organny in M.internal_organs)
		M.adjustOrganLoss(organny.slot, -7)
	..()
	. = 1

/datum/reagent/medicine/rosawater
	name = "Rosa Water"
	description = "Steeped rose petals with mild regeneration."
	reagent_state = LIQUID
	color = "#f398b6"
	taste_description = "floral"
	overdose_threshold = 0
	metabolization_rate = REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/rosawater/on_mob_life(mob/living/carbon/M)
	. = ..()
	if (M.mob_biotypes & MOB_BEAST)
		M.adjustFireLoss(0.5*REM)
	else
		M.adjustBruteLoss(-0.1*REM)
		M.adjustFireLoss(-0.1*REM)
		M.adjustOxyLoss(-0.1, 0)
		var/list/our_wounds = M.get_wounds()
		if (LAZYLEN(our_wounds))
			var/upd = M.heal_wounds(1)
			if (upd)
				M.update_damage_overlays()

/datum/reagent/medicine/gender_potion
	name = "Gender Potion"
	description = "Change the user's gender."
	reagent_state = LIQUID
	color = "#FF33FF"
	random_reagent_color = TRUE
	taste_description = "organic scent"
	overdose_threshold = 0
	metabolization_rate = REAGENTS_METABOLISM * 5
	alpha = 173

/datum/reagent/medicine/gender_potion/on_mob_life(mob/living/carbon/M)
	if(!istype(M) || M.stat == DEAD)
		to_chat(M, span_warning("The potion can only be used on living things!"))
		return
	if(M.gender != MALE && M.gender != FEMALE)
		to_chat(M, span_warning("The potion can only be used on gendered things!"))
		return
	if(M.gender == MALE)
		M.gender = FEMALE
		M.visible_message(span_boldnotice("[M] suddenly looks more feminine!"), span_boldwarning("You suddenly feel more feminine!"))
	else
		M.gender = MALE
		M.visible_message(span_boldnotice("[M] suddenly looks more masculine!"), span_boldwarning("You suddenly feel more masculine!"))
	M.regenerate_icons()
	..()

//Someone please remember to change this to actually do mana at some point?
/datum/reagent/medicine/manapot
	name = "Mana Potion"
	description = "Gradually regenerates energy."
	reagent_state = LIQUID
	color = "#000042"
	random_reagent_color = TRUE
	taste_description = "sweet mana"
	scent_description = "berries"
	overdose_threshold = 0
	metabolization_rate = REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/manapot/on_mob_life(mob/living/carbon/M)
	M.mana_pool.adjust_mana(4)
	..()

/datum/reagent/medicine/manapot/weak
	name = "Weak Mana Potion"

/datum/reagent/medicine/manapot/weak/on_mob_life(mob/living/carbon/M)
	M.mana_pool.adjust_mana(2)
	..()

/datum/reagent/medicine/strongmana
	name = "Strong Mana Potion"
	description = "Rapidly regenerates energy."
	color = "#0000ff"
	random_reagent_color = TRUE
	taste_description = "raw power"
	scent_description = "berries"
	metabolization_rate = REAGENTS_METABOLISM * 3

/datum/reagent/medicine/strongmana/on_mob_life(mob/living/carbon/M)
	M.mana_pool.adjust_mana(8)
	..()


/datum/reagent/medicine/stampot
	name = "Stamina Potion"
	description = "Gradually regenerates stamina."
	reagent_state = LIQUID
	color = "#129c00"
	random_reagent_color = TRUE
	taste_description = "sweet tea"
	scent_description = "grass"
	overdose_threshold = 0
	metabolization_rate = REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/stampot/on_mob_life(mob/living/carbon/M)
	if(!HAS_TRAIT(M,TRAIT_NOSTAMINA))
		M.adjust_stamina(-1.5, internal_regen = FALSE)
	..()

/datum/reagent/medicine/strongstam
	name = "Strong Stamina Potion"
	description = "Rapidly regenerates stamina."
	color = "#13df00"
	random_reagent_color = TRUE
	taste_description = "sparkly static"
	scent_description = "grass"
	metabolization_rate = REAGENTS_METABOLISM * 3

/datum/reagent/medicine/strongstam/on_mob_life(mob/living/carbon/M)
	if(!HAS_TRAIT(M,TRAIT_NOSTAMINA))
		M.adjust_stamina(-6, internal_regen = FALSE)
	..()

/datum/reagent/medicine/antidote
	name = "Poison Antidote"
	description = ""
	reagent_state = LIQUID
	color = "#00ff00"
	random_reagent_color = TRUE
	taste_description = "sickly sweet"
	scent_description = "medicine"
	metabolization_rate = REAGENTS_METABOLISM

/datum/reagent/medicine/antidote/on_mob_life(mob/living/carbon/M)
	if(volume > 0.99)
		M.adjustToxLoss(-4, 0)
	for(var/datum/reagent/toxin/toxinsies in M.reagents.reagent_list)
		M.reagents.remove_reagent(toxinsies, -2)
	..()
	. = 1

/datum/reagent/medicine/diseasecure
	name = "Disease Cure"
	description = ""
	reagent_state = LIQUID
	color = "#004200"
	random_reagent_color = TRUE
	taste_description = "dirt"
	metabolization_rate = REAGENTS_METABOLISM * 3

/datum/reagent/medicine/diseasecure/on_mob_life(mob/living/carbon/M)
	if(volume > 0.99)
		M.adjustToxLoss(-16, 0)
	for(var/datum/reagent/toxin/toxinsies in M.reagents.reagent_list)
		M.reagents.remove_reagent(toxinsies, -6)
	..()
	. = 1

//Buff potions
/datum/reagent/buff
	description = ""
	reagent_state = LIQUID
	metabolization_rate = REAGENTS_METABOLISM

/datum/reagent/buff/strength
	name = "Strength"
	color = "#ff9000"
	random_reagent_color = TRUE
	taste_description = "old meat"
	scent_description = "meat"

/datum/reagent/buff/strength/on_mob_add(mob/living/carbon/M)
	if(M.has_status_effect(/datum/status_effect/buff/alch/strengthpot))
		return ..()
	if(M.reagents.has_reagent(/datum/reagent/buff/strength,4))
		M.apply_status_effect(/datum/status_effect/buff/alch/strengthpot)
		M.reagents.remove_reagent(/datum/reagent/buff/strength, M.reagents.get_reagent_amount(/datum/reagent/buff/strength))
	return ..()

/datum/reagent/buff/perception
	name = "Perception"
	color = "#ffff00"
	random_reagent_color = TRUE
	taste_description = "cat piss"
	scent_description = "urine"

/datum/reagent/buff/perception/on_mob_life(mob/living/carbon/M)
	if(M.has_status_effect(/datum/status_effect/buff/alch/perceptionpot))
		return ..()
	if(M.reagents.has_reagent((/datum/reagent/buff/perception),4))
		M.apply_status_effect(/datum/status_effect/buff/alch/perceptionpot)
		M.reagents.remove_reagent(/datum/reagent/buff/perception, M.reagents.get_reagent_amount(/datum/reagent/buff/perception))
	return ..()

/datum/reagent/buff/intelligence
	name = "Intelligence"
	color = "#438127"
	random_reagent_color = TRUE
	taste_description = "bog water"
	scent_description = "moss"

/datum/reagent/buff/intelligence/on_mob_life(mob/living/carbon/M)
	if(M.has_status_effect(/datum/status_effect/buff/alch/intelligencepot))
		return ..()
	if(M.reagents.has_reagent((/datum/reagent/buff/intelligence),4))
		M.apply_status_effect(/datum/status_effect/buff/alch/intelligencepot)
		M.reagents.remove_reagent(/datum/reagent/buff/intelligence, M.reagents.get_reagent_amount(/datum/reagent/buff/intelligence))
	return ..()

/datum/reagent/buff/constitution
	name = "Constitution"
	color = "#130604"
	random_reagent_color = TRUE
	taste_description = "bile"
	scent_description = "vomit"

/datum/reagent/buff/constitution/on_mob_life(mob/living/carbon/M)
	if(M.has_status_effect(/datum/status_effect/buff/alch/constitutionpot))
		return ..()
	if(M.reagents.has_reagent((/datum/reagent/buff/constitution),4))
		M.apply_status_effect(/datum/status_effect/buff/alch/constitutionpot)
		M.reagents.remove_reagent(/datum/reagent/buff/constitution, M.reagents.get_reagent_amount(/datum/reagent/buff/constitution))
	return ..()

/datum/reagent/buff/endurance
	name = "Endurance"
	color = "#ffff00"
	random_reagent_color = TRUE
	taste_description = "gote urine"
	scent_description = "urine"

/datum/reagent/buff/endurance/on_mob_life(mob/living/carbon/M)
	if(M.has_status_effect(/datum/status_effect/buff/alch/endurancepot))
		return ..()
	if(M.reagents.has_reagent((/datum/reagent/buff/endurance),4))
		M.apply_status_effect(/datum/status_effect/buff/alch/endurancepot)
		M.reagents.remove_reagent(/datum/reagent/buff/endurance, M.reagents.get_reagent_amount(/datum/reagent/buff/endurance))
	return ..()

/datum/reagent/buff/speed
	name = "Speed"
	color = "#ffff00"
	random_reagent_color = TRUE
	taste_description = "raw egg yolk"
	scent_description = "sweat"

/datum/reagent/buff/speed/on_mob_life(mob/living/carbon/M)
	if(M.has_status_effect(/datum/status_effect/buff/alch/speedpot))
		return ..()
	if(M.reagents.has_reagent((/datum/reagent/buff/speed),4))
		M.apply_status_effect(/datum/status_effect/buff/alch/speedpot)
		M.reagents.remove_reagent(/datum/reagent/buff/speed, M.reagents.get_reagent_amount(/datum/reagent/buff/speed))
	return ..()

/datum/reagent/buff/fortune
	name = "Fortune"
	color = "#ffff00"
	random_reagent_color = TRUE
	taste_description = "pig urine"
	scent_description = "urine"

/datum/reagent/buff/fortune/on_mob_life(mob/living/carbon/M)
	if(M.has_status_effect(/datum/status_effect/buff/alch/fortunepot))
		return ..()
	if(M.reagents.has_reagent((/datum/reagent/buff/fortune),4))
		M.apply_status_effect(/datum/status_effect/buff/alch/fortunepot)
		M.reagents.remove_reagent(/datum/reagent/buff/fortune, M.reagents.get_reagent_amount(/datum/reagent/buff/fortune))
	return ..()


//Poisons
/* Tested this quite a bit. Heres the deal. Metabolism REAGENTS_SLOW_METABOLISM is 0.1 and needs to be that so poison isnt too fast working but
still is dangerous. Toxloss of 3 at metabolism 0.1 puts you in dying early stage then stops for reference of these values.
A dose of ingested potion is defined as 5u, projectile deliver at most 2u, you already do damage with projectile, a bolt can only feasible hold a tiny amount of poison, so much easier to deliver than ingested and so on.
If you want to expand on poisons theres tons of fun effects TG chemistry has that could be added, randomzied damage values for more unpredictable poison, add trait based resists instead of the clunky race check etc.*/

/datum/reagent/toxin/berrypoison	// Weaker poison, balanced to make you wish for death and incapacitate but not kill
	name = "Berry Poison"
	description = "Contains a poisonous thick, dark purple liquid."
	reagent_state = LIQUID
	color = "#47b2e0"
	random_reagent_color = TRUE
	taste_description = "bitterness"
	scent_description = "berry"
	toxpwr = 2
	nausea = 3
	dwarf_toxpwr = 0.5
	dwarf_nausea = 1
	nasty_eater_immune = TRUE

/datum/reagent/toxin/strongpoison		// Strong poison, meant to be somewhat difficult to produce using alchemy or spawned with select antags. Designed to kill in one full dose (5u) better drink antidote fast
	name = "Doom Poison"
	description = ""
	reagent_state = LIQUID
	color = "#1a1616"
	random_reagent_color = TRUE
	taste_description = "burning"
	scent_description = "something spicy"
	toxpwr = 4.5
	nausea = 6
	dwarf_toxpwr = 2.3
	dwarf_nausea = 1

/datum/reagent/toxin/organpoison
	name = "Organ Poison"
	description = "A viscous black liquid clings to the glass."
	reagent_state = LIQUID
	color = "#2c1818"
	random_reagent_color = TRUE
	taste_description = "sour meat"
	scent_description = "rancid meat"
	metabolization_rate = REAGENTS_SLOW_METABOLISM
	toxpwr = 2
	nausea = 9
	dwarf_toxpwr = 2
	dwarf_nausea = 9
	nasty_eater_immune = TRUE
	organ_eater_immune = TRUE

/datum/reagent/toxin/organpoison/on_mob_life(mob/living/carbon/M)
	if(!HAS_TRAIT(M, TRAIT_NASTY_EATER) && !HAS_TRAIT(M, TRAIT_ORGAN_EATER))
		M.add_nausea(9)
		M.adjustToxLoss(2)
	else if(volume >= 1.5 && HAS_TRAIT(M, TRAIT_ORGAN_EATER))
		M.apply_status_effect(/datum/status_effect/buff/foodbuff)
		M.reagents.remove_reagent(/datum/reagent/toxin/organpoison, 1.5)
	return ..()

/datum/reagent/toxin/stampoison
	name = "Stamina Poison"
	description = ""
	reagent_state = LIQUID
	color = "#083b1c"
	random_reagent_color = TRUE
	taste_description = "breathlessness"
	scent_description = "dust"
	metabolization_rate = REAGENTS_SLOW_METABOLISM * 3
	toxpwr = 0
	nausea = 0
	dwarf_toxpwr = 0
	dwarf_nausea = 0
	nasty_eater_immune = FALSE
	organ_eater_immune = FALSE

/datum/reagent/toxin/stampoison/on_mob_life(mob/living/carbon/M)
	if(!HAS_TRAIT(M,TRAIT_NOSTAMINA))
		M.adjust_stamina(2.25) //Slowly leech stamina
	return ..()

/datum/reagent/toxin/strongstampoison
	name = "Strong Stamina Poison"
	description = ""
	reagent_state = LIQUID
	color = "#041d0e"
	random_reagent_color = TRUE
	taste_description = "frozen air"
	scent_description = "mint"
	metabolization_rate = REAGENTS_SLOW_METABOLISM * 9
	toxpwr = 0
	nausea = 0
	dwarf_toxpwr = 0
	dwarf_nausea = 0
	nasty_eater_immune = FALSE
	organ_eater_immune = FALSE

/datum/reagent/toxin/strongstampoison/on_mob_life(mob/living/carbon/M)
	if(!HAS_TRAIT(M,TRAIT_NOSTAMINA))
		M.adjust_stamina(9) //Rapidly leech stamina
	return ..()


/datum/reagent/toxin/killersice
	name = "Killer's Ice"
	description = ""
	reagent_state = LIQUID
	color = "#c8c9e9"
	taste_description = "cold needles"
	scent_description = "mint"
	metabolization_rate = REAGENTS_SLOW_METABOLISM
	toxpwr = 5
	nausea = 0
	dwarf_toxpwr = 5
	dwarf_nausea = 0
	nasty_eater_immune = TRUE
	organ_eater_immune = TRUE


//Potion reactions
/datum/chemical_reaction/alch/stronghealth
	name = "Strong Health Potion"
	id = /datum/reagent/medicine/stronghealth
	results = list(/datum/reagent/medicine/stronghealth = 1)
	required_reagents = list(/datum/reagent/medicine/healthpot = 1, /datum/reagent/additive = 1)
	mix_message = "The cauldron glows for a moment."

/datum/chemical_reaction/alch/strongmana
	name = "Strong Mana Potion"
	id = /datum/reagent/medicine/strongmana
	results = list(/datum/reagent/medicine/strongmana = 1)
	required_reagents = list(/datum/reagent/medicine/manapot = 1, /datum/reagent/additive = 1)
	mix_message = "The cauldron glows for a moment."

/datum/chemical_reaction/alch/strongstam
	name = "Strong Stamina Potion"
	id = /datum/reagent/medicine/strongstam
	results = list(/datum/reagent/medicine/strongstam = 1)
	required_reagents = list(/datum/reagent/medicine/stampot = 1, /datum/reagent/additive = 1)
	mix_message = "The cauldron glows for a moment."

/datum/chemical_reaction/alch/strongpoison
	name = "Strong Health Poison"
	id = /datum/reagent/toxin/strongpoison
	results = list(/datum/reagent/toxin/strongpoison = 1)
	required_reagents = list(/datum/reagent/toxin/berrypoison = 1, /datum/reagent/additive = 1)
	mix_message = "The cauldron glows for a moment."

/datum/chemical_reaction/alch/strongstampoison
	name = "Strong Stamina Leech Potion"
	id = /datum/reagent/toxin/strongstampoison
	results = list(/datum/reagent/toxin/strongstampoison = 1)
	required_reagents = list(/datum/reagent/toxin/stampoison = 1, /datum/reagent/additive = 1)
	mix_message = "The cauldron glows for a moment."

/*----------\
|Ingredients|
\----------*/
/datum/reagent/undeadash
	name = "Spectral Powder"
	description = ""
	reagent_state = SOLID
	color = "#330066"
	taste_description = "tombstones"
	scent_description = "dust"
	metabolization_rate = 0.1

/datum/reagent/toxin/fyritiusnectar
	name = "fyritius nectar"
	description = "oh no"
	reagent_state = LIQUID
	color = "#ffc400"
	metabolization_rate = 0.5

/datum/reagent/toxin/fyritiusnectar/on_mob_life(mob/living/carbon/M)
	if(volume > 0.49)
		M.add_nausea(9)
		M.adjustFireLoss(2, 0)
		M.adjust_fire_stacks(1)
		M.IgniteMob()
	return ..()

//infections
/datum/reagent/toxin/infection
	name = "excess choleric humour"
	description = "Red-yellow pustulence - the carrier of disease, the enemy of all Pestrans."
	reagent_state = LIQUID
	color = "#dfe36f"
	var/damage_tick = 0.3
	var/lethal_fever = FALSE
	var/fever_multiplier = 1

/datum/reagent/toxin/infection/on_mob_life(mob/living/carbon/M)
	var/heat = (BODYTEMP_AUTORECOVERY_MINIMUM + clamp(volume, 3, 15)) * fever_multiplier
	M.adjustToxLoss(damage_tick, 0)
	if (lethal_fever)
		M.adjust_bodytemperature(heat, 0)
		if (prob(5))
			to_chat(M, span_warning("A wicked heat settles within me... I feel ill. Very ill."))
	else
		M.adjust_bodytemperature(heat, 0, BODYTEMP_HEAT_DAMAGE_LIMIT - 1)
		if (prob(5))
			to_chat(M, span_warning("I feel a horrible chill despite the sweat rolling from my brow..."))
	return ..()

/datum/reagent/toxin/infection/minor
	name = "disrupted choleric humor"
	description = "Symptomatic of disrupted humours."
	damage_tick = 0.1
	lethal_fever = FALSE

/datum/reagent/toxin/infection/minor/on_mob_life(mob/living/carbon/M)
	var/heat = (BODYTEMP_AUTORECOVERY_MINIMUM + clamp(volume, 3, 15)) * fever_multiplier
	M.adjustToxLoss(damage_tick, 0)
	if (lethal_fever)
		M.adjust_bodytemperature(heat, 0)
		if (prob(5))
			to_chat(M, span_warning("A wicked heat settles within me... I feel ill. Very ill."))
	else
		M.adjust_bodytemperature(heat, 0, BODYTEMP_HEAT_DAMAGE_LIMIT - 1)
		if (prob(5))
			to_chat(M, span_warning("I feel a horrible chill despite the sweat rolling from my brow..."))
	return ..()

/datum/reagent/toxin/infection/major
	name = "excess melancholic humour"
	description = "Phantom Kingdom's Bane. Excess melancholic has killed thousands, and even Pestra's greatest struggle against its insidious advance."
	damage_tick = 1
	lethal_fever = TRUE
	fever_multiplier = 3

/datum/reagent/toxin/infection/major/on_mob_life(mob/living/carbon/M)
	if (M.badluck(1))
		M.reagents.add_reagent(src, rand(1,3))
		to_chat(M, span_small("I feel even worse..."))
	return ..()
