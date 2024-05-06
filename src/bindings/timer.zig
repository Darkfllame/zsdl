const common = @import("common.zig");

const Uint32 = common.Uint32;

pub extern fn SDL_Delay(ms: Uint32) void;
