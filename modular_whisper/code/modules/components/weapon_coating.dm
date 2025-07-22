//By Vide Noir https://github.com/EaglePhntm.
//reagent coating for weapons that apply on successful hit through armor.
//i didnt realize tipped_item.dm was a thing until now fuck me

/datum/component/weapon_coating
	var/obj/item/weapon/parentw
	var/reagent_apply_amt

/obj/item/weapon
	///incase you want to set something non blunt uncoatable anyways.
	var/uncoatable = FALSE

/obj/item/weapon/Initialize()
	. = ..()
	if(sharpness != IS_BLUNT && !uncoatable)
		AddComponent(/datum/component/weapon_coating)

/datum/component/weapon_coating/Initialize(...)
	. = ..()
	if(!istype(parent, /obj/item/weapon))
		return COMPONENT_INCOMPATIBLE
	parentw = parent
	if(parentw.sharpness == IS_BLUNT || parentw.uncoatable)
		return COMPONENT_INCOMPATIBLE

	parentw.create_reagents(parentw.w_class*5, REFILLABLE|DRAINABLE) //weapon size equals more coatable.
	reagent_apply_amt = max((5/parentw.w_class), 1) //smaller weapons will apply more poison at once.

/datum/component/weapon_coating/RegisterWithParent()
	RegisterSignal(parent, COMSIG_ITEM_SPEC_ATTACKEDBY, PROC_REF(apply_reagents))
	RegisterSignal(parent, COMSIG_COMPONENT_CLEAN_ACT, PROC_REF(clean_react))
	RegisterSignal(parent, COMSIG_PARENT_EXAMINE, PROC_REF(on_examine))
	RegisterSignal(parent, COMSIG_ATOM_ATTACKBY, PROC_REF(on_attackby))
	RegisterSignal(parent, COMSIG_MOVABLE_THROW_HIT_MOB, PROC_REF(apply_throw_reagents))

/datum/component/weapon_coating/UnregisterFromParent()
	UnregisterSignal(parentw, list(COMSIG_ITEM_SPEC_ATTACKEDBY,COMSIG_COMPONENT_CLEAN_ACT,COMSIG_PARENT_EXAMINE,COMSIG_ATOM_ATTACKBY, COMSIG_MOVABLE_THROW_HIT_MOB))

/datum/component/weapon_coating/proc/clean_react(datum/source, clean_types)
	SIGNAL_HANDLER
	if(parentw.reagents.total_volume)
		parentw.reagents.remove_all(parentw.reagents.maximum_volume) //buh bye reagents water washes it

/datum/component/weapon_coating/proc/apply_reagents(datum/source, atom/target, mob/user, obj/item/bodypart/affecting, actual_damage)
	SIGNAL_HANDLER
	if(!target)
		return
	if(!affecting)
		return
	if(!actual_damage)
		return
	if(!isliving(target))
		return
	if(!parentw.reagents.total_volume)
		return
	parentw.reagents.trans_to(target, reagent_apply_amt)
	target.visible_message(span_green("[target] shudders!"),span_boldgreen("I feel a burning feeling on my [affecting.name]!"))
	log_attack("[target] was struck with [english_list(parentw.reagents.reagent_list)] using a poisoned weapon by [user].")

/datum/component/weapon_coating/proc/on_attackby(datum/source, obj/item/reagent_containers/I, mob/living/user, params)
	SIGNAL_HANDLER
	if(!I.reagents)
		return
	if(user.used_intent?.type == INTENT_SPLASH && I.spillable) //tries to add everything.
		I.reagents.trans_to(parentw, I.reagents.maximum_volume)
		chem_splash(source, 2, list(I.reagents))
	var/waterbuse = 0
	for(var/datum/reagent/water/waterussy in I.reagents.reagent_list)
		waterbuse = waterussy.volume
	parentw.reagents.remove_all(waterbuse) //buh bye reagents water washes it
	//we dont want water coated weapons so last failsafe
	parentw.reagents.remove_all_type(/datum/reagent/water, parentw.reagents.total_volume)

/datum/component/weapon_coating/proc/on_examine(datum/source, mob/living/user, list/exam)
	SIGNAL_HANDLER
	if(parentw.reagents && parentw.reagents.total_volume)
		if(user.can_see_reagents() || (user.Adjacent(src) && user.get_skill_level(/datum/skill/craft/alchemy) >= 2)) //Show each individual reagent
			exam += span_notice("It is coated in:")
			for(var/datum/reagent/R in parentw.reagents.reagent_list)
				exam += span_notice("[round(R.volume / 3, 0.1)] oz of <font color=[R.color]>[R.name]</font>")
		else //Otherwise, just show the total volume
			var/total_volume = 0
			var/reagent_color
			for(var/datum/reagent/R in parentw.reagents.reagent_list)
				total_volume += R.volume
			reagent_color = mix_color_from_reagents(parentw.reagents.reagent_list)
			if(total_volume / 3 < 1)
				exam += span_notice("It seems to be coated in less than 1 oz of <font color=[reagent_color]>something.</font>")
			else
				exam += span_notice("It seems to be coated in [round(total_volume / 3)] oz of <font color=[reagent_color]>something.</font>")
/mob/living/carbon/human/hitby(atom/movable/AM, skipcatch, hitpush, blocked, datum/thrownthing/throwingdatum, damage_type)
	. = ..()

/datum/component/weapon_coating/proc/apply_throw_reagents(datum/source, atom/target, mob/user, nodmg, zone)
	SIGNAL_HANDLER
	if(!target)
		return
	if(nodmg)
		return
	if(!isliving(target))
		return
	if(!parentw.reagents.total_volume)
		return
	parentw.reagents.trans_to(target, reagent_apply_amt/2) //less cuz thrown
	target.visible_message(span_green("[target] shudders!"),span_boldgreen("I feel a burning feeling on my [zone]!"))
	log_attack("[target] was throw-struck with [english_list(parentw.reagents.reagent_list)] using a poisoned weapon by [user].")
