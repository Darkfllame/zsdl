const std = @import("std");
const zsdl = @import("zsdl");

pub fn main() !void {
    _ = zsdl.SDL_Init(zsdl.SDL_INIT_EVERYTHING);
    defer zsdl.SDL_Quit();

    const window = zsdl.SDL_CreateWindow("yobro", zsdl.SDL_WINDOWPOS_CENTERED, zsdl.SDL_WINDOWPOS_CENTERED, 800, 600, 0);
    defer zsdl.SDL_DestroyWindow(window);

    zsdl.SDL_Delay(1000);
}
