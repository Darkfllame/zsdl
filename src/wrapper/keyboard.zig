const std = @import("std");
const root = @import("sdl.zig");
const sdl = @import("bindings");

pub const Keysym = struct {
    scancode: root.Scancode,
    sym: root.Keycode,
    mod: u16,
    unused: u32,
};

pub inline fn getKeyboardFocus() *root.Window {
    return @ptrCast(sdl.SDL_GetKeyboardFocus());
}
pub inline fn getKeyboardState() []const u8 {
    var len: c_uint = 0;
    return sdl.SDL_GetKeyboardState(@ptrCast(&len))[0..len];
}
pub inline fn resetKeyboard() void {
    sdl.SDL_ResetKeyboard();
}
pub inline fn getModState() root.Keymod {
    return @bitCast(sdl.SDL_GetModState());
}
pub inline fn setModState(modstate: root.Keymod) void {
    sdl.SDL_SetModState(@bitCast(modstate));
}
pub inline fn getKeyFromScancode(scancode: root.Scancode) root.Keycode {
    return @enumFromInt(sdl.SDL_GetKeyFromScancode(@intFromEnum(scancode)));
}
pub inline fn getScancodeFromKey(key: root.Keycode) root.Scancode {
    return @enumFromInt(sdl.SDL_GetScancodeFromKey(@intFromEnum(key)));
}
pub inline fn getScancodeName(scancode: root.Scancode) []const u8 {
    return std.mem.span(sdl.SDL_GetScancodeName(@intFromEnum(scancode)));
}
pub inline fn getScancodeFromname(name: [:0]const u8) root.Scancode {
    return @enumFromInt(sdl.SDL_GetScancodeName(@ptrCast(name)));
}
pub inline fn getKeyName(key: root.Keycode) []const u8 {
    return std.mem.span(sdl.SDL_GetKeyName(@intFromEnum(key)));
}
pub inline fn getKeyFromName(name: [:0]const u8) root.Keycode {
    return @enumFromInt(sdl.SDL_GetKeyFromName(@ptrCast(name)));
}
pub inline fn startTextInput() void {
    sdl.SDL_StartTextInput();
}
pub inline fn isTextInputActive() bool {
    return sdl.SDL_IsTextInputActive() > 0;
}
pub inline fn stopTextInput() void {
    sdl.SDL_StopTextInput();
}
pub inline fn clearComposition() void {
    sdl.SDL_ClearComposition();
}
pub inline fn isTextInputShown() bool {
    return sdl.SDL_IsTextInputShown() > 0;
}
pub inline fn setTextInputRect(rect: *const root.Rect) void {
    sdl.SDL_SetTextInputRect(@ptrCast(rect));
}
pub inline fn hasScreenKeyboardSupport() bool {
    return sdl.SDL_HasScreenKeyboardSupport() > 0;
}
pub inline fn isScreenKeyboardShown() bool {
    return sdl.SDL_IsScreenKeyboardShown() > 0;
}
