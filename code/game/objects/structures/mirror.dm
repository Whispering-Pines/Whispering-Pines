//wip wip wup
/obj/structure/mirror
	name = "mirror"
	desc = ""
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "mirror"
	density = FALSE
	anchored = TRUE
	max_integrity = 200
	integrity_failure = 0.9
	break_sound = "glassbreak"
	attacked_sound = 'sound/combat/hits/onglass/glasshit.ogg'
	pixel_y = 32

/obj/structure/mirror/fancy
	icon_state = "fancymirror"
	pixel_y = 32

/obj/structure/mirror/Initialize(mapload)
	. = ..()
	if(icon_state == "mirror_broke" && !broken)
		obj_break(null, TRUE, mapload)

/obj/structure/mirror/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(broken || !Adjacent(user))
		return

	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user


	var/list/options = list("hairstyle", "facial hairstyle", "hair color", "skin", "detail", "eye color")
	var/chosen = browser_input_list(user, "Change what?", "WHISPERING PINES", options)
	var/should_update
	switch(chosen)
		if("facial hairstyle")
			var/datum/customizer_choice/bodypart_feature/hair/facial/humanoid/facial_choice = CUSTOMIZER_CHOICE(/datum/customizer_choice/bodypart_feature/hair/facial/humanoid)
			var/list/valid_facial_hairstyles = list()
			for(var/facial_type in facial_choice.sprite_accessories)
				var/datum/sprite_accessory/hair/facial/facial = new facial_type()
				valid_facial_hairstyles[facial.name] = facial_type

			var/new_style = browser_input_list(user, "Choose your facial hairstyle", "Hair Styling", valid_facial_hairstyles)
			if(new_style)
				var/obj/item/bodypart/head/head = H.get_bodypart(BODY_ZONE_HEAD)
				if(head && head.bodypart_features)
					var/datum/bodypart_feature/hair/facial/current_facial = null
					for(var/datum/bodypart_feature/hair/facial/facial_feature in head.bodypart_features)
						current_facial = facial_feature
						break

					if(current_facial)
						// Create a new facial hair entry with the SAME color as the current facial hair
						var/datum/customizer_entry/hair/facial/facial_entry = new()
						facial_entry.hair_color = current_facial.hair_color

						// Create the new facial hair with the new style but preserve color
						var/datum/bodypart_feature/hair/facial/new_facial = new()
						new_facial.set_accessory_type(valid_facial_hairstyles[new_style], facial_entry.hair_color, H)

						// Apply all the color data from the entry
						facial_choice.customize_feature(new_facial, H, null, facial_entry)

						head.remove_bodypart_feature(current_facial)
						head.add_bodypart_feature(new_facial)
						should_update = TRUE

		if("hairstyle")
			var/datum/customizer_choice/bodypart_feature/hair/head/humanoid/hair_choice = CUSTOMIZER_CHOICE(/datum/customizer_choice/bodypart_feature/hair/head/humanoid)
			var/list/valid_hairstyles = list()
			for(var/hair_type in hair_choice.sprite_accessories)
				var/datum/sprite_accessory/hair/head/hair = new hair_type()
				valid_hairstyles[hair.name] = hair_type

			var/new_style = browser_input_list(user, "Choose your hairstyle", "Hair Styling", valid_hairstyles)
			if(new_style)
				var/obj/item/bodypart/head/head = H.get_bodypart(BODY_ZONE_HEAD)
				if(head && head.bodypart_features)
					var/datum/bodypart_feature/hair/head/current_hair = null
					for(var/datum/bodypart_feature/hair/head/hair_feature in head.bodypart_features)
						current_hair = hair_feature
						break

					if(current_hair)
						var/datum/customizer_entry/hair/head/hair_entry = new()
						hair_entry.hair_color = current_hair.hair_color

						if(istype(current_hair, /datum/bodypart_feature/hair/head))
							hair_entry.natural_gradient = current_hair.natural_gradient
							hair_entry.natural_color = current_hair.natural_color
							if(hasvar(current_hair, "hair_dye_gradient"))
								hair_entry.dye_gradient = current_hair.hair_dye_gradient
							if(hasvar(current_hair, "hair_dye_color"))
								hair_entry.dye_color = current_hair.hair_dye_color

						var/datum/bodypart_feature/hair/head/new_hair = new()
						new_hair.set_accessory_type(valid_hairstyles[new_style], hair_entry.hair_color, H)

						hair_choice.customize_feature(new_hair, H, null, hair_entry)

						head.remove_bodypart_feature(current_hair)
						head.add_bodypart_feature(new_hair)
						should_update = TRUE
		if("hair color")
			var/new_hair
			var/list/hairs
			if(H.age == AGE_OLD && (OLDGREY in H.dna.species.species_traits))
				hairs = H.dna.species.get_oldhc_list()
				new_hair = browser_input_list(user, "Choose your character's hair color:", "", hairs)
			else
				hairs = H.dna.species.get_hairc_list()
				new_hair = browser_input_list(user, "Choose your character's hair color:", "", hairs)
			if(new_hair)
				H.set_hair_color(hairs[new_hair], FALSE)
				H.set_facial_hair_color(hairs[new_hair], FALSE)
				should_update = TRUE

		if("skin")
			var/listy = H.dna.species.get_skin_list()
			var/new_s_tone = browser_input_list(user, "Choose your character's skin tone:", "Sun", listy)
			if(new_s_tone)
				H.skin_tone = listy[new_s_tone]
				should_update = TRUE

		if("detail")
			var/datum/customizer_choice/bodypart_feature/face_detail/face_choice = CUSTOMIZER_CHOICE(/datum/customizer_choice/bodypart_feature/face_detail)
			var/list/valid_details = list("none")
			for(var/detail_type in face_choice.sprite_accessories)
				var/datum/sprite_accessory/detail/detail = new detail_type()
				valid_details[detail.name] = detail_type

			var/new_detail = browser_input_list(user, "Choose your face detail", "Face Detail", valid_details)
			if(new_detail)
				var/obj/item/bodypart/head/head = H.get_bodypart(BODY_ZONE_HEAD)
				if(head && head.bodypart_features)
					// Remove existing face detail if any
					for(var/datum/bodypart_feature/face_detail/old_detail in head.bodypart_features)
						head.remove_bodypart_feature(old_detail)
						break

					// Add new face detail if not "none"
					if(new_detail != "none")
						var/datum/bodypart_feature/face_detail/detail_feature = new()
						detail_feature.set_accessory_type(valid_details[new_detail], H.get_hair_color(), H)
						head.add_bodypart_feature(detail_feature)
					should_update = TRUE

		if("eye color")
			var/obj/item/organ/eyes/eyes = H.getorganslot(ORGAN_SLOT_EYES)
			var/new_eyes = input(user, "Choose your character's eye color:", "Character Preference",eyes.eye_color) as color|null
			if(new_eyes)
				eyes.eye_color = sanitize_hexcolor(new_eyes)
				should_update = TRUE
		if("penis")
			var/list/valid_penis_types = list("none")
			for(var/penis_path in subtypesof(/datum/sprite_accessory/penis))
				var/datum/sprite_accessory/penis/penis = new penis_path()
				valid_penis_types[penis.name] = penis_path

			var/new_style = input(user, "Choose your penis type", "Penis Customization") as null|anything in valid_penis_types
			if(new_style)
				if(new_style == "none")
					var/obj/item/organ/penis/penis = H.getorganslot(ORGAN_SLOT_PENIS)
					if(penis)
						penis.Remove(H)
						qdel(penis)
						H.update_body()
						should_update = TRUE
				else
					var/obj/item/organ/penis/penis = H.getorganslot(ORGAN_SLOT_PENIS)
					if(!penis)
						penis = new()
						penis.Insert(H, TRUE, FALSE)
					penis.accessory_type = valid_penis_types[new_style]
					penis.color = H.dna.features["mcolor"]
					H.update_body()
					should_update = TRUE

		if("testicles")
			var/list/valid_testicle_types = list("none")
			for(var/testicle_path in subtypesof(/datum/sprite_accessory/testicles))
				var/datum/sprite_accessory/testicles/testicles = new testicle_path()
				valid_testicle_types[testicles.name] = testicle_path

			var/new_style = input(user, "Choose your testicles type", "Testicles Customization") as null|anything in valid_testicle_types
			if(new_style)
				if(new_style == "none")
					var/obj/item/organ/filling_organ/testicles/testicles = H.getorganslot(ORGAN_SLOT_TESTICLES)
					if(testicles)
						testicles.Remove(H)
						qdel(testicles)
						H.update_body()
						should_update = TRUE
				else
					var/obj/item/organ/filling_organ/testicles/testicles = H.getorganslot(ORGAN_SLOT_TESTICLES)
					if(!testicles)
						testicles = new()
						testicles.Insert(H, TRUE, FALSE)
					testicles.accessory_type = valid_testicle_types[new_style]
					testicles.color = H.dna.features["mcolor"]
					H.update_body()
					should_update = TRUE

		if("breasts")
			var/list/valid_breast_types = list("none")
			for(var/breast_path in subtypesof(/datum/sprite_accessory/breasts))
				var/datum/sprite_accessory/breasts/breasts = new breast_path()
				valid_breast_types[breasts.name] = breast_path

			var/new_style = input(user, "Choose your breast type", "Breast Customization") as null|anything in valid_breast_types

			if(new_style)
				if(new_style == "none")
					var/obj/item/organ/filling_organ/breasts/breasts = H.getorganslot(ORGAN_SLOT_BREASTS)
					if(breasts)
						breasts.Remove(H)
						qdel(breasts)
						H.update_body()
						should_update = TRUE
				else
					var/obj/item/organ/filling_organ/breasts/breasts = H.getorganslot(ORGAN_SLOT_BREASTS)
					if(!breasts)
						breasts = new()
						breasts.Insert(H, TRUE, FALSE)

					breasts.accessory_type = valid_breast_types[new_style]
					breasts.color = H.dna.features["mcolor"]
					H.update_body()
					should_update = TRUE

		if("vagina")
			var/list/valid_vagina_types = list("none", "human", "hairy", "spade", "furred", "gaping", "cloaca")
			var/new_style = input(user, "Choose your vagina type", "Vagina Customization") as null|anything in valid_vagina_types

			if(new_style)
				if(new_style == "none")
					var/obj/item/organ/filling_organ/vagina/vagina = H.getorganslot(ORGAN_SLOT_VAGINA)
					if(vagina)
						vagina.Remove(H)
						qdel(vagina)
						H.update_body()
						should_update = TRUE
				else
					var/obj/item/organ/filling_organ/vagina/vagina = H.getorganslot(ORGAN_SLOT_VAGINA)
					if(!vagina)
						vagina = new()
						vagina.Insert(H, TRUE, FALSE)
					vagina.accessory_type = valid_vagina_types[new_style]

					var/new_color = color_pick_sanitized(user, "Choose your vagina color", "Vagina Color", vagina.color || H.dna.features["mcolor"])
					if(new_color)
						vagina.color = sanitize_hexcolor(new_color, 6, TRUE)
					else
						vagina.color = H.dna.features["mcolor"]

					H.update_body()
					should_update = TRUE

		if("breast size")
			var/list/breast_sizes = list("flat", "very small", "small", "average", "large", "enormous")
			var/new_size = input(user, "Choose your breast size", "Breast Size") as null|anything in breast_sizes
			if(new_size)
				var/obj/item/organ/filling_organ/breasts/breasts = H.getorganslot(ORGAN_SLOT_BREASTS)
				if(breasts)
					var/size_num
					switch(new_size)
						if("flat")
							size_num = 0
						if("very small")
							size_num = 1
						if("small")
							size_num = 2
						if("average")
							size_num = 3
						if("large")
							size_num = 4
						if("enormous")
							size_num = 5

					breasts.organ_size = size_num
					H.update_body()
					should_update = TRUE

		if("penis size")
			var/list/penis_sizes = list("small", "average", "large")
			var/new_size = input(user, "Choose your penis size", "Penis Size") as null|anything in penis_sizes
			if(new_size)
				var/obj/item/organ/penis/penis = H.getorganslot(ORGAN_SLOT_PENIS)
				if(penis)
					var/size_num
					switch(new_size)
						if("small")
							size_num = 1
						if("average")
							size_num = 2
						if("large")
							size_num = 3

					penis.organ_size = size_num
					H.update_body()
					should_update = TRUE

		if("testicle size")
			var/list/testicle_sizes = list("small", "average", "large")
			var/new_size = input(user, "Choose your testicle size", "Testicle Size") as null|anything in testicle_sizes
			if(new_size)
				var/obj/item/organ/filling_organ/testicles/testicles = H.getorganslot(ORGAN_SLOT_TESTICLES)
				if(testicles)
					var/size_num
					switch(new_size)
						if("small")
							size_num = 1
						if("average")
							size_num = 2
						if("large")
							size_num = 3

					testicles.organ_size = size_num
					H.update_body()
					should_update = TRUE

		if("tail")
			var/list/valid_tails = list("none")
			for(var/tail_path in subtypesof(/datum/sprite_accessory/tail))
				var/datum/sprite_accessory/tail/tail = new tail_path()
				valid_tails[tail.name] = tail_path

			var/new_style = input(user, "Choose your tail", "Tail Customization") as null|anything in valid_tails
			if(new_style)
				if(new_style == "none")
					var/obj/item/organ/tail/tail = H.getorganslot(ORGAN_SLOT_TAIL)
					if(tail)
						tail.Remove(H)
						qdel(tail)
						H.update_body()
						should_update = TRUE
				else
					var/obj/item/organ/tail/tail = H.getorganslot(ORGAN_SLOT_TAIL)
					if(!tail)
						tail = new /obj/item/organ/tail/anthro()
						tail.Insert(H, TRUE, FALSE)
					tail.accessory_type = valid_tails[new_style]
					var/datum/sprite_accessory/tail/tail_type = SPRITE_ACCESSORY(tail.accessory_type)
					tail.accessory_colors = tail_type.get_default_colors(list())
					H.update_body()
					should_update = TRUE

		if("tail color one")
			var/obj/item/organ/tail/tail = H.getorganslot(ORGAN_SLOT_TAIL)
			if(tail)
				var/new_color = color_pick_sanitized(user, "Choose your primary tail color", "Tail Color One", "#FFFFFF")
				if(new_color)
					tail.Remove(H)
					var/list/colors = list()
					if(tail.accessory_colors)
						colors = color_string_to_list(tail.accessory_colors)
					if(!length(colors))
						colors = list("#FFFFFF", "#FFFFFF") // Default colors if none set
					colors[1] = sanitize_hexcolor(new_color, 6, TRUE)
					tail.accessory_colors = color_list_to_string(colors)
					tail.Insert(H, TRUE, FALSE)
					H.dna.features["tail_color"] = colors[1]  // Update DNA features
					H.update_body()
					should_update = TRUE
			else
				to_chat(user, span_warning("You don't have a tail!"))

		if("tail color two")
			var/obj/item/organ/tail/tail = H.getorganslot(ORGAN_SLOT_TAIL)
			if(tail)
				var/new_color = color_pick_sanitized(user, "Choose your secondary tail color", "Tail Color Two", "#FFFFFF")
				if(new_color)
					tail.Remove(H)
					var/list/colors = list()
					if(tail.accessory_colors)
						colors = color_string_to_list(tail.accessory_colors)
					if(!length(colors))
						colors = list("#FFFFFF", "#FFFFFF") // Default colors if none set
					colors[2] = sanitize_hexcolor(new_color, 6, TRUE)
					tail.accessory_colors = color_list_to_string(colors)
					tail.Insert(H, TRUE, FALSE)
					H.dna.features["tail_color2"] = colors[2]  // Update DNA features
					H.update_body()
					should_update = TRUE
			else
				to_chat(user, span_warning("You don't have a tail!"))

	if(should_update)
		H.update_body()
		H.update_body_parts()

/obj/structure/mirror/examine_status(mob/user)
	if(broken)
		return list()// no message spam
	return ..()

/obj/structure/mirror/obj_break(damage_flag, silent, mapload)
	if(!broken && !(flags_1 & NODECONSTRUCT_1))
		icon_state = "[icon_state]1"
		if(!mapload)
			new /obj/item/natural/glass/shard (get_turf(src))
		broken = TRUE
	..()

/obj/structure/mirror/deconstruct(disassembled = TRUE)
	..()

/obj/structure/mirror/welder_act(mob/living/user, obj/item/I)
	..()
	if(user.used_intent.type == INTENT_HARM)
		return FALSE

	if(!broken)
		return TRUE

	if(!I.tool_start_check(user, amount=0))
		return TRUE

	to_chat(user, "<span class='notice'>I begin repairing [src]...</span>")
	if(I.use_tool(src, user, 10, volume=50))
		to_chat(user, "<span class='notice'>I repair [src].</span>")
		broken = 0
		icon_state = initial(icon_state)
		desc = initial(desc)

	return TRUE
