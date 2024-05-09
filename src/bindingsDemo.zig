const std = @import("std");
const zsdl = @import("zsdl");

pub fn main() !void {
    _ = zsdl.SDL_Init(zsdl.SDL_INIT_EVERYTHING);
    defer zsdl.SDL_Quit();
}
