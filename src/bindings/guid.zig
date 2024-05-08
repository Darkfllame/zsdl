const common = @import("common.zig");

const Uint8 = common.Uint8;

pub const SDL_GUID = extern struct {
    data: [16]Uint8,
};

pub extern fn SDL_GUIDToString(guid: SDL_GUID, pszGUID: [*]u8, cbGUID: c_int) [*]const u8;
pub extern fn SDL_GUIDFromString(pchGUID: [*c]const u8) ?[*]const u8;
