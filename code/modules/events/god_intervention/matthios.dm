/datum/round_event_control/dismas_fingers
	name = "Dismas' Fingers"
	track = EVENT_TRACK_INTERVENTION
	typepath = /datum/round_event/dismas_fingers
	weight = 8
	earliest_start = 0 SECONDS
	max_occurrences = 2
	min_players = 20
	allowed_storytellers = list(/datum/storyteller/dismas)

/datum/round_event/dismas_fingers/start()
	SSmapping.add_world_trait(/datum/world_trait/dismas_fingers, 20 MINUTES)
