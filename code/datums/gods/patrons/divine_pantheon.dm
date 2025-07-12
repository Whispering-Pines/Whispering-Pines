/datum/patron/divine
	name = null
	associated_faith = /datum/faith/divine_pantheon
	t0 = /datum/action/cooldown/spell/healing

/datum/patron/divine/can_pray(mob/living/follower)
	//you can pray anywhere inside a church
	if(istype(get_area(follower), /area/rogue/indoors/town/church))
		return TRUE

	for(var/obj/structure/fluff/psycross/cross in view(4, get_turf(follower)))
		if(!cross.obj_broken)
			return TRUE

	to_chat(follower, span_danger("I need a nearby Pantheon Cross for my prayers to be heard..."))
	return FALSE

/* ----------------- */

/datum/patron/divine/astrata
	name = "Lady Solaria"
	domain = "Primordial Radiance, Stars, Good, Life"
	desc = "Solaria the Primordial Radiance, old goddess of the stars therefore the sun and all goodness. One of the few live old gods remaining. She took the crown of new heaven through having no contestants left alive beside Tenebrase, and the new gods who are not of such power of old gods. She appears to be a female humanoid silhouette of pure blinding, hot starlight with long flowing hair."
	flaws = "Tyrannical, Ill-Tempered, Uncompromising"
	worshippers = "Nobles, Zealots, Commoners"
	sins = "Betrayal, Sloth, Witchcraft"
	boons = "Your stamina regeneration delay is lowered during daytime and your weapons lose less integrity."
	added_traits = list(TRAIT_APRICITY, TRAIT_SHARPER_BLADES)
	t0 = /datum/action/cooldown/spell/sacred_flame
	t1 = /datum/action/cooldown/spell/healing/greater
	t2 = /datum/action/cooldown/spell/invoked/projectile/fireball
	t3 = /datum/action/cooldown/spell/revive
	confess_lines = list(
		"SOLARIA IS MY LIGHT!",
		"SOLARIA BRINGS LAW!",
		"I SERVE THE GLORY OF THE SUN!",
	)
	storyteller = /datum/storyteller/astrata

/datum/patron/divine/noc
	name = "Lunaria"
	domain = "Goddess of Moon, Moonlight and Clarity."
	desc = "New goddess of night and moon, Said to be the one who gifted mankind with arcane knowledge and affinity of magic after her becoming of a new god. Her flowing hair looks as white as snow and her face divine. Those cold crystal clear eyes are a glowing icey blue  and such seems to be the theme for her body, cold, lithe, yet powerful. She has modest assets for a divine being of this world at least compared to everything else that exists. She appears consistently nude... Moonbeam is her best friend."
	flaws = "Exhibitionism, Isolationism, Unfiltered Honesty"
	worshippers = "Magic Practitioners, Scholars, Scribes"
	sins = "Suppressing Truth, Becoming addicted."
	boons = "You enjoy night time more than others."
	added_traits = list(TRAIT_NIGHT_OWL)
	t0 = /datum/action/cooldown/spell/status/vigorous_craft
	t1 = /datum/action/cooldown/spell/status/invisibility
	t2 = /datum/action/cooldown/spell/blindness/miracle
	t3 = /datum/action/cooldown/spell/projectile/moonlit_dagger
	confess_lines = list(
		"LUNARIA IS NIGHT!",
		"LUNARIA SEES THE TRUTH!",
		"I SEEK THE MYSTERIES OF THE MOON!",
	)
	storyteller = /datum/storyteller/noc

/datum/patron/divine/dendor
	name = "Blissrose"
	domain = "God of the forest and nature."
	desc = "Blissrose the Plantmother,The first plantoid to ever exist, created by radiation mutating a certain narcotic plant, Blissrose is almost solely responsible for recovery of the world to be the 'new world' over raping (sometimes consensually mating) survivors for centuries, using the produced seeds to regrow whole forests in time, also mother or grandmother of -all- the rare plantpeople, taled to control the whole world's forests for this reason, she was considered powerful and significant enough to be a 'deity'. She represents instincts, animalism and true nature with her actions, generally worshipped and praised for everything the forest offers, as they all came from her in the end, causing travelers to sometimes leave gifts at the nudist village in heart of the forest."
	flaws = "Animalism, Uncivilization, Disorderliness"
	worshippers = "Druids, Beasts, Farmers"
	sins = "Deforestation, Disrespecting Nature"
	boons = "You are immune to kneestingers, and drug overdoses."
	added_traits = list(TRAIT_KNEESTINGER_IMMUNITY, TRAIT_CRACKHEAD)
	t0 = /datum/action/cooldown/spell/undirected/bless_crops
	t1 = /datum/action/cooldown/spell/undirected/beast_sense
	t2 = /obj/effect/proc_holder/spell/invoked/cure_rot
	t3 = /datum/action/cooldown/spell/beast_tame
	confess_lines = list(
		"BLISSROSE PROVIDES!",
		"THE PLANTMOTHER BRINGS BOUNTY!",
		"I ANSWER THE CALL OF THE WILD!",
	)
	storyteller = /datum/storyteller/dendor

