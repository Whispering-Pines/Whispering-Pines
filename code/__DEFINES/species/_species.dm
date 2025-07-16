#define RACE_HUMEN "Human"
#define RACE_DWARF "Dwarf"
#define RACE_AASIMAR "Aasimar"
#define RACE_ELF "Elf"
#define RACE_HALF_ELF "Half-Elf"
#define RACE_DROW "Dark Elf"
#define RACE_HALF_DROW "Half-Drow"
#define RACE_TIEFLING "Tiefling"
#define RACE_HALF_ORC "Half-Orc"
#define RACE_RAKSHARI "Rakshari"
#define RACE_KOBOLD "Kobold"
#define RACE_HOLLOWKIN "Demihuman"
#define RACE_HARPY "Harpy"
#define RACE_TRITON "Triton"
#define RACE_RESURGENTIS "Resurgentis"
#define RACE_AKULA "Akula"
#define RACE_WILDKIN "Wild-Kin"
#define RACE_VERMINVOLK "Verminvolk"
#define RACE_DRACON "Dracon"
#define RACE_LIZARDFOLK "Lizardfolk"
#define RACE_LUPIAN "Lupian"
#define RACE_AXIAN "Axian"
#define RACE_TABAXI "Tabaxi"
#define RACE_VULPKANIN "Vulpkanin"
#define RACE_CONSTRUCT "Metal Construct"
#define RACE_SLIMEPERSON "Slimeperson"
#define RACE_PLANTOID "Plantoid"
#define RACE_HUMAN_SPACE "Human"

// ============ USING ID BECAUSE FUCK YOU
/// List of all species. "RACES" in code only, "SPECIES" everywhere else please!
#define ALL_RACES_LIST list(\
	"human",\
	"demihuman",\
	"harpy",\
	"rakshari",\
	"dwarf",\
	"elf",\
	"tiefling",\
	"aasimar",\
	"halforc",\
	"orc",\
	"zizombie",\
	"kobold",\
	"triton",\
	"resurgentis",\
	"slimeperson",\
	"plantoid",\
	"akula",\
	"anthromorph",\
	"anthromorphsmall",\
	"dracon",\
	"lizardfolk",\
	"lupian",\
	"tabaxi",\
	"vulpkanin",\
	"axian",\
	"humanspace",\
	"constructm",\
	)

/// Species where females get underwear, no underwear for kobold, rakshari and triton, dwarves handled seperately
#define RACES_UNDERWEAR_FEMALE list(\
	"human",\
	"demihuman",\
	"harpy",\
	"tiefling",\
	"aasimar",\
	"halforc",\
	"orc",\
	"zizombie",\
	"elf",\
	"resurgentis",\
	"akula",\
	"anthromorph",\
	"anthromorphsmall",\
	"dracon",\
	"lizardfolk",\
	"lupian",\
	"tabaxi",\
	"vulpkanin",\
	"axian",\
	"humanspace",\
	)

/// Species where males get underwear, identical to above, elves handled seperately
#define RACES_UNDERWEAR_MALE list(\
	"human",\
	"demihuman",\
	"harpy",\
	"tiefling",\
	"aasimar",\
	"halforc",\
	"orc",\
	"zizombie",\
	"resurgentis",\
	"akula",\
	"anthromorph",\
	"anthromorphsmall",\
	"dracon",\
	"lizardfolk",\
	"lupian",\
	"tabaxi",\
	"vulpkanin",\
	"axian",\
	"humanspace",\
	)

// ============ USING NAME
/// All playable species from character selection menu.
#define RACES_PLAYER_ALL list(\
	RACE_HUMEN,\
	RACE_DWARF,\
	RACE_AASIMAR,\
	RACE_ELF,\
	RACE_HALF_ELF,\
	RACE_DROW,\
	RACE_HALF_DROW,\
	RACE_TIEFLING,\
	RACE_HARPY,\
	RACE_RAKSHARI,\
	RACE_TRITON,\
	RACE_KOBOLD,\
	RACE_HOLLOWKIN,\
	RACE_HALF_ORC,\
	RACE_RESURGENTIS,\
	RACE_AKULA,\
	RACE_WILDKIN,\
	RACE_VERMINVOLK,\
	RACE_DRACON,\
	RACE_LIZARDFOLK,\
	RACE_LUPIAN,\
	RACE_AXIAN,\
	RACE_TABAXI,\
	RACE_VULPKANIN,\
	RACE_CONSTRUCT,\
	RACE_SLIMEPERSON,\
	RACE_PLANTOID,\
)

/// Races not considered discriminated against in Phantom Kingdom. Used for nobility, etc.
#define RACES_PLAYER_NONDISCRIMINATED list(\
	RACE_HUMEN,\
	RACE_DWARF,\
	RACE_AASIMAR,\
	RACE_ELF,\
	RACE_HALF_ELF,\
	RACE_DROW,\
	RACE_HALF_DROW,\
	RACE_TIEFLING,\
	RACE_HARPY,\
	RACE_RAKSHARI,\
	RACE_TRITON,\
	RACE_KOBOLD,\
	RACE_HOLLOWKIN,\
	RACE_HALF_ORC,\
	RACE_RESURGENTIS,\
	RACE_AKULA,\
	RACE_WILDKIN,\
	RACE_VERMINVOLK,\
	RACE_DRACON,\
	RACE_LIZARDFOLK,\
	RACE_LUPIAN,\
	RACE_AXIAN,\
	RACE_TABAXI,\
	RACE_VULPKANIN,\
	RACE_CONSTRUCT,\
	RACE_SLIMEPERSON,\
	RACE_PLANTOID,\
)

