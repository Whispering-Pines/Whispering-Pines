/// Admin proc to apply or remove blessings from a character
/// Supports timed expiration, auto-removal on sleep, and dynamic flavor text injection
/datum/admins/proc/admin_bless(mob/living/carbon/human/M in GLOB.mob_list)
	set name = "Bless"
	set desc = "Bless or lift a blessing from a character"
	set category = "GameMaster"

	if(!check_rights())
		return FALSE

	var/category = input("Select Blessing Category") as null|anything in list("Divine", "Food", "Special", "Mending")
	if(!category)
		return FALSE

	var/blessing_path
	switch(category)
		if("Divine")
			blessing_path = input("Choose Divine Blessing") as null|anything in list( \
				/datum/status_effect/buff/noc, \
				/datum/status_effect/buff/ravox, \
				/datum/status_effect/buff/beastsense, \
				/datum/status_effect/buff/trollshape, \
				/datum/status_effect/buff/divine_beauty, \
				/datum/status_effect/buff/call_to_arms, \
				/datum/status_effect/buff/craft_buff)
		if("Food")
			blessing_path = input("Choose Food Blessing") as null|anything in list( \
				/datum/status_effect/buff/foodbuff, \
				/datum/status_effect/buff/clean_plus)
		if("Special")
			blessing_path = input("Choose Special Blessing") as null|anything in list( \
				/datum/status_effect/buff/featherfall, \
				/datum/status_effect/buff/darkvision, \
				/datum/status_effect/buff/haste, \
				/datum/status_effect/buff/calm, \
				/datum/status_effect/buff/barbrage)
		if("Mending")
			var/mending_amount = input("Choose Lifeblood Amount") as null|anything in list(5, 10, 15, 20, 25, 30)
			if(!mending_amount)
				return FALSE

			if(!M || !M.reagents)
				to_chat(usr, span_warning("[M] has no reagent container."))
				return FALSE

			M.reagents.add_reagent(/datum/reagent/medicine/stronghealth, mending_amount)
			var/patron_name = (M.patron && istype(M.patron)) ? M.patron.name : "a divine presence"
			to_chat(M, span_nicegreen("You feel your body renewing. [patron_name] has renewed your body with temporary divinity."))
			to_chat(usr, span_notice("You mended [M] with [mending_amount] units of Lifeblood."))
			log_admin("[key_name(usr)] mended [key_name(M)] with [mending_amount] units of Lifeblood.")
			return TRUE

	if(!blessing_path)
		return FALSE

	var/duration_choice = input("Select Duration for the Blessing:") as null|anything in list( \
		"1 Minute", "5 Minutes", "10 Minutes", "20 Minutes", \
		"30 Minutes", "60 Minutes", "Until Sleep", "Infinite")
	if(!duration_choice)
		return FALSE

	var/until_sleep = FALSE
	var/duration = -1
	switch(duration_choice)
		if("1 Minute") duration = 1 MINUTES
		if("5 Minutes") duration = 5 MINUTES
		if("10 Minutes") duration = 10 MINUTES
		if("20 Minutes") duration = 20 MINUTES
		if("30 Minutes") duration = 30 MINUTES
		if("60 Minutes") duration = 60 MINUTES
		if("Until Sleep") until_sleep = TRUE
		if("Infinite") duration = -1

	/// Apply Blessing
	if(M.apply_status_effect(blessing_path))
		message_admins(span_notice("Admin [key_name_admin(usr)] blessed [key_name_admin(M)] with [blessing_path]! Duration: [duration_choice]."))
		log_admin("[key_name(usr)] blessed [key_name(M)] with [blessing_path] for [duration_choice].")

		M.playsound_local(get_turf(M), 'sound/magic/bless.ogg', 100, FALSE)

		var/flavor_text = get_patron_blessing_text(M, blessing_path)
		if(flavor_text)
			to_chat(M, span_nicegreen("[flavor_text]"))

		/// Set actual expiration if needed (manual override for duration_modification types)
		if(duration > 0)
			M.start_blessing_duration_timer(blessing_path, duration)

		if(until_sleep)
			M.start_blessing_sleep_monitor(blessing_path)

		var/alert_desc = flavor_text ? span_nicegreen("[flavor_text]") : span_nicegreen("A divine force blesses you!")
		M.modify_blessing_alert_desc(blessing_path, alert_desc)

		return TRUE

	/// Toggle Off: Remove if present
	else if(M.remove_status_effect(blessing_path))
		message_admins(span_notice("Admin [key_name_admin(usr)] lifted blessing [blessing_path] from [key_name_admin(M)]!"))
		log_admin("[key_name(usr)] lifted blessing [key_name(M)] from [blessing_path].")
		return TRUE

	return FALSE


