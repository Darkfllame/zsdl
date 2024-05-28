const std = @import("std");
const root = @import("sdl.zig");
const sdl = @import("bindings");

pub const TouchID = i64;
pub const FingerID = i64;

pub const TouchDeviceType = enum(c_int) {
    Invalid = sdl.SDL_TOUCH_DEVICE_INVALID,
    Direct = sdl.SDL_TOUCH_DEVICE_DIRECT,
    IndirectAbsolute = sdl.SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE,
    IndirectRelative = sdl.SDL_TOUCH_DEVICE_INDIRECT_RELATIVE,
};

pub const MouseTouchID: TouchID = @truncate(-1);

pub const Finger = struct {
    id: FingerID,
    x: f32,
    y: f32,
    pressure: f32,
};

pub inline fn getNumTouchDevices() u32 {
    return @intCast(sdl.SDL_GetNumTouchDevices());
}
pub inline fn getTouchDevice(index: u32) TouchID {
    return sdl.SDL_GetTouchDevice(@intCast(index));
}
pub inline fn getTouchName(index: u32) []const u8 {
    return std.mem.span(sdl.SDL_GetTouchName(@intCast(index)));
}
pub inline fn getTouchDeviceType(touchID: TouchID) TouchDeviceType {
    return @enumFromInt(sdl.SDL_GgetTouchDeviceType(touchID));
}
pub inline fn getNumTouchFingers(touchID: TouchID) u32 {
    return @intCast(sdl.SDL_GetNumTouchFingers(touchID));
}
pub inline fn getTouchFinger(touchID: TouchID, index: u32) root.Error!*Finger {
    return sdl.SDL_GetTouchFinger(touchID, @intCast(index)) orelse error.SdlError;
}
