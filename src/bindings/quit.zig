const sdl = @import("sdl");

pub inline fn SDL_QuitRequested() bool {
    sdl.SDL_PumpEvents();
    return sdl.SDL_PeepEvents(
        null,
        0,
        sdl.SDL_PEEKEVENT,
        sdl.SDL_QUIT,
        sdl.SDL_QUIT,
    ) > 0;
}