/// Starts a timer to auto-remove the blessing after duration expires
/mob/living/proc/start_blessing_duration_timer(blessing_path, duration)
	spawn(duration)
		if(has_status_effect(blessing_path))
			remove_status_effect(blessing_path)
			to_chat(src, span_warning("Your blessing fades with time..."))

/// Monitors if the mob falls asleep, removing the blessing if so
/mob/living/proc/start_blessing_sleep_monitor(blessing_path)
	spawn while(has_status_effect(blessing_path))
		if(IsSleeping())
			remove_status_effect(blessing_path)
			to_chat(src, span_warning("Your blessing fades as you fall asleep..."))
			return
		sleep(10)  /// Adjust check frequency as needed

/// Dynamically modifies the alert description for the active blessing
/// Can be used to customize Trollshape or any other active buff's description
/mob/living/proc/modify_blessing_alert_desc(blessing_path, new_desc)
	if(!blessing_path || !new_desc)
		return FALSE

	var/datum/status_effect/B = get_status_effect(blessing_path)
	if(!B || !B.alert_type)
		to_chat(src, span_warning("No active buff or invalid blessing path found to modify."))
		return FALSE

	for(var/atom/movable/screen/alert/A in client.screen)
		if(istype(A, B.alert_type))
			A.desc = new_desc
			//to_chat(src, span_notice("Blessing visual updated: [new_desc]"))
			return TRUE

	to_chat(src, span_warning("Could not find active alert instance for the blessing."))
	return FALSE

/// Returns the active status effect datum for the given type if it exists on the mob
/mob/living/proc/get_status_effect(path)
	if(!status_effects)
		return null
	for(var/datum/status_effect/B in status_effects)
		if(istype(B, path))
			return B
	return null

