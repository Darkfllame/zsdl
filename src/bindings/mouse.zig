const common = @import("common.zig");

const SDL_bool = common.SDL_bool;
const Uint8 = common.Uint8;
const Uint32 = common.Uint32;
const SDL_Window = common.SDL_Window;
const SDL_Surface = common.SDL_Surface;

pub const SDL_Cursor = opaque {};

pub const SDL_SystemCursor = enum(c_uint) {
    SDL_SYSTEM_CURSOR_ARROW,
    SDL_SYSTEM_CURSOR_IBEAM,
    SDL_SYSTEM_CURSOR_WAIT,
    SDL_SYSTEM_CURSOR_CROSSHAIR,
    SDL_SYSTEM_CURSOR_WAITARROW,
    SDL_SYSTEM_CURSOR_SIZENWSE,
    SDL_SYSTEM_CURSOR_SIZENESW,
    SDL_SYSTEM_CURSOR_SIZEWE,
    SDL_SYSTEM_CURSOR_SIZENS,
    SDL_SYSTEM_CURSOR_SIZEALL,
    SDL_SYSTEM_CURSOR_NO,
    SDL_SYSTEM_CURSOR_HAND,
    SDL_NUM_SYSTEM_CURSORS,
};
pub usingnamespace SDL_SystemCursor;

pub const SDL_MouseWheelDirection = enum(c_uint) {
    SDL_MOUSEWHEEL_NORMAL,
    SDL_MOUSEWHEEL_FLIPPED,
};
pub usingnamespace SDL_MouseWheelDirection;

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
