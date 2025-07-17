///called in /obj/item/gun/try_fire_gun (user, src, target, flag, params)
#define COMSIG_MOB_TRYING_TO_FIRE_GUN "mob_trying_to_fire_gun"
///called in /obj/item/gun/fire_gun (user, target, flag, params)
#define COMSIG_GUN_TRY_FIRE "gun_try_fire"
	#define COMPONENT_CANCEL_GUN_FIRE (1<<0) /// Also returned to cancel COMSIG_MOB_TRYING_TO_FIRE_GUN
///called in /obj/item/gun/process_fire (src, target, params, zone_override, bonus_spread_values)
#define COMSIG_MOB_FIRED_GUN "mob_fired_gun"
	#define MIN_BONUS_SPREAD_INDEX 1
	#define MAX_BONUS_SPREAD_INDEX 2
///called in /obj/item/gun/process_fire (user, target, params, zone_override)
#define COMSIG_GUN_FIRED "gun_fired"
///called in /obj/item/gun/process_chamber (src)
#define COMSIG_GUN_CHAMBER_PROCESSED "gun_chamber_processed"
///called in /obj/item/gun/ballistic/process_chamber (casing)
#define COMSIG_CASING_EJECTED "casing_ejected"
///called in /obj/item/gun/ballistic/sawoff(mob/user, obj/item/saw, handle_modifications) : (mob/user)
#define COMSIG_GUN_BEING_SAWNOFF "gun_being_sawnoff"
	#define COMPONENT_CANCEL_SAWING_OFF (1<<0)
#define COMSIG_GUN_SAWN_OFF "gun_sawn_off"
///Called when an item gets recharged by the ammo powerup
#define COMSIG_ITEM_RECHARGED "item_recharged"
///from base of obj/item/apply_fantasy_bonuses(): (bonus)
#define COMSIG_ITEM_APPLY_FANTASY_BONUSES "item_apply_fantasy_bonuses"
///from base of obj/item/remove_fantasy_bonuses(): (bonus)
#define COMSIG_ITEM_REMOVE_FANTASY_BONUSES "item_remove_fantasy_bonuses"

/// Sent from [atom/proc/ranged_item_interaction], when this atom is left-clicked on by a mob with an item while not adjacent
#define COMSIG_ATOM_RANGED_ITEM_INTERACTION "atom_ranged_item_interaction"
/// Sent from [atom/proc/ranged_item_interaction], when this atom is right-clicked on by a mob with an item while not adjacent
#define COMSIG_ATOM_RANGED_ITEM_INTERACTION_SECONDARY "atom_ranged_item_interaction_secondary"
/// Sent from [atom/proc/ranged_item_interaction], when a mob is using this item while left-clicking on by an atom while not adjacent
#define COMSIG_RANGED_ITEM_INTERACTING_WITH_ATOM "ranged_item_interacting_with_atom"
/// Sent from [atom/proc/ranged_item_interaction], when a mob is using this item while right-clicking on by an atom while not adjacent
#define COMSIG_RANGED_ITEM_INTERACTING_WITH_ATOM_SECONDARY "ranged_item_interacting_with_atom_secondary"
/// Sent from /obj/item/update_weight_class(). (old_w_class, new_w_class)
#define COMSIG_ITEM_WEIGHT_CLASS_CHANGED "item_weight_class_changed"
/// Sent from /obj/item/update_weight_class(), to its loc. (obj/item/changed_item, old_w_class, new_w_class)
#define COMSIG_ATOM_CONTENTS_WEIGHT_CLASS_CHANGED "atom_contents_weight_class_changed"
