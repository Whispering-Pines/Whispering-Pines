
/datum/surgery_step/resize_organs
	name = "resize organs"
	time = 6.0 SECONDS
	accept_hand = FALSE
	implements = list(
		TOOL_SCALPEL = 80,
		TOOL_SAW = 60,
		TOOL_IMPROVISED_SAW = 50,
		TOOL_SHARP = 40,
	)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	preop_sound = 'sound/surgery/organ2.ogg'
	success_sound = 'sound/surgery/organ1.ogg'
	surgery_flags = SURGERY_INCISED
	skill_min = SKILL_LEVEL_JOURNEYMAN
	skill_median = SKILL_LEVEL_EXPERT

/datum/surgery_step/resize_organs/preop(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent)
	var/list/initial_organs = target.getorganszone(target_zone, subzones = FALSE)
	var/list/organs = list()
	for(var/obj/item/organ/cur_organ as anything in initial_organs)
		if(cur_organ.slot in list(ORGAN_SLOT_BREASTS, ORGAN_SLOT_BELLY, ORGAN_SLOT_PENIS, ORGAN_SLOT_TESTICLES, ORGAN_SLOT_BUTT))
			organs += cur_organ

	if(!length(organs))
		to_chat(user, span_warning("There are no resizeable parts on [target]'s [parse_zone(target_zone)]!"))
		return FALSE
	for(var/obj/item/organ/found_organ as anything in organs)
		found_organ.on_find(user)
		organs -= found_organ
		organs[found_organ.name] = found_organ

	var/selected = input(user, "Resize which part?", "PESTRA") as null|anything in sortList(organs)
	if(QDELETED(user) || QDELETED(target) || !user.Adjacent(target) || (user.get_active_held_item() != tool))
		return FALSE
	var/obj/item/organ/final_organ = organs[selected]
	if(QDELETED(final_organ))
		return FALSE

	user.select_organ_slot(final_organ.slot)
	display_results(user, target, span_notice("I begin to resize [final_organ] at [target]'s [parse_zone(target_zone)]..."),
		span_notice("[user] begins to resize [final_organ] at [target]'s [parse_zone(target_zone)]."),
		span_notice("[user] begins to resize something at [target]'s [parse_zone(target_zone)]."))

	return TRUE

/datum/surgery_step/resize_organs/success(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent)
	var/obj/item/organ/selected_organ = target.getorganslot(user.organ_slot_selected)
	if(QDELETED(selected_organ) || (selected_organ.owner != target))
		display_results(user, target, span_warning("I can't resize anything at [target]'s [parse_zone(target_zone)]!"),
			span_notice("[user] can't seem to resize anything at [target]'s [parse_zone(target_zone)]!"),
			span_notice("[user] can't seem to resize anything at [target]'s [parse_zone(target_zone)]!"))
		return FALSE
	var/list/size_list = list()
	switch(selected_organ.slot)
		if(ORGAN_SLOT_BREASTS)
			size_list = GLOB.named_breast_sizes
		if(ORGAN_SLOT_BELLY)
			size_list = GLOB.named_belly_sizes
		if(ORGAN_SLOT_PENIS)
			size_list = GLOB.named_penis_sizes
		if(ORGAN_SLOT_TESTICLES)
			size_list = GLOB.named_ball_sizes
		if(ORGAN_SLOT_BUTT)
			size_list = GLOB.named_butt_sizes
		else
			return FALSE

	var/named_size = input(user, "Choose the size:", "PESTRA", find_key_by_value(size_list, selected_organ.organ_size)) as anything in size_list
	if(isnull(named_size))
		return FALSE
	selected_organ.organ_size = size_list[named_size]

	display_results(user, target, span_notice("I successfully resize [selected_organ] at [target]'s [parse_zone(target_zone)]."),
		span_notice("[user] successfully resizes [selected_organ] at [target]'s [parse_zone(target_zone)]!"),
		span_notice("[user] successfully resizes something at [target]'s [parse_zone(target_zone)]!"))
	log_combat(user, target, "surgically resized [selected_organ.name] at")

	selected_organ.Insert(target)
	selected_organ.owner.update_body_parts(TRUE)
	return TRUE

/datum/surgery_step/resize_organs/failure(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent, success_prob)
	var/obj/item/organ/selected_organ = target.getorganslot(user.organ_slot_selected)
	if(QDELETED(selected_organ) || (selected_organ.owner != target))
		display_results(user, target, span_warning("I can't resize anything at [target]'s [parse_zone(target_zone)]!"),
			span_notice("[user] can't seem to resize anything at [target]'s [parse_zone(target_zone)]!"),
			span_notice("[user] can't seem to resize anything at [target]'s [parse_zone(target_zone)]!"))
		return FALSE

	display_results(user, target, span_warning("I screwed up!"),
		span_warning("[user] screws up!"),
		span_notice("[user] screws up."), TRUE)

	var/obj/item/bodypart/gotten_part = target.get_bodypart(check_zone(target_zone))
	if(gotten_part)
		gotten_part.add_wound(/datum/wound/slash/large)

	return TRUE
