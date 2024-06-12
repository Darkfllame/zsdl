const buildOptins = @import("buildOptions");

pub usingnamespace switch (buildOptins.libType) {
    .bindings => @import("bindings"),
    // TODO:             pixels
    // TODO:         surface
    // TODO:             joystick
    // TODO:             gamecontroller
    // TODO:             mouse
    // TODO:         events
    // TODO:     video : needed for messagebox.zig to work properly
    // TODO: render
    .wrapper => @import("wrapper/sdl.zig"),
};

/// The C API for those who needs functions
/// that aren't provided by these bindings/this wrapper
pub const c = @cImport({
    @cInclude("SDL2/SDL.h");
});
const std = @import("std");
const SDL = @This();

test "initialization" {
    try switch (buildOptins.libType) {
        .bindings => bindingsTest(),
        .wrapper => wrapperTest(),
    };
}

inline fn bindingsTest() !void {
    if (SDL.SDL_Init(SDL.SDL_INIT_EVERYTHING) < 0) {
        return error.SdlError;
    }
    defer SDL.SDL_Quit();

    std.debug.assert(SDL.SDL_WasInit(0) > 0);
}
inline fn wrapperTest() !void {
    try SDL.init(SDL.InitFlags.EVERYTHING);
    defer SDL.quit();

    std.debug.assert(SDL.wasInit(.{}).state);
}
