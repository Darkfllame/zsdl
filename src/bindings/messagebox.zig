const sdl = @import("sdl");

const Uint8 = sdl.Uint8;
const Uint32 = sdl.Uint32;
const SDL_Window = sdl.SDL_Window;

pub const SDL_MessageBoxFlags = c_uint;
pub const SDL_MESSAGEBOX_ERROR: SDL_MessageBoxFlags = 16;
pub const SDL_MESSAGEBOX_WARNING: SDL_MessageBoxFlags = 32;
pub const SDL_MESSAGEBOX_INFORMATION: SDL_MessageBoxFlags = 64;
pub const SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT: SDL_MessageBoxFlags = 128;
pub const SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT: SDL_MessageBoxFlags = 256;

pub const SDL_MessageBoxButtonFlags = c_uint;
pub const SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT: SDL_MessageBoxButtonFlags = 1;
pub const SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT: SDL_MessageBoxButtonFlags = 2;

pub const SDL_MessageBoxColorType = c_uint;
pub const SDL_MESSAGEBOX_COLOR_BACKGROUND: SDL_MessageBoxColorType = 0;
pub const SDL_MESSAGEBOX_COLOR_TEXT: SDL_MessageBoxColorType = 1;
pub const SDL_MESSAGEBOX_COLOR_BUTTON_BORDER: SDL_MessageBoxColorType = 2;
pub const SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND: SDL_MessageBoxColorType = 3;
pub const SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED: SDL_MessageBoxColorType = 4;

pub const SDL_MESSAGEBOX_COLOR_MAX = 5;

pub const SDL_MessageBoxButtonData = extern struct {
    flags: SDL_MessageBoxButtonFlags,
    buttonid: c_int,
    text: [*:0]const u8,
};
pub const SDL_MessageBoxColor = extern struct {
    r: Uint8,
    g: Uint8,
    b: Uint8,
};
pub const SDL_MessageBoxColorScheme = extern struct {
    colors: [SDL_MESSAGEBOX_COLOR_MAX]SDL_MessageBoxColor,
};
pub const SDL_MessageBoxData = extern struct {
    flags: SDL_MessageBoxFlags,
    window: ?*SDL_Window,
    title: [*:0]const u8,
    message: [*:0]const u8,
    numbuttons: c_int,
    buttons: [*]const SDL_MessageBoxButtonData,
    colorScheme: ?*const SDL_MessageBoxColorScheme,
};

pub extern fn SDL_ShowMessageBox(messageboxdata: *const SDL_MessageBoxData, buttonid: ?*c_int) c_int;
pub extern fn SDL_ShowSimpleMessageBox(flags: SDL_MessageBoxFlags, title: [*:0]const u8, message: [*:0]const u8, window: ?*SDL_Window) c_int;
