/datum/job/ganger
	title = "Ganger"
	tutorial = "You are basically a wanderer who isn't wandering... You are part of the minus gang and your gang has been keeping the underground yours, keeping law out so you may write your own.\
	Fight the law, collect toll from small businesses for protection, get paid to beat someone up, j<ust remember mindless cruelty will always come back in due time. Your gang only will stand if people aren't arming up against it."
	allowed_sexes = list(MALE, FEMALE)
	outfit = /datum/outfit/job/ganger
	outfit_female = null
	total_positions = 8
	spawn_positions = 8
	min_pq = 0
	cmode_music = 'sound/music/cmode/antag/CombatBandit3.ogg'
	advclass_cat_rolls = list(CTAG_ADVENTURER = 20)
	flag = APPRENTICE
	department_flag = PEASANTS
	display_order = JDO_MERCENARY
	job_flags = (JOB_EQUIP_RANK | JOB_NEW_PLAYER_JOINABLE | JOB_SHOW_IN_CREDITS)
	faction = FACTION_TOWN
	bypass_lastclass = TRUE
	allowed_races = RACES_PLAYER_ALL
	can_random = FALSE
	can_have_apprentices = FALSE
	antag_job = TRUE
	antag_rep = 0
	give_bank_account = 20

/datum/outfit/job/ganger/post_equip(mob/living/carbon/human/H, visualsOnly)
	. = ..()
	var/obj/item/funkey = new /obj/item/key/gangkey(H.loc)
	H.put_in_hands(funkey, FALSE)

/obj/effect/landmark/start/ganger
	name = "Ganger"
	icon_state = "arrow"

/obj/item/key/gangkey
	name = "gang key"
	desc = "There's some dried blood on this key, it is the gang base's key."
	icon_state = "rustkey"
	lockids = list("gang")

/obj/effect/mapping_helpers/access/keyset/gang
	color = "#8b0c0c"
	difficulty = 2
	accesses = list("gang")
