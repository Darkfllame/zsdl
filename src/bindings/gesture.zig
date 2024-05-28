const sdl = @import("sdl");

const Sint64 = sdl.Sint64;
const SDL_TouchID = sdl.SDL_TouchID;
const SDL_RWops = sdl.SDL_RWops;

pub const SDL_GestureID = Sint64;

pub extern fn SDL_RecordGesture(touchId: SDL_TouchID) c_int;
pub extern fn SDL_SaveAllDollarTemplates(dst: *SDL_RWops) c_int;
pub extern fn SDL_SaveDollarTemplate(gestureId: SDL_GestureID, dst: *SDL_RWops) c_int;
pub extern fn SDL_LoadDollarTemplates(touchId: SDL_TouchID, src: *SDL_RWops) c_int;
