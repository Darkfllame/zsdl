const std = @import("std");

const common = @import("common.zig");

const Uint32 = common.Uint32;

pub const SDL_INIT_TIMER: Uint32 = 0x00000001;
pub const SDL_INIT_AUDIO: Uint32 = 0x00000010;
pub const SDL_INIT_VIDEO: Uint32 = 0x00000020;
pub const SDL_INIT_JOYSTICK: Uint32 = 0x00000200;
pub const SDL_INIT_HAPTIC: Uint32 = 0x00001000;
pub const SDL_INIT_GAMECONTROLLER: Uint32 = 0x00002000;
pub const SDL_INIT_EVENTS: Uint32 = 0x00004000;
pub const SDL_INIT_SENSOR: Uint32 = 0x00008000;
pub const SDL_INIT_NOPARACHUTE: Uint32 = 0x00100000;
pub const SDL_INIT_EVERYTHING: Uint32 =
    SDL_INIT_TIMER | SDL_INIT_AUDIO | SDL_INIT_VIDEO | SDL_INIT_EVENTS |
    SDL_INIT_JOYSTICK | SDL_INIT_HAPTIC | SDL_INIT_GAMECONTROLLER | SDL_INIT_SENSOR;

pub extern fn SDL_Init(flags: Uint32) c_int;
pub extern fn SDL_Quit() void;
pub extern fn SDL_InitSubSystem(flags: Uint32) c_int;
pub extern fn SDL_QuitSubSystem(flags: Uint32) void;
pub extern fn SDL_WasInit(flags: Uint32) c_int;
