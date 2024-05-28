const sdl = @import("sdl");

const Uint8 = sdl.Uint8;

pub const SDL_GUID = extern struct {
    data: [16]Uint8,
};

pub extern fn SDL_GUIDToString(guid: SDL_GUID, pszGUID: [*]u8, cbGUID: c_int) void;
pub extern fn SDL_GUIDFromString(pchGUID: [*c]const u8) SDL_GUID;
