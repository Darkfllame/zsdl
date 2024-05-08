const common = @import("common.zig");

const SDL_bool = common.SDL_bool;
const Sint32 = common.Sint32;
const Uint32 = common.Uint32;
const Uint64 = common.Uint64;

pub const SDL_TimerCallback = *const fn (interval: Uint32, param: ?*anyopaque) Uint32;
pub const SDL_TimerID = c_int;

pub inline fn SDL_TICKS_PASSED(A: Uint32, B: Uint32) bool {
    return @as(Sint32, B -% A) <= 0;
}

pub extern fn SDL_GetTicks() Uint32;
pub extern fn SDL_GetTicks64() Uint64;
pub extern fn SDL_GetPerformanceCounter() Uint64;
pub extern fn SDL_GetPerformanceFrequency() Uint64;
pub extern fn SDL_Delay(ms: Uint32) void;
pub extern fn SDL_AddTimer(interval: Uint32, callback: ?SDL_TimerCallback, param: ?*anyopaque) SDL_TimerID;
pub extern fn SDL_RemoveTimer(id: SDL_TimerID) SDL_bool;
