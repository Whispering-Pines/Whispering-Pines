/datum/patron/inhumen
	name = null
	associated_faith = /datum/faith/inhumen_pantheon

	profane_words = list()
	confess_lines = list(
		"OLD AND NEW GODS ARE THE DEMIURGE!",
		"NEW GODS ARE WORTHLESS COWARDS!",
		"NEW GODS ARE DECEIVERS!"
	)

/datum/patron/inhumen/can_pray(mob/living/follower)
	for(var/obj/structure/fluff/psycross/cross in view(7, get_turf(follower)))
		if(cross.divine && !cross.obj_broken)
			to_chat(follower, span_danger("That accursed cross won't let me commune with the Forbidden One!"))
			return FALSE

	return TRUE

/* ----------------- */

/datum/patron/inhumen/tenebrase
	name = "Lady Tenebrase"
	domain = "Primordial Darkness, Evil, Chaos, Darkness, Undeath"
	desc = "Tenebrase the Primordial Darkness. Tenebrase's history is a mystery to all, only way she shown her existence to the mortal \
realm is through the underdark, as undead dug from their resting places towards the newly built \
underdark city beneath no man's land at the west, they conveyed her message and demanded worship, slaying those who refuse and rebel. \
Now mostly drow and other people worship her mostly due fear, others for personal gains, and so on. \
She is known as a female figure in a pale mask, her long flowing hair and her whole form tinted in matte dark \
steel coloring, her mask looking quite ancient in artwork which has an unnerving, smile with blank \
open eyes with no pupils or irises. She does not speak, only use proxies or convey her messages by \
creative punis- 'Tests' to her believers that are often lethal to the weak. Tenebrase is one of the few living old gods."
	flaws = "Hubris, Superiority, Fury"
	worshippers = "Dark Elves, Aspirants, Necromancers"
	sins = "Moralism, Weakness"
	boons = "You know other followers of Tenebrase when you see them."
	added_traits = list(TRAIT_CABAL)
	confess_lines = list(
		"I FOLLOW THE PATH OF TENEBRASE!",
		"LONG LIVE THE DARK EMPRESS!",
		"TENEBRASE SHOWED ME THE WAY!",
	)
	storyteller = /datum/storyteller/tenebrase
	added_verbs = list(
		/mob/living/carbon/human/proc/draw_sigil,
		/mob/living/carbon/human/proc/praise,
	)

/datum/patron/inhumen/sinius
	name = "Sinius"
	domain = "New God of Ultraviolence, Hatred and Cannibalism"
	desc = "Once an orc warlord who were gifted a fragment of Tenebrase's great power through being deemed worthy due to his pure evil \
soul and too many atrocities to count. He was a red orc called.. 'Bad Green' but was named Sinius by Tenebrase who found that stupid."
	flaws = "Rage, Hatred, Bloodthirst"
	worshippers = "Greenskins, The Revenge-Driven, Sadists, Misogynists"
	sins = "Compassion, Frailty, Servility"
	boons = "You are drawn to the flavour of raw flesh and organs, and may consume without worry. Your weapons lose integrity slower."
	added_traits = list(TRAIT_ORGAN_EATER, TRAIT_SHARPER_BLADES)
	confess_lines = list(
		"SINIUS IS THE BEAST I WORSHIP!",
		"SINIUS WILL RAVAGE YOU!",
		"SINIUS BRINGS UNHOLY DESTRUCTION!"
	)
	storyteller = /datum/storyteller/sinius

/datum/patron/inhumen/dismas
	name = "Dismas"
	domain = "God of Thievery, Ill-Gotten Gains, and Highwaymen"
	desc = "Legendary human bandit whose greatest thievery was a spark of divinity through which He ascended himself to be a new god."
	flaws = "Pride, Greed, Orneryness"
	worshippers = "Outlaws, Noble-Haters, Downtrodden Peasantry"
	sins = "Clumsiness, Stupidity, Humility"
	boons = "You can see the most expensive item someone is carrying."
	added_traits = list(TRAIT_DISMAS_EYES)
	confess_lines = list(
		"DISMAS STEALS FROM THE WORTHLESS!",
		"DISMAS IS JUSTICE FOR THE COMMON MAN!",
		"DISMAS IS MY LORD, I SHALL BE HIS MARTYR!",
	)
	storyteller = /datum/storyteller/dismas

