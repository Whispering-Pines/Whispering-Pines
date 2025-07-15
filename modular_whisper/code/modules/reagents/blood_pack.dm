/obj/item/reagent_containers/blood
	name = "blood bag"
	desc = ""
	icon = 'modular_whisper/icons/misc/surgery_tools.dmi'
	icon_state = "bloodpack"
	volume = 400
	amount_per_transfer_from_this = 25
	reagent_flags = OPENCONTAINER|INJECTABLE|DRAWABLE
	var/blood_type = null
	var/unique_blood = null
	var/labelled = 0
	fill_icon_thresholds = list(10, 20, 30, 40, 50, 60, 70, 80, 90, 100)
	possible_item_intents = list(/datum/intent/use, INTENT_POUR, INTENT_FILL)

/obj/item/reagent_containers/blood/Initialize()
	. = ..()
	if(blood_type != null)
		reagents.add_reagent(unique_blood ? unique_blood : /datum/reagent/blood, 200, list("donor"=null,"viruses"=null,"blood_DNA"=null,"blood_type"=blood_type,"resistances"=null,"trace_chem"=null))
		update_icon()

/obj/item/reagent_containers/blood/on_reagent_change(changetype)
	if(reagents)
		var/datum/reagent/blood/B = reagents.has_reagent(/datum/reagent/blood)
		if(B && B.data && B.data["blood_type"])
			blood_type = B.data["blood_type"]
		else
			blood_type = null
	update_pack_name()
	update_icon()

/obj/item/reagent_containers/blood/proc/update_pack_name()
	if(!labelled)
		if(blood_type)
			name = "blood pack - [blood_type]"
		else
			name = "blood pack"

/obj/item/reagent_containers/blood/random
	icon_state = "random_bloodpack"

/obj/item/reagent_containers/blood/random/Initialize()
	icon_state = "bloodpack"
	blood_type = pick("A+", "A-", "B+", "B-", "O+", "O-", "L")
	return ..()

/obj/item/reagent_containers/blood/APlus
	blood_type = "A+"

/obj/item/reagent_containers/blood/AMinus
	blood_type = "A-"

/obj/item/reagent_containers/blood/BPlus
	blood_type = "B+"

/obj/item/reagent_containers/blood/BMinus
	blood_type = "B-"

/obj/item/reagent_containers/blood/OPlus
	blood_type = "O+"

/obj/item/reagent_containers/blood/OMinus
	blood_type = "O-"

/obj/item/reagent_containers/blood/universal
	blood_type = "U"

//my attempt at bloodpack before i port this - vide
/*
/obj/item/reagent_containers/glass/blood_pack
	name = "blood bag"
	desc = "Blood wrapped in transparent plastic, It includes a drip needle."
	icon = 'modular_whisper/icons/misc/surgery_tools.dmi'
	icon_state = "bloodpack"
	volume = 300
	amount_per_transfer_from_this = 50
	reagent_flags = OPENCONTAINER|INJECTABLE|DRAWABLE
	spillable = FALSE
	possible_item_intents = list(INTENT_POUR, INTENT_GENERIC)

/obj/item/reagent_containers/glass/blood_pack/canconsume(mob/eater, mob/user, silent = FALSE)
	if(!iscarbon(eater))
		return FALSE
	if(!eater.get_num_arms(FALSE))
		return FALSE

/obj/item/reagent_containers/glass/blood_pack/attack(mob/M, mob/user, obj/target)
	if(!canconsume(M, user))
		return
	if(M != user)
		M.visible_message("<span class='danger'>[user] attempts to inject [M] from the bloodbag.</span>", \
					"<span class='danger'>[user] attempts to inject you from the bloodbag.</span>")
	if(!do_after(user, 8 SECONDS, M))
		return
	if(!reagents?.total_volume)
		return
	to_chat(user, span_notice("I was injected from \the [src]."))
	addtimer(CALLBACK(reagents, TYPE_PROC_REF(/datum/reagents, trans_to), M, min(amount_per_transfer_from_this,5), TRUE, TRUE, FALSE, user, FALSE, INJECT), 5)
*/

/obj/item/reagent_containers/blood/attack(mob/living/carbon/human/M, mob/user, obj/target)
	switch(user.used_intent.type)
		if(/datum/intent/use)
			if(M != user)
				M.visible_message("<span class='danger'>[user] attempts to inject [M] from the bloodbag.</span>", \
							"<span class='danger'>[user] attempts to inject you from the bloodbag.</span>")
			if(!do_after(user, 3 SECONDS, M))
				return
			if(!reagents?.total_volume)
				return
			to_chat(user, span_notice("I was injected from \the [src]."))
			addtimer(CALLBACK(reagents, TYPE_PROC_REF(/datum/reagents, trans_to), M, amount_per_transfer_from_this, TRUE, TRUE, FALSE, user, FALSE, INJECT), 5)
		if(INTENT_FILL)
			if(ishuman(M))
				if(M != user)
					M.visible_message("<span class='danger'>[user] attempts to draw [M]'s blood to the bloodbag.</span>", \
								"<span class='danger'>[user] attempts to draw your blood to the bloodbag.</span>")
				if(!do_after(user, 3 SECONDS, M))
					return
				if(!reagents?.total_volume)
					return
				to_chat(user, span_notice("I was injected from \the [src]."))
				M.transfer_blood_to(reagents, amount_per_transfer_from_this, TRUE)
	. = ..()
