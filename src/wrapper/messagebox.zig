const root = @import("sdl.zig");
const sdl = @import("bindings");

pub const MessageBoxFlags = enum(c_uint) {
    Error = sdl.SDL_MESSAGEBOX_ERROR,
    Warning = sdl.SDL_MESSAGEBOX_WARNING,
    Information = sdl.SDL_MESSAGEBOX_INFORMATION,
    ButtonsLeftToRight = sdl.SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT,
    ButtonsRightToLeft = sdl.SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT,
};

pub const MessageBoxButtonFlags = enum(c_uint) {
    ReturnKeyDefault = sdl.SDL_MESSAGEBOX_BUTTON_RETURNKEY_DEFAULT,
    EscapeKeyDefault = sdl.SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT,
};

pub const MessageBoxColorType = enum(c_uint) {
    Background = sdl.SDL_MESSAGEBOX_COLOR_BACKGROUND,
    Text = sdl.SDL_MESSAGEBOX_COLOR_TEXT,
    ButtonBorder = sdl.SDL_MESSAGEBOX_COLOR_BUTTON_BORDER,
    ButtonBackround = sdl.SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND,
    ButtonSelected = sdl.SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED,
};

pub const MESSAGEBOX_COLOR_MAX = 5;

pub const MessageBoxButtonData = extern struct {
    flags: MessageBoxButtonFlags,
    buttonid: c_int,
    text: [*:0]const u8,
};
pub const MessageBoxColor = extern struct {
    r: u8,
    g: u8,
    b: u8,
};
pub const MessageBoxColorScheme = extern struct {
    colors: [MESSAGEBOX_COLOR_MAX]MessageBoxColor,
};
pub const MessageBoxData = extern struct {
    flags: MessageBoxFlags,
    window: ?*root.Window,
    title: [:0]const u8,
    message: [:0]const u8,
    buttons: []const MessageBoxButtonData,
    colorScheme: ?*const MessageBoxColorScheme,
};

pub inline fn showMessageBox(messageboxdata: *const MessageBoxData, buttonid: ?*i32) root.Error!void {
    return if (sdl.SDL_ShowMessageBox(&.{
        .flags = @intFromEnum(messageboxdata.flags),
        .window = @ptrCast(messageboxdata.window),
        .title = @ptrCast(messageboxdata.title),
        .message = @ptrCast(messageboxdata.message),
        .numbuttons = @intCast(messageboxdata.buttons.len),
        .buttons = @ptrCast(messageboxdata.buttons),
        .colorScheme = @ptrCast(messageboxdata.colorScheme),
    }, @ptrCast(buttonid)) < 0) error.SdlError else {};
}
pub inline fn showSimpleMessageBox(flags: MessageBoxFlags, title: [:0]const u8, message: [:0]const u8, window: ?*root.Window) i32 {
    return if (sdl.SDL_ShowSimpleMessageBox(@intFromEnum(flags), @ptrCast(title), @ptrCast(message), @ptrCast(window)) < 0) error.SdlError else {};
}