/// Races who are nonheretical to the church. Excluded races typically have an inhumen god associated, like Tenebrase. Used for church/faith roles.

#define RACES_PLAYER_NONHERETICAL list(\
	RACE_HUMEN,\
	RACE_DWARF,\
	RACE_AASIMAR,\
	RACE_ELF,\
	RACE_HALF_ELF,\
	RACE_DROW,\
	RACE_HALF_DROW,\
	RACE_TIEFLING,\
	RACE_HARPY,\
	RACE_RAKSHARI,\
	RACE_TRITON,\
	RACE_KOBOLD,\
	RACE_HOLLOWKIN,\
	RACE_HALF_ORC,\
	RACE_RESURGENTIS,\
	RACE_AKULA,\
	RACE_WILDKIN,\
	RACE_VERMINVOLK,\
	RACE_DRACON,\
	RACE_LIZARDFOLK,\
	RACE_LUPIAN,\
	RACE_AXIAN,\
	RACE_TABAXI,\
	RACE_VULPKANIN,\
	RACE_CONSTRUCT,\
	RACE_SLIMEPERSON,\
	RACE_PLANTOID,\
)

/// Races who are non-exotic to Phantom Kingdom. These are races from foreign lands with no local pull or uncommon races. Used in miscellaneous cases, when they would not be that role.
#define RACES_PLAYER_NONEXOTIC list(\
	RACE_HUMEN,\
	RACE_DWARF,\
	RACE_AASIMAR,\
	RACE_ELF,\
	RACE_HALF_ELF,\
	RACE_DROW,\
	RACE_HALF_DROW,\
	RACE_TIEFLING,\
	RACE_HARPY,\
	RACE_TRITON,\
	RACE_KOBOLD,\
	RACE_HOLLOWKIN,\
	RACE_HALF_ORC,\
	RACE_RESURGENTIS,\
	RACE_AKULA,\
	RACE_WILDKIN,\
	RACE_VERMINVOLK,\
	RACE_DRACON,\
	RACE_LIZARDFOLK,\
	RACE_LUPIAN,\
	RACE_AXIAN,\
	RACE_TABAXI,\
	RACE_VULPKANIN,\
)

/// Species that lack lux. Any who have no ties to divinity anymore, whether it be their creation story or otherwise taken from them (Hollow-kin)
#define RACES_PLAYER_LUXLESS list(\
)

/// Races who are affiliated with Grenzelhoft or Old Gods specifically.
#define RACES_PLAYER_GRENZ list(\
	RACE_HUMEN,\
	RACE_DWARF,\
	RACE_AASIMAR,\
)

/// Elves and Half-Elves
#define RACES_PLAYER_ELF list(\
	RACE_ELF,\
	RACE_HALF_ELF,\
)

/// Dark elves, half-drow
#define RACES_PLAYER_DROW list(\
	RACE_DROW,\
	RACE_HALF_DROW,\
)

/// Elves, Half-Elves, Half-Drow, Dark Elves
#define RACES_PLAYER_ELF_ALL list(\
	RACE_ELF,\
	RACE_HALF_ELF,\
	RACE_DROW,\
	RACE_HALF_DROW,\
)

/// Patreon only species.
#define RACES_PLAYER_PATREON list(\
)

/// Guard Species - No Orcs or Dark Elf
#define RACES_PLAYER_GUARD list(\
	RACE_HUMEN,\
	RACE_DWARF,\
	RACE_AASIMAR,\
	RACE_ELF,\
	RACE_HALF_ELF,\
	RACE_DROW,\
	RACE_HALF_DROW,\
	RACE_TIEFLING,\
	RACE_HARPY,\
	RACE_RAKSHARI,\
	RACE_TRITON,\
	RACE_HOLLOWKIN,\
	RACE_HALF_ORC,\
	RACE_RESURGENTIS,\
	RACE_AKULA,\
	RACE_WILDKIN,\
	RACE_DRACON,\
	RACE_LIZARDFOLK,\
	RACE_LUPIAN,\
	RACE_AXIAN,\
	RACE_TABAXI,\
	RACE_VULPKANIN,\
	RACE_CONSTRUCT,\
	RACE_SLIMEPERSON,\
	RACE_PLANTOID,\
)

/// Foreigner Nobility Races
#define RACES_PLAYER_FOREIGNNOBLE list(\
	RACE_HUMEN,\
	RACE_DWARF,\
	RACE_AASIMAR,\
	RACE_ELF,\
	RACE_HALF_ELF,\
	RACE_DROW,\
	RACE_HALF_DROW,\
	RACE_HALF_ORC,\
	RACE_HARPY,\
	RACE_RAKSHARI,\
	RACE_TRITON,\
	RACE_KOBOLD,\
	RACE_RESURGENTIS,\
	RACE_TIEFLING,\
	RACE_HOLLOWKIN,\
	RACE_AKULA,\
	RACE_WILDKIN,\
	RACE_VERMINVOLK,\
	RACE_DRACON,\
	RACE_LIZARDFOLK,\
	RACE_LUPIAN,\
	RACE_AXIAN,\
	RACE_TABAXI,\
	RACE_VULPKANIN,\
)

/// Nonnative species - Anything not native to Psydonia.
/// Probably only will ever contain humans pragmatically, as funny as ethereals pretending to be tieflings would be.
#define RACES_PLAYER_ALIEN list(\
	RACE_HUMAN_SPACE,\
)
