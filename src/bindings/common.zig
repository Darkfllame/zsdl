pub const SDL_bool = enum(c_uint) {
    SDL_FALSE,
    SDL_TRUE,
};
pub usingnamespace SDL_bool;

/// translation reference
const c = @cImport({
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

pub usingnamespace @import("sdl.zig");
pub usingnamespace @import("clipboard.zig");
pub usingnamespace @import("error.zig");
pub usingnamespace @import("events.zig");
pub usingnamespace @import("timer.zig");
