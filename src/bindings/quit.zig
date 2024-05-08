const common = @import("common.zig");

pub inline fn SDL_QuitRequested() bool {
    common.SDL_PumpEvents();
    return common.SDL_PeepEvents(
        null,
        0,
        common.SDL_PEEKEVENT,
        common.SDL_QUIT,
        common.SDL_QUIT,
    ) > 0;
}
