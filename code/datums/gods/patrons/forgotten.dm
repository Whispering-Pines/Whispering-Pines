/datum/patron/psydon
	name = "Old Gods"
	display_name = "Old Gods"
	domain = "Creation through sparks of holy war."
	desc = "All the old gods, either hidden, killed in the holy war or by the last death in his genocide. The true gods who created all that is known or not. This is the true way and our belief will bring them back."
	flaws = "Egoist, Conflicting, Chaotic"
	worshippers = "Old worlders, Historians"
	sins = "Apostasy, Demon Worship"
	boons = "None."
	associated_faith = /datum/faith/old_gods
	confess_lines = list(
		"THERE IS ONLY OLD GODS!",
		"THE SUCCESSORS KILLED TRUE GODS!",
		"THEY WILL RETURN!",
	)

/datum/patron/psydon/can_pray(mob/living/carbon/human/follower)
	//We just kind of assume the follower is a human here
	if(istype(follower.wear_neck, /obj/item/clothing/neck/psycross))
		return TRUE

	to_chat(follower, span_danger("I can not talk to them... I need His cross on my neck!"))
	return FALSE

/datum/patron/psydon/progressive
	display_name = "Old Gods (Progressive)"
	desc = "Last Death killed the old gods who would have unmade the universe through their never ending conflict, their descendants carry their spark of divinity and are part of them."
	flaws = "Fatalistic, Sentimental, Acquiescent"
	worshippers = "Idealistic Dreamers, Optimists, Diplomats"
	confess_lines = list(
		"OLD GODS ARE THE RIGHTFUL GODS!",
		"THE SUCCESSORS ARE THEIR MANIFESTATIONS!",
		"THROUGH THE NEW, OLD LIVES!",
	)
