const std = @import("std");
const root = @import("sdl.zig");
const sdl = @import("bindings");

pub const GUID = struct {
    data: [16]u8,

    pub inline fn toString(self: GUID, out: [:0]u8) void {
        sdl.SDL_GUIDToString(self, @ptrCast(out), @intCast(out.len));
    }
    pub inline fn fromString(out: [:0]const u8) GUID {
        return sdl.SDL_GUIDFromString(@ptrCast(out));
    }
};