/datum/patron/divine/abyssor
	name = "Abyssor"
	domain = "God of Seas and Storms"
	desc = "Crafted from the blood of Psydon as sovereign of the waters. Enraged by ignorance of Him from followers of New gods."
	flaws= "Reckless, Stubborn, Destructive"
	worshippers = "Sailors of the Sea and Sky, Horrid Sea-Creachers, Fog Islanders"
	sins = "Fear, Hubris, Forgetfulness"
	boons = "Leeches will drain very little of your blood."
	added_traits = list(TRAIT_LEECHIMMUNE)
	t1 = /datum/action/cooldown/spell/projectile/swordfish
	t2 = /datum/action/cooldown/spell/undirected/conjure_item/summon_trident
	t3 = /datum/action/cooldown/spell/ocean_embrace
	confess_lines = list(
		"ABYSSOR COMMANDS THE WAVES!",
		"THE OCEAN'S FURY IS ABYSSOR'S WILL!",
		"I AM DRAWN BY THE PULL OF THE TIDE!",
	)
	storyteller = /datum/storyteller/abyssor
	preference_accessible = FALSE //not made into lore accurate god yet

/datum/patron/divine/necra
	name = "Last Death"
	domain = "Death, Souls, Afterlife, Necromancy"
	desc = "The Kin-Killer, After the Holy War which created the universe out of it's ashes and fire. After only a handful of the ancient gods being left, He picked them off one by one to kill who he found old minded for a new time. It's said they forced old Goddess of Life in blade-point to give life to his undead creations, making an abomination at first.. half undead half living beings that gave birth to fully living 'resurgentis' in time."
	flaws = "Pessimistic, Wrathful"
	worshippers = "Resurgentis, Morticians, Mourners, Clerical Necromancers"
	sins = "Heretical Magic, Disturbance of Rest for personal gains."
	boons = "You may see the presence of a soul in a body and eat raw meat."
	added_traits = list(TRAIT_SOUL_EXAMINE, TRAIT_ORGAN_EATER)
	t0 = /datum/action/cooldown/spell/burial_rites
	t1 = /datum/action/cooldown/spell/undirected/soul_speak
	t2 = /datum/action/cooldown/spell/aoe/churn_undead
	t3 = /datum/action/cooldown/spell/revive
	confess_lines = list(
		"ALL SOULS FIND THEIR WAY TO THE LAST DEATH!",
		"THE UNNAMED IS OUR FINAL REPOSE!",
		"I FEAR NOT DEATH, HE AWAITS!",
	)
	storyteller = /datum/storyteller/necra

/datum/patron/divine/ravox
	name = "Wanderer"
	domain = "God of the Desert, Travel, and Leadership"
	desc = "The Nomad King. Before his acension to godhood the wanderer was a blind human, gifted with astral sight which he used to guide his tribe through the desert. \
He grew to lead the tribe completely as he never lost his way in the eternal dunes, more and more flocked to him as he found water when all was dry and \
shelter when the sands flew.  Eventualy he held complete dominance over all the desert tribes and \
formed Crater city, a place for all nomads to come and rest from the harsh deserts.  His death by what \
most assume to be natural causes along with his near diefication by his followers lead him to \
accend to the astral plane as the god of the desert where he has watched over all who dwell there, even as evil creeps into his domain."
	flaws = "Carelessness, Aggression, Pride"
	worshippers = "Nomads, Leaders, Tribals"
	sins = "Tyranny, Cruelty"
	boons = "Your used weapons dull slower."
	added_traits = list(TRAIT_SHARPER_BLADES)
	t0 = /datum/action/cooldown/spell/undirected/call_to_arms
	t1 = /datum/action/cooldown/spell/undirected/divine_strike
	t2 = /datum/action/cooldown/spell/persistence
	t3 = /datum/action/cooldown/spell/heat_metal
	confess_lines = list(
		"WANDERER GUIDE ME!",
		"BURNING SANDS AGAINST MY SKIN!",
		"WANDERER PROTECTS!",
	)
	storyteller = /datum/storyteller/ravox

