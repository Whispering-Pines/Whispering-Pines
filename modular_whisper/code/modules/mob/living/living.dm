/mob/living/verb/lsubmit()
	set name = "Submit (Lewd)"
	set category = "IC"
	set hidden = 0
	if(surrendering)
		return
	if(stat)
		return
	surrendering = 1
	if(alert(src, "Butt up in surrender?",,"YES","NO") == "YES")
		GLOB.vanderlin_round_stats[STATS_YIELDS]++
		changeNext_move(CLICK_CD_EXHAUSTED)
		var/image/flaggy = image('icons/effects/effects.dmi',src,"heart",ABOVE_MOB_LAYER)
		flaggy.appearance_flags = RESET_TRANSFORM|KEEP_APART
		flaggy.transform = null
		flaggy.pixel_y = 12
		flick_overlay_view(flaggy, 150)
		drop_all_held_items()
		Paralyze(150)
		reagents.add_reagent(/datum/reagent/medicine/inaprovaline, 14)
		status_flags |= GODMODE
		src.visible_message(span_lovebold("[src] submits, offering themselves for mercy!</span>"))
		playsound(src, 'sound/misc/mat/end.ogg', 100, FALSE, -1)
		toggle_cmode()
		sleep(150)
		status_flags &= ~GODMODE
	surrendering = 0
