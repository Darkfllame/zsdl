const common = @import("common.zig");

const SDL_bool = common.SDL_bool;
const Uint8 = common.Uint8;
const Uint16 = common.Uint16;
const Uint32 = common.Uint32;
const SDL_Scancode = common.SDL_Scancode;
const SDL_Keycode = common.SDL_Keycode;
const SDL_Keymod = common.SDL_Keymod;
const SDL_Window = common.SDL_Window;
const SDL_Rect = common.SDL_Rect;

pub usingnamespace @import("keycode.zig");

pub const SDL_Keysym = extern struct {
    scancode: SDL_Scancode,
    sym: SDL_Keycode,
    mod: Uint16,
    unused: Uint32,
};

pub extern fn SDL_GetKeyboardFocus() *SDL_Window;
pub extern fn SDL_GetKeyboardState(numkeys: ?*c_int) [*c]const Uint8;
pub extern fn SDL_ResetKeyboard() void;
pub extern fn SDL_GetModState() SDL_Keymod;
pub extern fn SDL_SetModState(modstate: SDL_Keymod) void;
pub extern fn SDL_GetKeyFromScancode(scancode: SDL_Scancode) SDL_Keycode;
pub extern fn SDL_GetScancodeFromKey(key: SDL_Keycode) SDL_Scancode;
pub extern fn SDL_GetScancodeName(scancode: SDL_Scancode) [*c]const u8;
pub extern fn SDL_GetScancodeFromname(name: [*c]const u8) SDL_Scancode;
pub extern fn SDL_GetKeyName(key: SDL_Keycode) [*c]const u8;
pub extern fn SDL_GetKeyFromName(name: [*c]const u8) SDL_Keycode;
pub extern fn SDL_StartTextInput() void;
pub extern fn SDL_IsTextInputActive() SDL_bool;
pub extern fn SDL_StopTextInput() void;
pub extern fn SDL_ClearComposition() void;
pub extern fn SDL_IsTextInputShown() SDL_bool;
pub extern fn SDL_SetTextInputRect(rect: *const SDL_Rect) void;
pub extern fn SDL_HasScreenKeyboardSupport() SDL_bool;
pub extern fn SDL_IsScreenKeyboardShown() SDL_bool;
