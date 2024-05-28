const buildOptins = @import("buildOptions");

pub usingnamespace switch (buildOptins.libType) {
    .bindings => @import("bindings"),
    // TODO:                pixels
    // TODO:            surface
    // TODO:                joystick
    // TODO:                gamecontroller
    // TODO:                mouse
    // TODO:            events
    // TODO:        video
    // TODO:    render
    // TODO: messagebox
    // TODO: timer
    .wrapper => @import("wrapper/sdl.zig"),
};

/// The C API for those who needs functions
/// that aren't provided by these bindings/this wrapper
pub const c = @cImport({
    @cInclude("SDL.h");
});
const std = @import("std");
const SDL = @This();

test "initialization" {
    try SDL.init(SDL.InitFlags.EVERYTHING);
    defer SDL.quit();

    std.debug.print("{any}\n", .{SDL.wasInit(.{}).state});
}
