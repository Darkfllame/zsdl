const std = @import("std");
const root = @import("sdl.zig");
const sdl = @import("bindings");

pub inline fn setClipboardText(text: [:0]const u8) c_int {
    return sdl.SDL_SetClipboardText(@ptrCast(text));
}
pub inline fn getClipboardText() []u8 {
    return std.mem.span(sdl.SDL_GetClipboardText());
}
pub inline fn hasClipboardText() bool {
    return sdl.SDL_HasClipboardText() > 0;
}
pub inline fn setPrimarySelectionText(text: [:0]const u8) root.Error!void {
    return if (sdl.SDL_SetPrimarySelectionText(@ptrCast(text)) < 0) error.SdlError else {};
}
pub inline fn getPrimarySelectionText() [:0]u8 {
    return std.mem.span(sdl.SDL_GetPrimarySelectionText());
}
pub inline fn hasPrimarySelectionText() bool {
    return sdl.SDL_HasPrimarySelectionText() > 0;
}