/datum/patron/divine/xylix
	name = "Xylix"
	domain = "Diety of Trickery, Freedom, and Inspiration"
	desc = "Crafted from the silver tongue of Psydon. Xylix is a force of change and deceit, yet allows little known of their gender let alone presence."
	flaws = "Petulance, Deception, Gambling-Prone"
	worshippers = "Cheats, Performers, The Hopeless"
	sins = "Boredom, Predictability, Routine"
	boons = "You can rig different forms of gambling in your favor."
	added_traits = list(TRAIT_BLACKLEG)
	t1 = /datum/action/cooldown/spell/undirected/list_target/vicious_mimicry
	t2 = /datum/action/cooldown/spell/status/wheel
	confess_lines = list(
		"SOLARIA IS MY LIGHT!",
		"LUNARIA IS NIGHT!",
		"BLISSROSE PROVIDES!",
		"ABYSSOR COMMANDS THE WAVES!",
		"WANDERER IS JUSTICE!",
		"ALL SOULS FIND THEIR WAY TO LAST DEATH!",
		"HAHAHAHA! AHAHAHA! HAHAHAHA!", //the only xylix-related confession
		"PESTRA SOOTHES ALL ILLS!",
		"MALUM IS MY FORGE!",
		"MOONBEAM BRINGS US TOGETHER!",
	)
	storyteller = /datum/storyteller/xylix
	preference_accessible = FALSE //not made into lore accurate god yet

/datum/patron/divine/pestra
	name = "Pestra"
	domain = "Goddess of Disease, Alchemy, and Medicine"
	desc = "A mistake; Psydon's intestines left behind. She slithered out, bringing forth the cycle of life and decay."
	flaws = "Drunkenness, Crudeness, Irresponsibility"
	worshippers = "The Ill and Infirm, Alchemists, Physicians"
	sins = "´Curing´ Abnormalities, Refusing to Help Unfortunates, Groveling"
	boons = "You may consume rotten food without being sick."
	added_traits = list(TRAIT_ROT_EATER)
	t0 = /datum/action/cooldown/spell/diagnose/holy
	t1 = /datum/action/cooldown/spell/healing
	t2 = /datum/action/cooldown/spell/attach_bodypart
	t3 = /datum/action/cooldown/spell/cure_rot
	confess_lines = list(
		"PESTRA SOOTHES ALL ILLS!",
		"DECAY IS A CONTINUATION OF LIFE!",
		"MY AFFLICTION IS MY TESTAMENT!",
	)
	storyteller = /datum/storyteller/pestra
	preference_accessible = FALSE //not made into lore accurate god yet

/datum/patron/divine/malum
	name = "Malum"
	domain = "God of Toil, Innovation, and Creation"
	desc = "Crafted from the hands of Psydon. He would later use his own to construct wonderous inventions."
	flaws = "Obsessive, Exacting, Overbearing"
	worshippers = "Smiths, Miners, Sculptors"
	sins = "Cheating, Shoddy Work, Suicide"
	boons = "You recover more energy when sleeping."
	added_traits = list(TRAIT_BETTER_SLEEP)
	t1 = /datum/action/cooldown/spell/status/vigorous_craft
	t2 = /datum/action/cooldown/spell/hammer_fall
	t3 = /datum/action/cooldown/spell/heat_metal
	confess_lines = list(
		"MALUM IS MY FORGE!",
		"TRUE VALUE IS IN THE TOIL!",
		"I AM AN INSTRUMENT OF CREATION!",
	)
	storyteller = /datum/storyteller/malum
	preference_accessible = FALSE //not made into lore accurate god yet

/datum/patron/divine/eora
	name = "Lady Moonbeam"
	domain = "Goddess of Dreams, Illusion, Pleasure."
	desc = "The Dream Goddess. Initially a human psion, she named herself 'Moonbeam', as her favorite thing in the mortal world that didn't leave her until her death. Eventually finding what's remaining of an old god in the astral plane with still strange traces of lewd energy... she takes it, being filled with all of the universe's secrets without -fully- losing her mind. She returned to the astral plane and began building her astral 'dreamland' empire out of people's sweetest dreams... Or wet, whatever pleases the wandering dreamer... she remains a bodiless, astral form taking on an ever-changing cosmic body when she must be seen. Often not speaking, but showing, finding that easier to express herself, her forms often have no mouth, but white glowing wide eyes to take attention, Her most common appearance would be that of a female humanoid shaped pattern of stars and cosmos with flowing hair."
	flaws= "Naivete, Impulsiveness, Slight madness, libido"
	worshippers = "Illusionists, Dreamers, Perverts"
	sins = "Sadism, Abandonment, Spreading illness purposefully."
	boons = "You gain more sleep experience, you are better in bed."
	added_traits = list(TRAIT_TUTELAGE, TRAIT_GOODLOVER, TRAIT_SEXDEVO)
	t0 = /datum/action/cooldown/spell/instill_perfection
	t1 = /datum/action/cooldown/spell/projectile/eora_curse
	t2 = /datum/action/cooldown/spell/status/invisibility
	t3 = /datum/action/cooldown/spell/blindness/miracle
	confess_lines = list(
		"TAKE ME TO YOUR ASTRAL EMBRACE!",
		"MOONBEAM, WAKE ME FROM THIS BAD DREAM!",
		"LIFE IS INVALUABLE!",
	)
	storyteller = /datum/storyteller/eora
