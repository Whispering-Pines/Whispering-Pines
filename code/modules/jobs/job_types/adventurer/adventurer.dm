GLOBAL_LIST_EMPTY(billagerspawns)

GLOBAL_VAR_INIT(adventurer_hugbox_duration, 30 SECONDS)
GLOBAL_VAR_INIT(adventurer_hugbox_duration_still, 3 MINUTES)

/datum/job/adventurer
	title = "Wanderer"
	tutorial = "You are anybody, and everybody. Good or bad, you do your own thing, a hero? a villain? \
	You could be living here, or be a foreigner. You don't have a job specifically unlike the towners. \
	A freelancer or a mercenary you may say, or an.. entrepreneur of your own ideas."
	flag = ADVENTURER
	department_flag = OUTSIDERS
	job_flags = (JOB_ANNOUNCE_ARRIVAL | JOB_NEW_PLAYER_JOINABLE | JOB_EQUIP_RANK)
	display_order = JDO_ADVENTURER
	faction = FACTION_TOWN
	total_positions = -1
	spawn_positions = -1
	min_pq = 0
	bypass_lastclass = TRUE

	allowed_races = RACES_PLAYER_ALL

	outfit = null
	outfit_female = null
	advclass_cat_rolls = list(CTAG_ADVENTURER = 50, CTAG_PILGRIM = 50)
	can_have_apprentices = FALSE


/datum/job/adventurer/after_spawn(mob/living/spawned, client/player_client)
	..()

/datum/outfit/job/adventurer // Reminder message
	var/merc_ad = "<br><font color='#855b14'><span class='bold'>If I wanted to make casings by selling my services, or completing quests, the Inn underground would be a good place to start.</span></font><br>"

/datum/outfit/job/adventurer/post_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, merc_ad)
