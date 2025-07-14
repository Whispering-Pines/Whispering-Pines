
/area/rogue/outdoors/woods/shadowisland
	name = "wilderness"
	icon_state = "woods"
	droning_index = DRONING_FOREST_DAY
	droning_index_night = DRONING_FOREST_NIGHT
	ambient_index = AMBIENCE_BIRDS
	ambient_index_night = AMBIENCE_FOREST
	background_track = 'modular_whisper/sound/area/forest.ogg'
	background_track_dusk = 'modular_whisper/sound/area/terrorbog.ogg'
	background_track_night = 'sound/music/area/forestnight.ogg'
	soundenv = 15
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/floor/grass)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/wolf = 60,
				/mob/living/simple_animal/hostile/retaliate/bigrat = 50,
				/mob/living/simple_animal/hostile/retaliate/spider = 60,
				/mob/living/simple_animal/hostile/retaliate/troll/axe = 10,
				/mob/living/carbon/human/species/goblin/npc/ambush = 45,
				/mob/living/carbon/human/species/zizombie/ambush = 45,
				/mob/living/simple_animal/hostile/retaliate/mole = 25)
	first_time_text = "SHADOW ISLAND"
	custom_area_sound = 'sound/misc/stings/ForestSting.ogg'
	converted_type = /area/rogue/indoors/shelter/woods

/area/rogue/outdoors/town/phantom
	name = "outdoors"
	icon_state = "town"
	background_track = 'modular_whisper/sound/area/townstreets.ogg'
	background_track_dusk = 'modular_whisper/sound/area/towngen.ogg'
	background_track_night = 'sound/music/area/deliverer.ogg'
	converted_type = /area/rogue/indoors/shelter/town

/area/rogue/under/cave/phantom
	name = "cave"
	icon_state = "cave"
	droning_index = DRONING_CAVE_GENERIC
	ambient_index = AMBIENCE_CAVE
	background_track = 'sound/music/area/indoor.ogg'
	background_track_dusk = 'modular_whisper/sound/area/towngen.ogg'
	background_track_night = 'sound/music/area/sleeping.ogg'
	ambush_times = list("night")
	ambush_types = list(
				/turf/open/floor/dirt)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/bogbug = 30,
				/mob/living/simple_animal/hostile/retaliate/bigrat = 30,
				/mob/living/simple_animal/hostile/retaliate/spider = 20,
				/mob/living/carbon/human/species/goblin/npc/ambush/cave = 10)
	converted_type = /area/rogue/outdoors/caves

/area/rogue/under/town/sewer/phantom
	background_track = 'sound/music/area/sewers.ogg'
	background_track_night = 'sound/music/area/sleeping.ogg'
	custom_area_sound = 'sound/misc/stings/SewerSting.ogg'
	converted_type = /area/rogue/outdoors/exposed/under/sewer
	ambush_times = list("night","dawn","dusk","day")
	ambush_types = list(
				/turf/open/water/sewer)
	ambush_mobs = list(
				/mob/living/simple_animal/hostile/retaliate/bogbug = 30,
				/mob/living/simple_animal/hostile/retaliate/bigrat = 30)
