const sdl = @import("sdl.zig");

const SDL_bool = sdl.SDL_bool;
const Uint8 = sdl.Uint8;
const Uint32 = sdl.Uint32;
const SDL_Window = sdl.SDL_Window;
const SDL_Surface = sdl.SDL_Surface;

pub const SDL_Cursor = opaque {};

pub const SDL_SystemCursor = c_uint;
pub const SDL_SYSTEM_CURSOR_ARROW: SDL_SystemCursor = 0;
pub const SDL_SYSTEM_CURSOR_IBEAM: SDL_SystemCursor = 1;
pub const SDL_SYSTEM_CURSOR_WAIT: SDL_SystemCursor = 2;
pub const SDL_SYSTEM_CURSOR_CROSSHAIR: SDL_SystemCursor = 3;
pub const SDL_SYSTEM_CURSOR_WAITARROW: SDL_SystemCursor = 4;
pub const SDL_SYSTEM_CURSOR_SIZENWSE: SDL_SystemCursor = 5;
pub const SDL_SYSTEM_CURSOR_SIZENESW: SDL_SystemCursor = 6;
pub const SDL_SYSTEM_CURSOR_SIZEWE: SDL_SystemCursor = 7;
pub const SDL_SYSTEM_CURSOR_SIZENS: SDL_SystemCursor = 8;
pub const SDL_SYSTEM_CURSOR_SIZEALL: SDL_SystemCursor = 9;
pub const SDL_SYSTEM_CURSOR_NO: SDL_SystemCursor = 10;
pub const SDL_SYSTEM_CURSOR_HAND: SDL_SystemCursor = 11;
pub const SDL_NUM_SYSTEM_CURSORS: SDL_SystemCursor = 12;

pub const SDL_MouseWheelDirection = c_uint;
pub const SDL_MOUSEWHEEL_NORMAL: SDL_MouseWheelDirection = 0;
pub const SDL_MOUSEWHEEL_FLIPPED: SDL_MouseWheelDirection = 1;

pub const SDL_BUTTON_LEFT: Uint32 = 1;
pub const SDL_BUTTON_MIDDLE: Uint32 = 2;
pub const SDL_BUTTON_RIGHT: Uint32 = 3;
pub const SDL_BUTTON_X1: Uint32 = 4;
pub const SDL_BUTTON_X2: Uint32 = 5;
pub const SDL_BUTTON_LMASK: Uint32 = SDL_BUTTON(SDL_BUTTON_LEFT);
pub const SDL_BUTTON_MMASK: Uint32 = SDL_BUTTON(SDL_BUTTON_MIDDLE);
pub const SDL_BUTTON_RMASK: Uint32 = SDL_BUTTON(SDL_BUTTON_RIGHT);
pub const SDL_BUTTON_X1MASK: Uint32 = SDL_BUTTON(SDL_BUTTON_X1);
pub const SDL_BUTTON_X2MASK: Uint32 = SDL_BUTTON(SDL_BUTTON_X2);

pub inline fn SDL_BUTTON(X: Uint32) Uint32 {
    return 1 << (X - 1);
}

pub extern fn SDL_GetMouseFocus() *SDL_Window;
pub extern fn SDL_GetMouseState(x: ?*c_int, y: ?*c_int) Uint32;
pub extern fn SDL_GetGlobalMouseState(x: ?*c_int, y: ?*c_int) Uint32;
pub extern fn SDL_GetRelativeMouseState(x: ?*c_int, y: ?*c_int) Uint32;
pub extern fn SDL_WrapMouseInWindow(window: *SDL_Window, x: c_int, y: c_int) void;
pub extern fn SDL_WrapMouseGlobal(x: c_int, y: c_int) c_int;
pub extern fn SDL_SetRelativeMouseMode(enabled: SDL_bool) c_int;
pub extern fn SDL_CaptureMouse(enabled: SDL_bool) c_int;
pub extern fn SDL_GetRelativeMouseMode() SDL_bool;
pub extern fn SDL_CreateCursor(
    data: [*c]const Uint8,
    mask: [*c]const Uint8,
    w: c_int,
    h: c_int,
    hot_x: c_int,
    hot_y: c_int,
) ?*SDL_Cursor;
pub extern fn SDL_CreateColorCurosr(surface: *SDL_Surface, hot_x: c_int, hot_y: c_int) ?*SDL_Cursor;
pub extern fn SDL_CreateSystemCursor(id: SDL_SystemCursor) ?*SDL_Cursor;
pub extern fn SDL_SetCursor(curosr: ?*SDL_Cursor) void;
pub extern fn SDL_GetCursor() ?*SDL_Cursor;
pub extern fn SDL_GetDefaultCursor() ?*SDL_Cursor;
pub extern fn SDL_FreeCursor(cursor: *SDL_Cursor) void;
pub extern fn SDL_ShowCursor(toggle: c_int) c_int;
