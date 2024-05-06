const common = @import("common.zig");

const Sint64 = common.Sint64;
const SDL_TouchID = common.SDL_TouchID;
const SDL_RWops = common.SDL_RWops;

pub const SDL_GestureID = Sint64;

pub extern fn SDL_RecordGesture(touchId: SDL_TouchID) c_int;
pub extern fn SDL_SaveAllDolarTemplates(dst: *SDL_RWops) c_int;
pub extern fn SDL_SaveDollarTemplate(gestureId: SDL_GestureID, dst: *SDL_RWops) c_int;
pub extern fn SDL_LoadDollarTemplate(touchId: SDL_TouchID, src: *SDL_RWops) c_int;
