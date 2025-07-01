/datum/status_effect/debuff/recloned
	id = "recloned"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/recloned
	duration = 15 MINUTES
	effectedstats = list(STATKEY_STR = -8, STATKEY_SPD = -4, STATKEY_END = -6, STATKEY_CON = -8)

/atom/movable/screen/alert/status_effect/debuff/recloned
	name = "Cloning Sickness"
	desc = "<span class='warning'>Where am I? What happened? I feel so weak and sick...</span>\n"
	icon_state = "muscles"

//STEALTH COOLDOWN

/datum/status_effect/debuff/stealthcd
	id = "stealth_cd"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/stealthcd
	duration = 15 SECONDS

/atom/movable/screen/alert/status_effect/debuff/stealthcd
	name = "Stealth Broken"
	desc = "I've been revealed and can not hide again for a while."
	icon = 'modular_stonehedge/licensed-eaglephntm/icons/mob/screen_alert.dmi'
	icon_state = "stealthcd"

/datum/status_effect/debuff/stealthcd/on_apply()
	if(owner.mind)
		duration = duration - ((owner.get_skill_level(/datum/skill/misc/sneaking)) SECONDS * 2)
	if(owner.m_intent == MOVE_INTENT_SNEAK)
		playsound(owner.loc, 'modular_stonehedge/sound/mgsalert.ogg', 50, FALSE)
		owner.toggle_rogmove_intent(MOVE_INTENT_WALK)
		owner.update_sneak_invis()
	return ..()
