
/obj/item/book/granter/spell/spells/
	desc = "A scroll of potential known only to those that can decipher its secrets."
	icon = 'icons/roguetown/items/misc.dmi'
	oneuse = TRUE
	drop_sound = 'sound/foley/dropsound/paper_drop.ogg'
	pickup_sound =  'sound/blank.ogg'
	remarks = list("Fascinating!", "Is that so...", "Like this?", "Really now...", "There's a little schmutz on this section...")
	sellprice = 30

/obj/item/book/granter/spell/spells/get_real_price()
	return sellprice

/obj/item/book/granter/spell/spells/onlearned(mob/living/carbon/user)
	..()
	if(oneuse == TRUE)
		qdel(src) //no need this trash.
		user.visible_message(span_warning("[src] has had its magic ink ripped from the scroll, it disintegrates to dust!"))

// Cantrips (Level 0)
/obj/item/book/granter/spell/spells/acidsplash
	name = "Scroll of Acid Splash"
	spell = /datum/action/cooldown/spell/projectile/acid_splash
	spellname = "acid splash"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells/bladeward
	name = "Scroll of Blade Ward"
	spell = /datum/action/cooldown/spell/undirected/blade_ward
	spellname = "blade ward"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells/boomingblade
	name = "Scroll of Booming Blade"
	spell = /datum/action/cooldown/spell/status/booming_blade
	spellname = "booming blade"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells/chilltouch
	name = "Scroll of Chill Touch"
	spell = /datum/action/cooldown/spell/chill_touch
	spellname = "chill touch"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells/createbonfire
	name = "Scroll of Create Bonfire"
	spell = /datum/action/cooldown/spell/conjure/bonfire
	spellname = "create bonfire"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells/decompose
	name = "Scroll of Decompose"
	spell = /datum/action/cooldown/spell/decompose
	spellname = "decompose"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells/encodethoughts
	name = "Scroll of Encode Thoughts"
	spell = /datum/action/cooldown/spell/undirected/list_target/encode_thoughts
	spellname = "encode thoughts"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells/frostbite
	name = "Scroll of Frostbite"
	spell = /datum/action/cooldown/spell/status/frostbite
	spellname = "frostbite"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells/greenflameblade
	name = "Scroll of Green-Flame Blade"
	spell = /datum/action/cooldown/spell/enchantment/green_flame
	spellname = "green-flame blade"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells/guidance
	name = "Scroll of Guidance"
	spell = /datum/action/cooldown/spell/status/guidance
	spellname = "guidance"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells/infestation
	name = "Scroll of Infestation"
	spell = /datum/action/cooldown/spell/status/infestation
	spellname = "infestation"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells/light
	name = "Scroll of Illuminate"
	spell = /datum/action/cooldown/spell/essence/illuminate
	spellname = "light"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells/lightninglure
	name = "Scroll of Lightning Lure"
	spell = /datum/action/cooldown/spell/aoe/lightning_lure
	spellname = "lightning lure"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells/mending
	name = "Scroll of Minor Mend"
	spell = /datum/action/cooldown/spell/essence/mend
	spellname = "mending"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells/mindsliver
	name = "Scroll of Mind Spike"
	spell = /datum/action/cooldown/spell/mind_spike
	spellname = "mind sliver"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells/poisonspray
	name = "Scroll of Poison Spray"
	spell = /datum/action/cooldown/spell/undirected/create_cloud
	spellname = "poison spray"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells/primalsavagery
	name = "Scroll of Primal Savagery"
	spell = /datum/action/cooldown/spell/status/primal_savagery
	spellname = "primal savagery"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells/rayoffrost
	name = "Scroll of Ray of Frost"
	spell = /datum/action/cooldown/spell/beam/beam_of_frost
	spellname = "ray of frost"
	icon_state = "scrollred"

// Level 1 Spells - Cost 400
/obj/item/book/granter/spell/spells/bladeburst
	name = "Scroll of Blade Burst"
	spell = /datum/action/cooldown/spell/blade_burst
	spellname = "blade burst"
	icon_state = "scrollblue"

/obj/item/book/granter/spell/spells/darkvision
	name = "Scroll of Darkvision"
	spell = /datum/action/cooldown/spell/undirected/touch/darkvision
	spellname = "darkvision"
	icon_state = "scrollblue"

/obj/item/book/granter/spell/spells/featherfall
	name = "Scroll of Feather Falling"
	spell = /datum/action/cooldown/spell/undirected/feather_falling
	spellname = "featherfall"
	icon_state = "scrollblue"

/obj/item/book/granter/spell/spells/fetch
	name = "Scroll of Fetch"
	spell = /datum/action/cooldown/spell/projectile/fetch
	spellname = "fetch"
	icon_state = "scrollblue"

/obj/item/book/granter/spell/spells/forcewall
	name = "Scroll of Force Wall"
	spell = /datum/action/cooldown/spell/undirected/forcewall/breakable
	spellname = "force wall"
	icon_state = "scrollblue"

/obj/item/book/granter/spell/spells/haste
	name = "Scroll of Haste"
	spell = /datum/action/cooldown/spell/status/haste
	spellname = "haste"
	icon_state = "scrollblue"

