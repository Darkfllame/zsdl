const std = @import("std");
const sdl = @import("bindings");

pub const Error = error{SdlError};

pub const InitFlags = packed struct {
    pub const EVERYTHING = InitFlags{
        .timer = true,
        .audio = true,
        .video = true,
        .joystick = true,
        .haptic = true,
        .gamecontroller = true,
        .events = true,
        .sensor = true,
        .noparachute = true,
    };

    timer: bool = false,
    /// Used to make the flags align with the original
    /// API. Do not modify
    _padding0: u3 = 0,
    audio: bool = false,
    video: bool = false,
    /// Used to make the flags align with the original
    /// API. Do not modify
    _padding1: u3 = 0,
    joystick: bool = false,
    /// Used to make the flags align with the original
    /// API. Do not modify
    _padding2: u2 = 0,
    haptic: bool = false,
    gamecontroller: bool = false,
    events: bool = false,
    sensor: bool = false,
    /// Used to make the flags align with the original
    /// API. Do not modify
    _padding3: u4 = 0,
    noparachute: bool = false,
    /// Used to make the flags align with the original
    /// API. Do not modify
    _padding4: u11 = 0,

    pub fn format(self: InitFlags, comptime _: []const u8, _: std.fmt.FormatOptions, stream: anytype) !void {
        try stream.print("InitFlags{{ ", .{});
        const fields = std.meta.fields(InitFlags);
        inline for (fields, 0..) |field, i| {
            if (field.type == bool) {
                if (@field(self, field.name)) {
                    var last: bool = true;
                    searchLast: inline for (fields[i + 1 ..]) |field2| {
                        if (field2.type == bool) {
                            if (@field(self, field2.name)) {
                                last = false;
                                break :searchLast;
                            }
                        }
                    }
                    try stream.print(field.name ++ "{s}", .{if (!last) ", " else ""});
                }
            }
        }
        try stream.print(" }}", .{});
    }

    comptime {
        if (@sizeOf(InitFlags) != @sizeOf(sdl.Uint32)) {
            @compileError("InitFlags should be the same size as SDL's Uint32");
        }
    }
};
pub const InitState = packed union {
    state: bool,
    flags: InitFlags,

    comptime {
        if (@sizeOf(InitState) != @sizeOf(sdl.Uint32)) {
            @compileError("InitState should be the same size as SDL's Uint32");
        }
    }
};

pub inline fn init(flags: InitFlags) Error!void {
    if (sdl.SDL_Init(@bitCast(flags)) < 0)
        return error.SdlError;
}
pub inline fn initSubSystem(flags: InitFlags) Error!void {
    if (sdl.SDL_InitSubSystem(@bitCast(flags)) < 0)
        return error.SdlError;
}
pub inline fn quit() void {
    sdl.SDL_Quit();
}
pub inline fn quitSubSystem(flags: InitFlags) void {
    sdl.SDL_QuitSubSystem(@bitCast(flags));
}
/// Return is tagges with "flags" if the given flags were empty, else return wether the
/// given flags were initialized
pub inline fn wasInit(flags: InitFlags) InitState {
    return @bitCast(sdl.SDL_WasInit(@bitCast(flags)));
}

pub usingnamespace @import("blendmode.zig");
pub usingnamespace @import("clipboard.zig");
pub usingnamespace @import("error.zig");
pub usingnamespace @import("gesture.zig");
pub usingnamespace @import("guid.zig");
pub usingnamespace @import("keyboard.zig");
pub usingnamespace @import("keycode.zig");
pub usingnamespace @import("rect.zig");
pub usingnamespace @import("rwops.zig");
pub usingnamespace @import("scancode.zig");
pub usingnamespace @import("touch.zig");