/// Returns the immersive flavor text based on both the target's patron and the specific blessing applied
/// Falls back to generic patron text or a default generic divine message
/// Returns the immersive flavor text based on both the target's patron and the specific blessing applied
/// Fully extended for Abyssor, Solaria, Lamashtu, Blissrose, Moonbeam, Sinius, Malum, Dismas, Last Death, Lunaria, Pestra, Wanderer, Xylix, Tenebrase
/proc/get_patron_blessing_text(mob/living/carbon/human/M, blessing_path)
	var/patron_type = M.patron?.type
	if(!patron_type)
		return "A divine force surges through you, wrapping your soul in unseen power."

	/// Specific god -> specific blessing mapping
	var/static/list/blessing_flavor = list(
		/// Abyssor – The Sunken God
		/datum/patron/divine/abyssor = list(
			/datum/status_effect/buff/beastsense = "Abyssor whispers: \"The sea calls yer senses forth. Smell tha salt, taste tha fear.\"",
			/datum/status_effect/buff/trollshape = "Abyssor groans: \"The abyss grants form... and hungers fer more.\"",
			/datum/status_effect/buff/divine_beauty = "Abyssor rumbles: \"Even beauty drowns. But fer now, ye rise.\"",
			/datum/status_effect/buff/call_to_arms = "Abyssor intones: \"The currents surge. Ya follow, or ya sink like a fockin' hog.\"",
			/datum/status_effect/buff/craft_buff = "Abyssor echoes: \"Stone crumbles, but tha deep remembers yer craft.\"",
			/datum/status_effect/buff/foodbuff = "Abyssor bubbles: \"Eat... but know tha sea waits to feast in turn.\"",
			/datum/status_effect/buff/clean_plus = "Abyssor sighs: \"Saltwater cleanses shite from tha deck. Have a good wash.\"",
			/datum/status_effect/buff/featherfall = "Abyssor murmurs: \"Float like a driftin' log.\"",
			/datum/status_effect/buff/darkvision = "Abyssor growls: \"See through thickest of storms, lil'un.\"",
			/datum/status_effect/buff/haste = "Abyssor growls: \"Flee if ya must... the sea is patient.\"",
			/datum/status_effect/buff/calm = "Abyssor whispers: \"Still yerself. Think of shiftin' waves.\"",
			/datum/status_effect/buff/barbrage = "Abyssor bellows: \"Like the fockin' storm tide, break 'em'! Break tha bastards! Makin' mah blood boil!\""
		),

		/// (Repeat this block, tailored for each god)
		/// Solaria - The Sun Queen
		/datum/patron/divine/astrata = list(
			/datum/status_effect/buff/beastsense = "Solaria commands: \"LET YOUR SIGHT BE CLEARED. THE LIGHT REVEALS ALL.\"",
			/datum/status_effect/buff/trollshape = "Solaria proclaims: \"BECOME THE HAMMER OF MINE WILL. STRIKE WITH PURPOSE.\"",
			/datum/status_effect/buff/divine_beauty = "Solaria speaks: \"RADIATE YOUR DUTY. LET NONE AVERT THEIR GAZE.\"",
			/datum/status_effect/buff/call_to_arms = "Solaria bellows: \"RISE, O RIGHTEOUS ONE. MARCH TO GLORY IN MINE NAME.\"",
			/datum/status_effect/buff/craft_buff = "Solaria declares: \"LET THINE HANDS BUILD THAT WHICH SHALL ENDURE.\"",
			/datum/status_effect/buff/foodbuff = "Solaria blesses: \"FEAST AND GROW STRONG BENEATH MINE EVER-WATCHFUL GAZE.\"",
			/datum/status_effect/buff/clean_plus = "Solaria proclaims: \"THE LIGHT CLEANSES ALL. DIRT SHALL NOT ENDURE.\"",
			/datum/status_effect/buff/featherfall = "Solaria commands: \"ASCEND, FOR THOU ART WORTHY OF HEIGHT.\"",
			/datum/status_effect/buff/darkvision = "Solaria scoffs: \"SHADOWS ARE FOR THE FAINT. THOU NEEDST THEM NOT.\"",
			/datum/status_effect/buff/haste = "Solaria orders: \"SWIFT BE YOUR FEET. DUTY BROOKS NO DELAY.\"",
			/datum/status_effect/buff/calm = "Solaria whispers: \"BE STILL. THE SUN KEEPS YOU SAFE.\"",
			/datum/status_effect/buff/barbrage = "Solaria declares: \"LET YOUR RIGHTEOUS FURY BURN AS MINE SUN DOES.\""
		),

		/// Lamashtu - The Mad God
		/datum/patron/inhumen/baotha = list(
			/datum/status_effect/buff/beastsense = "Lamashtu shrieks: \"See it! Smell it! Rip it apart! Or hug it! Both are valid!\"",
			/datum/status_effect/buff/trollshape = "Lamashtu howls: \"Perfect. You’re gonna cause SUCH a scene!\"",
			/datum/status_effect/buff/divine_beauty = "Lamashtu swoons: \"Beauty fit for a queen. I'd know.\"",
			/datum/status_effect/buff/call_to_arms = "Lamashtu cackles: \"Ready to finally have some FUN?\"",
			/datum/status_effect/buff/craft_buff = "Lamashtu snorts: \"Glue it wrong? Regardless of if it works, it’s ART!\"",
			/datum/status_effect/buff/foodbuff = "Lamashtu hoots: \"Eat it, snort it! What could go wrong?\"",
			/datum/status_effect/buff/clean_plus = "Lamashtu coughs: \"CLEAN? Hah! Let’s see how long it lasts, little neat freak. Have some fuuun!\"",
			/datum/status_effect/buff/featherfall = "Lamashtu sings: \"Don't wanna live in fear and loathing; I wanna feel like I am floating.\"",
			/datum/status_effect/buff/darkvision = "Lamashtu giggles: \"Oooo, secrets! Don’t blink or you’ll miss the eyes!\"",
			/datum/status_effect/buff/haste = "Lamashtu screams: \"Dance like nobody cares! They don't! But I do. You're beautiful, darling. Beautiful.\"",
			/datum/status_effect/buff/calm = "Lamashtu reassures: \"Sink into the serenity of mindlessness. I'm here for you, when no-one else is.\"",
			/datum/status_effect/buff/barbrage = "Lamashtu squeals: \"BREAK SOMETHING BEAUTIFUL! Be someone beautiful. It’s therapeutic!\""
		),

		/// Blissrose - The Wildfather
		/datum/patron/divine/dendor = list(
			/datum/status_effect/buff/beastsense = "Blissrose growls: \"Beasts... hunting? Yes, of course.\"",
			/datum/status_effect/buff/trollshape = "Blissrose mutters: \"Ah. I do recall making one of these, right?\"",
			/datum/status_effect/buff/divine_beauty = "Blissrose sighs: \"Bloom... Blooming and pollen.\"",
			/datum/status_effect/buff/call_to_arms = "Blissrose grumbles: \"Huh? Fighting..? Defend your forest.\"",
			/datum/status_effect/buff/craft_buff = "Blissrose states: \"Making something..? Don't hurt the trees, hm?\"",
			/datum/status_effect/buff/foodbuff = "Blissrose grunts: \"Eat. Eating good.\"",
			/datum/status_effect/buff/clean_plus = "Blissrose rasps: \"You wipe the rot... but it returns.\"",
			/datum/status_effect/buff/featherfall = "Blissrose chuckles: \"Fallin' leaves. Yah! You're like that. Heh.\"",
			/datum/status_effect/buff/darkvision = "Blissrose growls: \"See the dark roots..\"",
			/datum/status_effect/buff/haste = "Blissrose grumbles: \"Run fast. The wolves do.\"",
			/datum/status_effect/buff/calm = "Blissrose breathes: \"Wind flows. Calming?\"",
			/datum/status_effect/buff/barbrage = "Blissrose growls: \"GRRR! It's dancing time!\""
		),

		/// Moonbeam - The Heart of Psydon
		/datum/patron/divine/eora = list(
			/datum/status_effect/buff/beastsense = "Moonbeam whispers: \"Even the beasts know love's call.\"",
			/datum/status_effect/buff/trollshape = "Moonbeam coos: \"Strong arms, tender heart.\"",
			/datum/status_effect/buff/divine_beauty = "Moonbeam smiles: \"You shine, beloved. All gaze upon you with wonder.\"",
			/datum/status_effect/buff/call_to_arms = "Moonbeam urges: \"Fight for love. For them.\"",
			/datum/status_effect/buff/craft_buff = "Moonbeam hums: \"Hands that build with love make wonders eternal.\"",
			/datum/status_effect/buff/foodbuff = "Moonbeam sings: \"Eat well, my sweet. Love fuels you.\"",
			/datum/status_effect/buff/clean_plus = "Moonbeam beams: \"I wash away your hurts, my dear.\"",
			/datum/status_effect/buff/featherfall = "Moonbeam hums: \"Softly now. I hold you.\"",
			/datum/status_effect/buff/darkvision = "Moonbeam comforts: \"See even where light fears to go.\"",
			/datum/status_effect/buff/haste = "Moonbeam nudges: \"Hurry, beloved. They wait for you.\"",
			/datum/status_effect/buff/calm = "Moonbeam soothes: \"Hush... Breathe... You are safe.\"",
			/datum/status_effect/buff/barbrage = "Moonbeam whispers: \"Love rages too. Protect what’s yours.\""
		),

		/// Sinius - The Warborn Beast
		/datum/patron/inhumen/graggar = list(
			/datum/status_effect/buff/beastsense = "Sinius growls: \"Sniff it. Smell the fear, thu fool.\"",
			/datum/status_effect/buff/trollshape = "Sinius roars: \"Meat swells. Thu strong. Thu crush now.\"",
			/datum/status_effect/buff/divine_beauty = "Sinius spits: \"Pah! Pretty? WASTE! Git bloody, thu fole!\"",
			/datum/status_effect/buff/call_to_arms = "Sinius bellows: \"Raise swerd. Kill 'em fast. Or die, weakling!\"",
			/datum/status_effect/buff/craft_buff = "Sinius smirks: \"Build? HA! Smash it till 'tis strong!\"",
			/datum/status_effect/buff/foodbuff = "Sinius snorts: \"Meat good. Git strong.\"",
			/datum/status_effect/buff/clean_plus = "Sinius spits: \"Clean? Bah. Mud good fer ya.\"",
			/datum/status_effect/buff/featherfall = "Sinius snorts: \"Pah! Drop faster next time.\"",
			/datum/status_effect/buff/darkvision = "Sinius huffs: \"See 'em hidin'. Then kill 'em.\"",
			/datum/status_effect/buff/haste = "Sinius yells: \"Fast now! Get killin'!\"",
			/datum/status_effect/buff/calm = "Sinius grumbles: \"Pff. Calm’s fer weaklings.\"",
			/datum/status_effect/buff/barbrage = "Sinius roars: \"RAAAGH! Smash 'em flat!\""
		),

		/// Malum - The Iron Lord
		/datum/patron/divine/malum = list(
			/datum/status_effect/buff/beastsense = "Malum grunts: \"Even beasts know craft. So should you.\"",
			/datum/status_effect/buff/trollshape = "Malum states: \"Strong arms make stronger tools.\"",
			/datum/status_effect/buff/divine_beauty = "Malum hammers: \"Beauty fades. Steel remains.\"",
			/datum/status_effect/buff/call_to_arms = "Malum intones: \"Hammer strikes. Blood flows. This is labor's price.\"",
			/datum/status_effect/buff/craft_buff = "Malum orders: \"Work HARDER. Or break.\"",
			/datum/status_effect/buff/foodbuff = "Malum grunts: \"Eat. FUEL the forge within.\"",
			/datum/status_effect/buff/clean_plus = "Malum nods: \"Clean steel, good steel.\"",
			/datum/status_effect/buff/featherfall = "Malum mutters: \"Floatin’s for feathers... not IRON.\"",
			/datum/status_effect/buff/darkvision = "Malum growls: \"See what lurks. Strike it down.\"",
			/datum/status_effect/buff/haste = "Malum commands: \"Faster. The FORGE waits not.\"",
			/datum/status_effect/buff/calm = "Malum states: \"Temper your rage. FORGE it right.\"",
			/datum/status_effect/buff/barbrage = "Malum snarls: \"Unleash it. Strike like the hammer.\""
		),

		/// Dismas - The Bandit God
		/datum/patron/inhumen/matthios = list(
			/datum/status_effect/buff/beastsense = "Dismas laughs: \"Sniff it out, lad. Something worth stealing.\"",
			/datum/status_effect/buff/trollshape = "Dismas grins: \"Ugly sells well in some towns, friend.\"",
			/datum/status_effect/buff/divine_beauty = "Dismas smirks: \"Pretty coin, pretty face... both stolen easy.\"",
			/datum/status_effect/buff/call_to_arms = "Dismas shouts: \"Fight dirty. Win rich.\"",
			/datum/status_effect/buff/craft_buff = "Dismas shrugs: \"Build fast. Sell faster.\"",
			/datum/status_effect/buff/foodbuff = "Dismas grins: \"Eat now... pay later.\"",
			/datum/status_effect/buff/clean_plus = "Dismas cackles: \"Cleaned up nice... for a mark.\"",
			/datum/status_effect/buff/featherfall = "Dismas chuckles: \"Fall soft... means you live to steal again.\"",
			/datum/status_effect/buff/darkvision = "Dismas winks: \"See the dark? Hide better.\"",
			/datum/status_effect/buff/haste = "Dismas shouts: \"Quick hands win riches.\"",
			/datum/status_effect/buff/calm = "Dismas smirks: \"Calm? Nah, means they don’t see you comin'.\"",
			/datum/status_effect/buff/barbrage = "Dismas yells: \"Break stuff. Blame someone else!\""
		),

		/// Last Death - The Nameless Death
		/datum/patron/divine/necra = list(
			/datum/status_effect/buff/beastsense = "Death murmurs: \"The grave knows your scent... and waits.\"",
			/datum/status_effect/buff/trollshape = "Death hums: \"Mass returns to earth. Let the soil remember you.\"",
			/datum/status_effect/buff/divine_beauty = "Death whispers: \"Even beauty rots. But for now... wear it.\"",
			/datum/status_effect/buff/call_to_arms = "Death states: \"Raise thy blade. All paths end the same.\"",
			/datum/status_effect/buff/craft_buff = "Death sighs: \"All things break. Make them, even so.\"",
			/datum/status_effect/buff/foodbuff = "Death croons: \"Feast whilst thou breathe. The hunger ends soon.\"",
			/datum/status_effect/buff/clean_plus = "Death sighs: \"Thou mayest wash flesh... but not its fate.\"",
			/datum/status_effect/buff/featherfall = "Death hums: \"Fall gently. The earth shall catch thee.\"",
			/datum/status_effect/buff/darkvision = "Death whispers: \"The dark is not empty. It welcomes.\"",
			/datum/status_effect/buff/haste = "Death murmurs: \"Quickly now. Time thins beneath thy feet.\"",
			/datum/status_effect/buff/calm = "Death soothes: \"Rest... the silence shall come for all.\"",
			/datum/status_effect/buff/barbrage = "Death intones: \"Rage, if thy must. The dead are silent, but not still.\""
		),

		/// Lunaria - The Shadow Walker
		/datum/patron/divine/noc = list(
			/datum/status_effect/buff/beastsense = "Lunaria ponders: \"The night sees what the day fears.\"",
			/datum/status_effect/buff/trollshape = "Lunaria muses: \"Moonlight swells thy shape...\"",
			/datum/status_effect/buff/divine_beauty = "Lunaria murmurs: \"A fabulous dress fixes anyone. For now, have this.\"",
			/datum/status_effect/buff/call_to_arms = "Lunaria fades: \"There lies enemies of discovery. Remove them.\"",
			/datum/status_effect/buff/craft_buff = "Lunaria breathes: \"Build in secret. None must know.\"",
			/datum/status_effect/buff/foodbuff = "Lunaria muses: \"A shrewd mind requires healthy appetite.\"",
			/datum/status_effect/buff/clean_plus = "Lunaria muses: \"Moonlight cleans better than the sun ever may.\"",
			/datum/status_effect/buff/featherfall = "Lunaria whispers: \"Float, like silver strands through the wind.\"",
			/datum/status_effect/buff/darkvision = "Lunaria offers: \"See through the night.\"",
			/datum/status_effect/buff/haste = "Lunaria murmurs: \"Move as quickly as the pages turn.\"",
			/datum/status_effect/buff/calm = "Lunaria soothes: \"Calm thyself... think of gotes leaping over the moon.\"",
			/datum/status_effect/buff/barbrage = "Lunaria commandes: \"Feel the power of strengthened magick flow through thyself.\""
		),

		/// Pestra - The Plague Mother
		/datum/patron/divine/pestra = list(
			/datum/status_effect/buff/beastsense = "Pestra bemuses: \"Sniff it. Identify its substance—not that cycles of rot would harm you.\"",
			/datum/status_effect/buff/trollshape = "Pestra wheezes: \"Thick skin, bad breath. You’re a fascinating specimen.\"",
			/datum/status_effect/buff/divine_beauty = "Pestra muses: \"Unblemished... Curious. Beauty often masks the most virulent flaws.\"",
			/datum/status_effect/buff/call_to_arms = "Pestra howls: \"Some bones must be broken before one may mend them.\"",
			/datum/status_effect/buff/craft_buff = "Pestra giggles: \"Change is divine. One compound into another—chaos with purpose.\"",
			/datum/status_effect/buff/foodbuff = "Pestra comments: \"Be nourished. Spoilage is just misunderstood fermentation.\"",
			/datum/status_effect/buff/clean_plus = "Pestra scoffs: \"Cleanliness? Temporary at best. Let’s see how long it lasts.\"",
			/datum/status_effect/buff/featherfall = "Pestra hiccups: \"You sink through water but fall through air. What if we reversed this?\"",
			/datum/status_effect/buff/darkvision = "Pestra lectures: \"Germs are not limited by darkness.\"",
			/datum/status_effect/buff/haste = "Pestra snaps: \"Faster now! Spores don’t wait to bloom.\"",
			/datum/status_effect/buff/calm = "Pestra whispers: \"Stillness... Let the fever sleep awhile.\"",
			/datum/status_effect/buff/barbrage = "Pestra shrieks: \"Break what you cannot understand. Reassembly is half the fun.\""
		),

		/// Wanderer - The Warlord
		/datum/patron/divine/ravox = list(
			/datum/status_effect/buff/beastsense = "Wanderer growls: \"Smell your enemy. Hunt them down with purpose.\"",
			/datum/status_effect/buff/trollshape = "Wanderer commands: \"Let might serve justice. Let strength carry duty.\"",
			/datum/status_effect/buff/divine_beauty = "Wanderer declares: \"Wear your glory well, warrior. Let honor shine brighter.\"",
			/datum/status_effect/buff/call_to_arms = "Wanderer bellows: \"To war! You've got this, kid.\"",
			/datum/status_effect/buff/craft_buff = "Wanderer nods: \"Forge victory with your hands. Let each blow ring true.\"",
			/datum/status_effect/buff/foodbuff = "Wanderer grunts: \"Eat. Even the strong must endure the march.\"",
			/datum/status_effect/buff/clean_plus = "Wanderer commands: \"Clean your blade. We should not revel in blood we spill.\"",
			/datum/status_effect/buff/featherfall = "Wanderer comments: \"Even the bold must fall with grace.\"",
			/datum/status_effect/buff/darkvision = "Wanderer growls: \"See the coward. Bring them to justice.\"",
			/datum/status_effect/buff/haste = "Wanderer barks: \"Swift feet carry righteous blades.\"",
			/datum/status_effect/buff/calm = "Wanderer grunts: \"Still your heart. The battle shall come.\"",
			/datum/status_effect/buff/barbrage = "Wanderer roars: \"BE FILLED WITH RIGHTEOUS ANGER!\""
		),

		/// Xylix - The Trickster
		/datum/patron/divine/xylix = list(
			/datum/status_effect/buff/beastsense = "Xylix laughs: \"Sniff sniff! What's behind that tree? Chaos, I hope!\"",
			/datum/status_effect/buff/trollshape = "Xylix grins: \"Big, dumb, and hilarious. Perfect.\"",
			/datum/status_effect/buff/divine_beauty = "Xylix cackles: \"Shiny! Pretty! Now trip over it!\"",
			/datum/status_effect/buff/call_to_arms = "Xylix shouts: \"Time for a fun fight. Maybe you'll win. Maybe not!\"",
			/datum/status_effect/buff/craft_buff = "Xylix winks: \"Stack it wrong. Bet it still works!\"",
			/datum/status_effect/buff/foodbuff = "Xylix giggles: \"Eat that. Could be poison!\"",
			/datum/status_effect/buff/clean_plus = "Xylix chuckles: \"Clean now. Mess later.\"",
			/datum/status_effect/buff/featherfall = "Xylix howls: \"Whee! Hope ya bounce!\"",
			/datum/status_effect/buff/darkvision = "Xylix snickers: \"Ooo... spooky. Boo!\"",
			/datum/status_effect/buff/haste = "Xylix screams: \"FAST! Trip 'em!\"",
			/datum/status_effect/buff/calm = "Xylix hums: \"Calm... until it ain’t.\"",
			/datum/status_effect/buff/barbrage = "Xylix roars: \"Break it! Then break it twice!\""
		),

		/// Tenebrase - The Ascended Goddess
		/datum/patron/inhumen/zizo = list(
			/datum/status_effect/buff/beastsense = "Tenebrase hisses: \"They crawl. They beg. They are prey, inferior. Hunt them.\"",
			/datum/status_effect/buff/trollshape = "Tenebrase croons: \"This form? Power. Strength. Craft your flesh. This is my gift.\"",
			/datum/status_effect/buff/divine_beauty = "Tenebrase sneers: \"They shall kneel before this visage. And they shall weep.\"",
			/datum/status_effect/buff/call_to_arms = "Tenebrase commands: \"Fight. Break them. Show the strength and cunning of your queen.\"",
			/datum/status_effect/buff/craft_buff = "Tenebrase states: \"Strong. Flexible Show the craft is worthy. Weave flesh like linen.\"",
			/datum/status_effect/buff/foodbuff = "Tenebrase smirks: \"Eat. Power grows.\"",
			/datum/status_effect/buff/clean_plus = "Tenebrase sneers: \"Clean. Now you are worthy of gaze.\"",
			/datum/status_effect/buff/featherfall = "Tenebrase hisses: \"Float above them. They are beneath us.\"",
			/datum/status_effect/buff/darkvision = "Tenebrase purrs: \"See what they hide. See all.\"",
			/datum/status_effect/buff/haste = "Tenebrase commands: \"Move. Do not stumble. Do not fail me.\"",
			/datum/status_effect/buff/calm = "Tenebrase whispers: \"Calm now. Wait for your opportunity to strike.\"",
			/datum/status_effect/buff/barbrage = "Tenebrase roars: \"Rend them. Show this strength!\""
		)
	)

	/// Return specific blessing line if available
	if(blessing_flavor[patron_type] && blessing_flavor[patron_type][blessing_path])
		return blessing_flavor[patron_type][blessing_path]

	/// Generic fallback
	return "A divine force surges through you, wrapping your soul in unseen power."