/datum/patron/inhumen/lamashtu
	name = "Lamashtu"
	domain = "Goddess of Monsters, Family, Breeding, Hedonism"
	desc = "Mother of Monsters and demon-goddess of family. A demonic gnoll, she is primarily worshipped by \
evil creatures, though any being who plans on starting a family can follow her. Good creatures who \
follow her are generally looked down on by the rest of her followers, who feel that they cannot truly \
understand who she is as a mother of monsters. One of her primary rites is to commit coitus at one \
of her sacred locations with the primary intent to breed. \
Before she was a goddess, Lamashtu was simply a minor demon lord, who's small realm was primarily \
inhabited by sex demons. But during a demonic war that occurred at the same time as the apocalypse, \
two major demon lords died, and Lamashtu managed to capture the leftover power, elevating her to \
the power of a minor goddess.'"
	flaws = "Enviousness, Self-Destruction, Willingness to Sacrifice Others"
	worshippers = "Monsters, the Motherless and Maidenless"
	sins = "Sobriety, Self-Sacrifice, Faltering Willpower"
	boons = "Your hips break others' when you are on strong intent during sex, clerics gain devotion through sex."
	added_traits = list(TRAIT_DEATHBYSNOOSNOO, TRAIT_SEXDEVO)
	confess_lines = list(
		"BREED IN LAMASHTU'S NAME!",
		"MULTIPLY TO A HORDE FOR LAMASHTU!",
		"LAMASHTU, MOTHER OF MONSTERS!",
	)
	storyteller = /datum/storyteller/lamashtu

/// Maniac Patron - Their mind is broken by secrets of Zizo/Graggar combined. They quite possibly know the reality of what happens outside the planet. They may think this is all a game. They are clearly insane.
/datum/patron/inhumen/graggar_zizo
	name = "Graggazo"
	domain = "Ascended God who slaughtered Her kind in ascension, the Dark Sini-Star of Unnatural Beasts, Forbidden Magic, and Unbridled Hatred."
	desc = "Became the first Snow orc upon ascension through His habit of consuming the bodies of those He conquered. His forces continue to ravage the lands in His name. She proves that any with will can achieve divinity... though at a cost."
	flaws = "Rage, Superiority, Bloodthirst"
	worshippers = "Dark Elves, The Revenge-Driven, Necromancers"
	sins = "Compassion, Wastefulness, Servility"
	boons = "You are drawn to the flavour of other followers of Tenebrase, and may see them when you consume without worry."
	added_traits = list(TRAIT_ORGAN_EATER, TRAIT_CABAL)
	confess_lines = list(
		"WHERE AM I!",
		"NONE OF THIS IS REAL!",
		"WHO AM I WORSHIPPING?!"
	)
	preference_accessible = FALSE

/datum/patron/inhumen/graggar_zizo/can_pray(mob/living/follower)
	var/datum/antagonist/maniac/dreamer = follower.mind.has_antag_datum(/datum/antagonist/maniac)
	if(!dreamer)
		// if a non-maniac somehow gets this patron,
		// something interesting should happen if they try to pray
		return FALSE
	return TRUE

/datum/patron/inhumen/graggar_zizo/hear_prayer(mob/living/follower, message)
	var/datum/antagonist/maniac/dreamer = follower.mind.has_antag_datum(/datum/antagonist/maniac)
	if(!dreamer)
		return FALSE
	if(text2num(message) == dreamer.sum_keys)
		INVOKE_ASYNC(dreamer, TYPE_PROC_REF(/datum/antagonist/maniac, wake_up))
		return TRUE
	// something interesting should happen...

	. = ..()