/obj/item/book/granter/spell/spells/message
	name = "Scroll of Message"
	spell = /datum/action/cooldown/spell/undirected/message
	spellname = "message"
	icon_state = "scrollblue"

/obj/item/book/granter/spell/spells/prestidigitation
	name = "Scroll of Prestidigitation"
	spell = /datum/action/cooldown/spell/undirected/touch/prestidigitation
	spellname = "prestidigitation"
	icon_state = "scrollblue"

/obj/item/book/granter/spell/spells/push
	name = "Scroll of Repulse"
	spell = /datum/action/cooldown/spell/aoe/repulse
	spellname = "repulse"
	icon_state = "scrollblue"

/obj/item/book/granter/spell/spells/slowdown
	name = "Scroll of Slowdown"
	spell = /datum/action/cooldown/spell/aoe/on_turf/ensnare
	spellname = "slowdown"
	icon_state = "scrollblue"

// Level 2 Spells - Cost 800

/obj/item/book/granter/spell/spells/t2
	spell_slot_cost = 2

/obj/item/book/granter/spell/spells/t2/greaterfireball
	name = "Scroll of Greater Fireball"
	spell = /datum/action/cooldown/spell/projectile/fireball/greater
	spellname = "greater fireball"
	icon_state = "scrollgreen"

/obj/item/book/granter/spell/spells/t2/lightningbolt
	name = "Scroll of Lightning Bolt"
	spell = /datum/action/cooldown/spell/projectile/lightning
	spellname = "lightning bolt"
	icon_state = "scrollgreen"

/obj/item/book/granter/spell/spells/t2/nondetection
	name = "Scroll of Nondetection"
	spell = /datum/action/cooldown/spell/undirected/touch/non_detection
	spellname = "nondetection"
	icon_state = "scrollgreen"

// Level 3 Spells - Cost 1600
/obj/item/book/granter/spell/spells/t3
	spell_slot_cost = 3

/obj/item/book/granter/spell/spells/t3/bloodbolt
	name = "Scroll of Blood Bolt"
	spell = /datum/action/cooldown/spell/projectile/blood_bolt
	spellname = "blood bolt"
	icon_state = "scrollpurple"

/obj/item/book/granter/spell/spells/t3/bloodsteal
	name = "Scroll of Blood Steal"
	spell = /datum/action/cooldown/spell/projectile/blood_steal
	spellname = "blood steal"
	icon_state = "scrollpurple"

/obj/item/book/granter/spell/spells/t3/commandundead
	name = "Scroll of Command Undead"
	spell = /datum/action/cooldown/spell/undirected/command_undead
	spellname = "command undead"
	icon_state = "scrollpurple"

/obj/item/book/granter/spell/spells/t3/eyebite
	name = "Scroll of Eyebite"
	spell = /datum/action/cooldown/spell/eyebite
	spellname = "eyebite"
	icon_state = "scrollpurple"

/obj/item/book/granter/spell/spells/t3/findfamiliar
	name = "Scroll of Find Familiar"
	spell = /datum/action/cooldown/spell/conjure/familiar
	spellname = "find familiar"
	icon_state = "scrollpurple"

// Really powerful BUT it works

/obj/item/book/granter/spell/spells/t3/mistystep
	name = "Scroll of Ethereal Jaunt"
	spell = /datum/action/cooldown/spell/undirected/jaunt/ethereal_jaunt
	spellname = "misty step"
	icon_state = "scrollpurple"

/obj/item/book/granter/spell/spells/t3/raiseundead
	name = "Scroll of Raise Undead"
	spell = /datum/action/cooldown/spell/raise_undead
	spellname = "raise undead"
	icon_state = "scrollpurple"

/obj/item/book/granter/spell/spells/t3/rayofsickness
	name = "Scroll of Ray of Sickness"
	spell = /datum/action/cooldown/spell/projectile/sickness
	spellname = "ray of sickness"
	icon_state = "scrollpurple"

/obj/item/book/granter/spell/spells/t3/strengthenundead
	name = "Scroll of Infuse Unlife"
	spell = /datum/action/cooldown/spell/strengthen_undead
	spellname = "infuse unlife"
	icon_state = "scrollpurple"
	remarks = list("Mediolanum ventis..", "Sana damnatorum..", "Frigidus ossa mortuorum..")

// Mapping only
/obj/item/book/granter/spell/spells/random
	name = "random spell scroll spawner"
	desc = "This item spawns a random  spell scroll on roundstart. Mapping only!"
	icon_state = "scrollred"

/obj/item/book/granter/spell/spells/random/Initialize()
	. = ..()
	var/list/scroll_types = subtypesof(/obj/item/book/granter/spell/spells) - list(/obj/item/book/granter/spell/spells/random)
	var/chosen_type = pick(scroll_types)
	var/obj/structure/bookcase/B = locate() in get_turf(src)
	var/obj/item/spawned_scroll = new chosen_type(B ? B : get_turf(src))

	if(B)
		B.contents += spawned_scroll
	return INITIALIZE_HINT_QDEL
