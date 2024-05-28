const std = @import("std");
const root = @import("sdl.zig");
const sdl = @import("bindings");

pub const GestureID = i64;

pub inline fn recordGesture(touchId: root.TouchID) bool {
    return sdl.SDL_RecordGesture(touchId) > 0;
}
pub inline fn saveAllDollarTemplates(dst: *root.RWops) root.Error!u32 {
    const v = sdl.SDL_SaveAllDollarTemplates(@ptrCast(dst));
    return if (v == 0)
        error.SdlError
    else
        @intCast(v);
}
pub inline fn saveDollarTemplate(gestureId: GestureID, dst: *root.RWops) bool {
    return sdl.SDL_SaveDollarTemplate(gestureId, @ptrCast(dst)) > 0;
}
pub inline fn loadDollarTemplates(touchId: root.TouchID, src: *root.RWops) root.Error!u32 {
    const v = sdl.SDL_LoadDollarTemplates(touchId, @ptrCast(src));
    return if (v <= 0)
        error.SdlError
    else
        @intCast(v);
}
