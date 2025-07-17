/// Use this to set the base and ACTUAL pixel offsets of an object at the same time
/// You should always use this for pixel setting in typepaths, unless you want the map display to look different from in game
#define SET_PIXEL(x, y) \
	pixel_x = x; \
	pixel_y = y; \
