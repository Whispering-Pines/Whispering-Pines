#define isammocasing(A) (istype(A, /obj/item/ammo_casing))
/// Within given range and on the same z level (get dist is WEIRD bro)
#define IN_GIVEN_RANGE(source, other, given_range) (get_dist(source, other) <= given_range && (get_step(source, 0)?:z) == (get_step(other, 0)?:z))
/// Checks if the value is "right" - same as ISEVEN, but used primarily for hand or foot index contexts
#define IS_RIGHT_INDEX(value) (value % 2 == 0)
/// Checks if the value is "left" - same as ISODD, but used primarily for hand or foot index contexts
#define IS_LEFT_INDEX(value) (value % 2 != 0)
