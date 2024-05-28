const std = @import("std");

pub const SDL_bool = c_uint;
pub const SDL_FALSE: SDL_bool = 0;
pub const SDL_TRUE: SDL_bool = 1;

pub const Sint8 = i8;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;

pub inline fn SDL_FOURCC(a: u8, b: u8, c: u8, d: u8) Uint32 {
    return @as(Uint32, a) | (@as(Uint32, b) << 8) | (@as(Uint32, c) << 16) | (@as(Uint32, d) << 24);
}

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

comptime {
    @setEvalBranchQuota(@truncate(-1));
    //@import("std").testing.refAllDeclsRecursive(@This());
}

pub usingnamespace @import("audio.zig");
pub usingnamespace @import("blendmode.zig");
pub usingnamespace @import("clipboard.zig");
pub usingnamespace @import("error.zig");
pub usingnamespace @import("events.zig");
pub usingnamespace @import("gamecontroller.zig");
pub usingnamespace @import("gesture.zig");
pub usingnamespace @import("guid.zig");
pub usingnamespace @import("joystick.zig");
pub usingnamespace @import("keyboard.zig");
pub usingnamespace @import("keycode.zig");
pub usingnamespace @import("messagebox.zig");
pub usingnamespace @import("mouse.zig");
pub usingnamespace @import("pixels.zig");
pub usingnamespace @import("quit.zig");
pub usingnamespace @import("rect.zig");
pub usingnamespace @import("render.zig");
pub usingnamespace @import("rwops.zig");
pub usingnamespace @import("scancode.zig");
pub usingnamespace @import("sdl.zig");
pub usingnamespace @import("sensor.zig");
pub usingnamespace @import("surface.zig");
pub usingnamespace @import("timer.zig");
pub usingnamespace @import("touch.zig");
pub usingnamespace @import("video.zig");
