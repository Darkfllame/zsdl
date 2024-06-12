const sdl = @import("bindings");

pub const TimerCallback = *const fn (interval: u32, param: ?*anyopaque) u32;
pub const TimerID = c_int;

pub const TICKS_PASSED = sdl.SDL_TICKS_PASSED;

pub inline fn getTicks() u32 {
    return sdl.SDL_GetTicks();
}
pub inline fn getTicks64() u64 {
    return sdl.SDL_GetTicks64();
}
pub inline fn getPerformanceCounter() u64 {
    return sdl.SDL_GetPerformanceCounter();
}
pub inline fn getPerformanceFrequency() u64 {
    return sdl.SDL_GetPerformanceFrequency();
}
pub inline fn delay(ms: u32) void {
    return sdl.SDL_Delay(ms);
}
pub inline fn addTimer(interval: u32, callback: ?TimerCallback, param: ?*anyopaque) TimerID {
    return sdl.SDL_AddTimer(interval, callback, param);
}
pub inline fn removeTimer(id: TimerID) bool {
    return sdl.SDL_RemoveTimer(id);
}
