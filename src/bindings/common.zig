pub const SDL_bool = c_uint;
pub const SDL_FALSE: SDL_bool = 0;
pub const SDL_TRUE: SDL_bool = 1;

const translationRef = @cImport({
    @cInclude("SDL.h");
});

pub const Sint8 = i8;
pub const Uint8 = u8;
pub const Sint16 = i16;
pub const Uint16 = u16;
pub const Sint32 = i32;
pub const Uint32 = u32;
pub const Sint64 = i64;
pub const Uint64 = u64;

pub inline fn SDL_FOURCC(a: u8, b: u8, c: u8, d: u8) Uint32 {
    return @as(Uint32, @intCast(a)) | (@as(Uint32, @intCast(b)) << 8) | (@as(Uint32, @intCast(c)) << 16) | (@as(Uint32, @intCast(d)) << 24);
}

pub usingnamespace @import("aduio.zig");
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
pub usingnamespace @import("mouse.zig");
pub usingnamespace @import("pixels.zig");
pub usingnamespace @import("quit.zig");
pub usingnamespace @import("rect.zig");
pub usingnamespace @import("rwops.zig");
pub usingnamespace @import("scancode.zig");
pub usingnamespace @import("sdl.zig");
pub usingnamespace @import("sensor.zig");
pub usingnamespace @import("surface.zig");
pub usingnamespace @import("timer.zig");
pub usingnamespace @import("touch.zig");
pub usingnamespace @import("video.zig");

comptime {
    @setEvalBranchQuota(@truncate(-1));
    @import("std").testing.refAllDeclsRecursive(@This());
}
