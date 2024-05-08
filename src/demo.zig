const std = @import("std");
const zsdl = @import("zsdl");

pub fn main() !void {
    _ = zsdl.SDL_Init(zsdl.SDL_INIT_EVERYTHING);
    defer zsdl.SDL_Quit();

    const window = zsdl.SDL_CreateWindow(
        "FINALLYYY WHOOOOO",
        zsdl.SDL_WINDOWPOS_CENTERED,
        zsdl.SDL_WINDOWPOS_CENTERED,
        800,
        600,
        0,
    ).?;
    defer zsdl.SDL_DestroyWindow(window);
    const renderer = zsdl.SDL_CreateRenderer(window, -1, 0).?;
    defer zsdl.SDL_DestroyRenderer(renderer);

    mainloop: while (true) {
        {
            var event: zsdl.SDL_Event = undefined;
            while (zsdl.SDL_PollEvent(&event) > 0) {
                if (event.type == zsdl.SDL_QUIT) {
                    break :mainloop;
                }
            }
        }

        _ = zsdl.SDL_SetRenderDrawColor(renderer, 0, 0, 0, 255);
        _ = zsdl.SDL_RenderClear(renderer);

        _ = zsdl.SDL_SetRenderDrawColor(renderer, 255, 0, 0, 255);
        _ = zsdl.SDL_RenderFillRect(renderer, &.{
            .x = 0,
            .y = 0,
            .w = 64,
            .h = 64,
        });

        zsdl.SDL_RenderPresent(renderer);
    }
}
