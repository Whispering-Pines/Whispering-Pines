/obj/item/balm
	name = "balm"
	desc = "Something that is used to preserve bodies for whatever reason, prevents rotting. It is single use."
	gender = PLURAL
	icon = 'modular_whisper/icons/obj/misc.dmi'
	icon_state = "balm"
	w_class = WEIGHT_CLASS_TINY
	item_flags = NOBLUDGEON
	throwforce = 0
	throw_speed = 1
	throw_range = 7

/obj/item/balm/attack(mob/living/carbon/human/target, mob/living/carbon/user)
	. = ..()
	user.changeNext_move(CLICK_CD_MELEE)
	if(!ishuman(target))
		to_chat(user, span_warning("I can only do this to humanoids."))
		return
	if(!do_after(user, 10 SECONDS, target))
		return
	to_chat(user, span_warning("I preserve [target]"))
	ADD_TRAIT(target, TRAIT_EMBALMED, TRAIT_GENERIC)
	qdel(src)


//dangerous meats
//meat from animals that are likely to have disease or parasites, atleast when uncooked maybe.
/obj/item/reagent_containers/food/snacks/meat/steak/dangerous
	list_reagents = list(/datum/reagent/consumable/nutriment = RAWMEAT_NUTRITION, /datum/reagent/toxin/parasite = 2)

/datum/reagent/toxin/parasite
	name = "parasites"
	description = "A parasite."
	harmful = TRUE
	metabolization_rate = REAGENTS_SLOW_METABOLISM
	toxpwr = 1.5
	nausea = 1

/datum/reagent/toxin/parasite/on_mob_life(mob/living/carbon/M)
	. = ..()
	if(prob(50))
		M.apply_status_effect(/datum/status_effect/debuff/parasite)
		to_chat(M, span_warning("Ough...I feel sick."))

/datum/status_effect/debuff/parasite
	id = "parasite"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/parasite
	effectedstats = list(STATKEY_CON = -1, STATKEY_END = -1)
	duration = 30 MINUTES

/atom/movable/screen/alert/status_effect/debuff/parasite
	name = "Parasite"
	desc = "<span class='warning'>I ate something dangerous and now I got uninvited guests in my guts... I need an antidote.</span>\n"
	icon_state = "poison"

/datum/status_effect/debuff/parasite/tick()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.adjust_nutrition(-2)
		C.adjust_hydration(-2)
