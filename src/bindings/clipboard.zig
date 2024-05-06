const common = @import("common.zig");

const SDL_bool = common.SDL_bool;

pub extern fn SDL_SetClipboardText(text: [*c]const u8) c_int;
pub extern fn SDL_GetClipboardText() [*c]u8;
pub extern fn SDL_HasClipboardText() SDL_bool;
pub extern fn SDL_SetPrimarySelectionText(text: [*c]const u8) c_int;
pub extern fn SDL_GetPrimarySelectionText() [*c]u8;
pub extern fn SDL_HasPrimarySelectionText() SDL_bool;
