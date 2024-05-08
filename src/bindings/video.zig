const common = @import("common.zig");

const SDL_bool = common.SDL_bool;
const Uint16 = common.Uint16;
const Uint32 = common.Uint32;
const SDL_Rect = common.SDL_Rect;
const SDL_Point = common.SDL_Point;
const SDL_Surface = common.SDL_Surface;

pub const SDL_WINDOWPOS_UNDEFINED_MASK = 0x1FFF0000;
pub const SDL_WINDOWPOS_UNDEFINED = SDL_WINDOWPOS_UNDEFINED_DISPLAY(0);
pub const SDL_WINDOWPOS_CENTERED_MASK = 0x2FFF0000;
pub const SDL_WINDOWPOS_CENTERED = SDL_WINDOWPOS_CENTERED_DISPLAY(0);

pub inline fn SDL_WINDOWPOS_UNDEFINED_DISPLAY(X: c_int) c_int {
    return SDL_WINDOWPOS_UNDEFINED_MASK | X;
}
pub inline fn SDL_WINDOWPOS_ISUNDEFINED(X: c_int) bool {
    return (X & 0xFFFF0000) == SDL_WINDOWPOS_UNDEFINED_MASK;
}
pub inline fn SDL_WINDOWPOS_CENTERED_DISPLAY(X: c_int) c_int {
    return SDL_WINDOWPOS_CENTERED_MASK | X;
}
pub inline fn SDL_WINDOWPOS_ISCENTERED(X: c_int) bool {
    return (X & 0xFFFF0000) == SDL_WINDOWPOS_CENTERED_MASK;
}

pub const SDL_HitTest = *const fn (window: *SDL_Window, area: *const SDL_Point, data: ?*anyopaque) callconv(.C) SDL_HitTestResult;
pub const SDL_DisplayMode = extern struct {
    format: Uint32 = @import("std").mem.zeroes(Uint32),
    w: c_int = @import("std").mem.zeroes(c_int),
    h: c_int = @import("std").mem.zeroes(c_int),
    refresh_rate: c_int = @import("std").mem.zeroes(c_int),
    driverdata: ?*anyopaque = @import("std").mem.zeroes(?*anyopaque),
};
pub const SDL_Window = opaque {};

pub const SDL_WindowFlags = c_uint;
pub const SDL_WINDOW_FULLSCREEN: SDL_WindowFlags = 0x00000001;
pub const SDL_WINDOW_OPENGL: SDL_WindowFlags = 0x00000002;
pub const SDL_WINDOW_SHOWN: SDL_WindowFlags = 0x00000004;
pub const SDL_WINDOW_HIDDEN: SDL_WindowFlags = 0x00000008;
pub const SDL_WINDOW_BORDERLESS: SDL_WindowFlags = 0x00000010;
pub const SDL_WINDOW_RESIZABLE: SDL_WindowFlags = 0x00000020;
pub const SDL_WINDOW_MINIMIZED: SDL_WindowFlags = 0x00000040;
pub const SDL_WINDOW_MAXIMIZED: SDL_WindowFlags = 0x00000080;
pub const SDL_WINDOW_MOUSE_GRABBED: SDL_WindowFlags = 0x00000100;
pub const SDL_WINDOW_INPUT_GRABBED: SDL_WindowFlags = SDL_WINDOW_MOUSE_GRABBED;
pub const SDL_WINDOW_INPUT_FOCUS: SDL_WindowFlags = 0x00000200;
pub const SDL_WINDOW_MOUSE_FOCUS: SDL_WindowFlags = 0x00000400;
pub const SDL_WINDOW_FOREIGN: SDL_WindowFlags = 0x00000800;
pub const SDL_WINDOW_FULLSCREEN_DESKTOP: SDL_WindowFlags = SDL_WINDOW_FULLSCREEN | 0x00001000;
pub const SDL_WINDOW_ALLOW_HIGHDPI: SDL_WindowFlags = 0x00002000;
pub const SDL_WINDOW_MOUSE_CAPTURE: SDL_WindowFlags = 0x00004000;
pub const SDL_WINDOW_ALWAYS_ON_TOP: SDL_WindowFlags = 0x00008000;
pub const SDL_WINDOW_SKIP_TASKBAR: SDL_WindowFlags = 0x00010000;
pub const SDL_WINDOW_UTILITY: SDL_WindowFlags = 0x00020000;
pub const SDL_WINDOW_TOOLTIP: SDL_WindowFlags = 0x00040000;
pub const SDL_WINDOW_POPUP_MENU: SDL_WindowFlags = 0x00080000;
pub const SDL_WINDOW_KEYBOARD_GRABBED: SDL_WindowFlags = 0x00100000;
pub const SDL_WINDOW_VULKAN: SDL_WindowFlags = 0x10000000;
pub const SDL_WINDOW_METAL: SDL_WindowFlags = 0x20000000;

pub const SDL_WindowEventID = c_uint;
pub const SDL_WINDOWEVENT_NONE: SDL_WindowEventID = 0;
pub const SDL_WINDOWEVENT_SHOWN: SDL_WindowEventID = 1;
pub const SDL_WINDOWEVENT_HIDDEN: SDL_WindowEventID = 2;
pub const SDL_WINDOWEVENT_EXPOSED: SDL_WindowEventID = 3;
pub const SDL_WINDOWEVENT_MOVED: SDL_WindowEventID = 4;
pub const SDL_WINDOWEVENT_RESIZED: SDL_WindowEventID = 5;
pub const SDL_WINDOWEVENT_SIZE_CHANGED: SDL_WindowEventID = 6;
pub const SDL_WINDOWEVENT_MINIMIZED: SDL_WindowEventID = 7;
pub const SDL_WINDOWEVENT_MAXIMIZED: SDL_WindowEventID = 8;
pub const SDL_WINDOWEVENT_RESTORED: SDL_WindowEventID = 9;
pub const SDL_WINDOWEVENT_ENTER: SDL_WindowEventID = 10;
pub const SDL_WINDOWEVENT_LEAVE: SDL_WindowEventID = 11;
pub const SDL_WINDOWEVENT_FOCUS_GAINED: SDL_WindowEventID = 12;
pub const SDL_WINDOWEVENT_FOCUS_LOST: SDL_WindowEventID = 13;
pub const SDL_WINDOWEVENT_CLOSE: SDL_WindowEventID = 14;
pub const SDL_WINDOWEVENT_TAKE_FOCUS: SDL_WindowEventID = 15;
pub const SDL_WINDOWEVENT_HIT_TEST: SDL_WindowEventID = 16;
pub const SDL_WINDOWEVENT_ICCPROF_CHANGED: SDL_WindowEventID = 17;
pub const SDL_WINDOWEVENT_DISPLAY_CHANGED: SDL_WindowEventID = 18;

pub const SDL_DisplayEventID = c_uint;
pub const SDL_DISPLAYEVENT_NONE: SDL_DisplayEventID = 0;
pub const SDL_DISPLAYEVENT_ORIENTATION: SDL_DisplayEventID = 1;
pub const SDL_DISPLAYEVENT_CONNECTED: SDL_DisplayEventID = 2;
pub const SDL_DISPLAYEVENT_DISCONNECTED: SDL_DisplayEventID = 3;
pub const SDL_DISPLAYEVENT_MOVED: SDL_DisplayEventID = 4;

pub const SDL_DisplayOrientation = c_uint;
pub const SDL_ORIENTATION_UNKNOWN: SDL_DisplayOrientation = 0;
pub const SDL_ORIENTATION_LANDSCAPE: SDL_DisplayOrientation = 1;
pub const SDL_ORIENTATION_LANDSCAPE_FLIPPED: SDL_DisplayOrientation = 2;
pub const SDL_ORIENTATION_PORTRAIT: SDL_DisplayOrientation = 3;
pub const SDL_ORIENTATION_PORTRAIT_FLIPPED: SDL_DisplayOrientation = 4;

pub const SDL_FlashOperation = c_uint;
pub const SDL_FLASH_CANCEL: SDL_FlashOperation = 0;
pub const SDL_FLASH_BRIEFLY: SDL_FlashOperation = 1;
pub const SDL_FLASH_UNTIL_FOCUSED: SDL_FlashOperation = 2;

pub const SDL_GLContext = ?*anyopaque;

pub const SDL_GLattr = c_uint;
pub const SDL_GL_RED_SIZE: SDL_GLattr = 0;
pub const SDL_GL_GREEN_SIZE: SDL_GLattr = 1;
pub const SDL_GL_BLUE_SIZE: SDL_GLattr = 2;
pub const SDL_GL_ALPHA_SIZE: SDL_GLattr = 3;
pub const SDL_GL_BUFFER_SIZE: SDL_GLattr = 4;
pub const SDL_GL_DOUBLEBUFFER: SDL_GLattr = 5;
pub const SDL_GL_DEPTH_SIZE: SDL_GLattr = 6;
pub const SDL_GL_STENCIL_SIZE: SDL_GLattr = 7;
pub const SDL_GL_ACCUM_RED_SIZE: SDL_GLattr = 8;
pub const SDL_GL_ACCUM_GREEN_SIZE: SDL_GLattr = 9;
pub const SDL_GL_ACCUM_BLUE_SIZE: SDL_GLattr = 10;
pub const SDL_GL_ACCUM_ALPHA_SIZE: SDL_GLattr = 11;
pub const SDL_GL_STEREO: SDL_GLattr = 12;
pub const SDL_GL_MULTISAMPLEBUFFERS: SDL_GLattr = 13;
pub const SDL_GL_MULTISAMPLESAMPLES: SDL_GLattr = 14;
pub const SDL_GL_ACCELERATED_VISUAL: SDL_GLattr = 15;
pub const SDL_GL_RETAINED_BACKING: SDL_GLattr = 16;
pub const SDL_GL_CONTEXT_MAJOR_VERSION: SDL_GLattr = 17;
pub const SDL_GL_CONTEXT_MINOR_VERSION: SDL_GLattr = 18;
pub const SDL_GL_CONTEXT_EGL: SDL_GLattr = 19;
pub const SDL_GL_CONTEXT_FLAGS: SDL_GLattr = 20;
pub const SDL_GL_CONTEXT_PROFILE_MASK: SDL_GLattr = 21;
pub const SDL_GL_SHARE_WITH_CURRENT_CONTEXT: SDL_GLattr = 22;
pub const SDL_GL_FRAMEBUFFER_SRGB_CAPABLE: SDL_GLattr = 23;
pub const SDL_GL_CONTEXT_RELEASE_BEHAVIOR: SDL_GLattr = 24;
pub const SDL_GL_CONTEXT_RESET_NOTIFICATION: SDL_GLattr = 25;
pub const SDL_GL_CONTEXT_NO_ERROR: SDL_GLattr = 26;
pub const SDL_GL_FLOATBUFFERS: SDL_GLattr = 27;

pub const SDL_GLprofile = c_uint;
pub const SDL_GL_CONTEXT_PROFILE_CORE: SDL_GLprofile = 1;
pub const SDL_GL_CONTEXT_PROFILE_COMPATIBILITY: SDL_GLprofile = 2;
pub const SDL_GL_CONTEXT_PROFILE_ES: SDL_GLprofile = 4;

pub const SDL_GLcontextFlag = c_uint;
pub const SDL_GL_CONTEXT_DEBUG_FLAG: SDL_GLcontextFlag = 1;
pub const SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG: SDL_GLcontextFlag = 2;
pub const SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG: SDL_GLcontextFlag = 4;
pub const SDL_GL_CONTEXT_RESET_ISOLATION_FLAG: SDL_GLcontextFlag = 8;

pub const SDL_GLcontextReleaseFlag = c_uint;
pub const SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE: SDL_GLcontextReleaseFlag = 0;
pub const SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH: SDL_GLcontextReleaseFlag = 1;

pub const SDL_GLContextResetNotification = c_uint;
pub const SDL_GL_CONTEXT_RESET_NO_NOTIFICATION: SDL_GLContextResetNotification = 0;
pub const SDL_GL_CONTEXT_RESET_LOSE_CONTEXT: SDL_GLContextResetNotification = 1;

pub const SDL_HitTestResult = c_uint;
pub const SDL_HITTEST_NORMAL: SDL_HitTestResult = 0;
pub const SDL_HITTEST_DRAGGABLE: SDL_HitTestResult = 1;
pub const SDL_HITTEST_RESIZE_TOPLEFT: SDL_HitTestResult = 2;
pub const SDL_HITTEST_RESIZE_TOP: SDL_HitTestResult = 3;
pub const SDL_HITTEST_RESIZE_TOPRIGHT: SDL_HitTestResult = 4;
pub const SDL_HITTEST_RESIZE_RIGHT: SDL_HitTestResult = 5;
pub const SDL_HITTEST_RESIZE_BOTTOMRIGHT: SDL_HitTestResult = 6;
pub const SDL_HITTEST_RESIZE_BOTTOM: SDL_HitTestResult = 7;
pub const SDL_HITTEST_RESIZE_BOTTOMLEFT: SDL_HitTestResult = 8;
pub const SDL_HITTEST_RESIZE_LEFT: SDL_HitTestResult = 9;

pub extern fn SDL_GetNumVideoDrivers() c_int;
pub extern fn SDL_GetVideoDriver(index: c_int) ?[*]const u8;
pub extern fn SDL_VideoInit(driver_name: ?[*]const u8) c_int;
pub extern fn SDL_VideoQuit() void;
pub extern fn SDL_GetCurrentVideoDriver() ?[*]const u8;
pub extern fn SDL_GetNumVideoDisplays() c_int;
pub extern fn SDL_GetDisplayName(displayIndex: c_int) ?[*]const u8;
pub extern fn SDL_GetDisplayBounds(displayIndex: c_int, rect: ?*SDL_Rect) c_int;
pub extern fn SDL_GetDisplayUsableBounds(displayIndex: c_int, rect: ?*SDL_Rect) c_int;
pub extern fn SDL_GetDisplayDPI(displayIndex: c_int, ddpi: ?*f32, hdpi: ?*f32, vdpi: ?*f32) c_int;
pub extern fn SDL_GetDisplayOrientation(displayIndex: c_int) SDL_DisplayOrientation;
pub extern fn SDL_GetNumDisplayModes(displayIndex: c_int) c_int;
pub extern fn SDL_GetDisplayMode(displayIndex: c_int, modeIndex: c_int, mode: ?*SDL_DisplayMode) c_int;
pub extern fn SDL_GetDesktopDisplayMode(displayIndex: c_int, mode: *SDL_DisplayMode) c_int;
pub extern fn SDL_GetCurrentDisplayMode(displayIndex: c_int, mode: *SDL_DisplayMode) c_int;
pub extern fn SDL_GetClosestDisplayMode(displayIndex: c_int, mode: ?*const SDL_DisplayMode, closest: ?*SDL_DisplayMode) ?*SDL_DisplayMode;
pub extern fn SDL_GetPointDisplayIndex(point: *const SDL_Point) c_int;
pub extern fn SDL_GetRectDisplayIndex(rect: *const SDL_Rect) c_int;
pub extern fn SDL_GetWindowDisplayIndex(window: *SDL_Window) c_int;
pub extern fn SDL_SetWindowDisplayMode(window: *SDL_Window, mode: ?*const SDL_DisplayMode) c_int;
pub extern fn SDL_GetWindowDisplayMode(window: *SDL_Window, mode: ?*SDL_DisplayMode) c_int;
pub extern fn SDL_GetWindowICCProfile(window: *SDL_Window, size: ?*usize) ?*anyopaque;
pub extern fn SDL_GetWindowPixelFormat(window: *SDL_Window) Uint32;
pub extern fn SDL_CreateWindow(title: [*]const u8, x: c_int, y: c_int, w: c_int, h: c_int, flags: Uint32) ?*SDL_Window;
pub extern fn SDL_CreateWindowFrom(data: ?*const anyopaque) ?*SDL_Window;
pub extern fn SDL_GetWindowID(window: *SDL_Window) Uint32;
pub extern fn SDL_GetWindowFromID(id: Uint32) ?*SDL_Window;
pub extern fn SDL_GetWindowFlags(window: *SDL_Window) Uint32;
pub extern fn SDL_SetWindowTitle(window: *SDL_Window, title: [*]const u8) void;
pub extern fn SDL_GetWindowTitle(window: *SDL_Window) [*]const u8;
pub extern fn SDL_SetWindowIcon(window: *SDL_Window, icon: *SDL_Surface) void;
pub extern fn SDL_SetWindowData(window: *SDL_Window, name: [*]const u8, userdata: ?*anyopaque) ?*anyopaque;
pub extern fn SDL_GetWindowData(window: *SDL_Window, name: [*]const u8) ?*anyopaque;
pub extern fn SDL_SetWindowPosition(window: *SDL_Window, x: c_int, y: c_int) void;
pub extern fn SDL_GetWindowPosition(window: *SDL_Window, x: ?*c_int, y: ?*c_int) void;
pub extern fn SDL_SetWindowSize(window: *SDL_Window, w: c_int, h: c_int) void;
pub extern fn SDL_GetWindowSize(window: *SDL_Window, w: ?*c_int, h: ?*c_int) void;
pub extern fn SDL_GetWindowBordersSize(window: *SDL_Window, top: ?*c_int, left: ?*c_int, bottom: ?*c_int, right: ?*c_int) c_int;
pub extern fn SDL_GetWindowSizeInPixels(window: *SDL_Window, w: ?*c_int, h: ?*c_int) void;
pub extern fn SDL_SetWindowMinimumSize(window: *SDL_Window, min_w: c_int, min_h: c_int) void;
pub extern fn SDL_GetWindowMinimumSize(window: *SDL_Window, w: ?*c_int, h: ?*c_int) void;
pub extern fn SDL_SetWindowMaximumSize(window: *SDL_Window, max_w: c_int, max_h: c_int) void;
pub extern fn SDL_GetWindowMaximumSize(window: *SDL_Window, w: ?*c_int, h: ?*c_int) void;
pub extern fn SDL_SetWindowBordered(window: *SDL_Window, bordered: SDL_bool) void;
pub extern fn SDL_SetWindowResizable(window: *SDL_Window, resizable: SDL_bool) void;
pub extern fn SDL_SetWindowAlwaysOnTop(window: *SDL_Window, on_top: SDL_bool) void;
pub extern fn SDL_ShowWindow(window: *SDL_Window) void;
pub extern fn SDL_HideWindow(window: *SDL_Window) void;
pub extern fn SDL_RaiseWindow(window: *SDL_Window) void;
pub extern fn SDL_MaximizeWindow(window: *SDL_Window) void;
pub extern fn SDL_MinimizeWindow(window: *SDL_Window) void;
pub extern fn SDL_RestoreWindow(window: *SDL_Window) void;
pub extern fn SDL_SetWindowFullscreen(window: *SDL_Window, flags: Uint32) c_int;
pub extern fn SDL_HasWindowSurface(window: *SDL_Window) SDL_bool;
pub extern fn SDL_GetWindowSurface(window: *SDL_Window) ?*SDL_Surface;
pub extern fn SDL_UpdateWindowSurface(window: *SDL_Window) c_int;
pub extern fn SDL_UpdateWindowSurfaceRects(window: *SDL_Window, rects: [*]const SDL_Rect, numrects: c_int) c_int;
pub extern fn SDL_DestroyWindowSurface(window: *SDL_Window) c_int;
pub extern fn SDL_SetWindowGrab(window: *SDL_Window, grabbed: SDL_bool) void;
pub extern fn SDL_SetWindowKeyboardGrab(window: *SDL_Window, grabbed: SDL_bool) void;
pub extern fn SDL_SetWindowMouseGrab(window: *SDL_Window, grabbed: SDL_bool) void;
pub extern fn SDL_GetWindowGrab(window: *SDL_Window) SDL_bool;
pub extern fn SDL_GetWindowKeyboardGrab(window: *SDL_Window) SDL_bool;
pub extern fn SDL_GetWindowMouseGrab(window: *SDL_Window) SDL_bool;
pub extern fn SDL_GetGrabbedWindow() ?*SDL_Window;
pub extern fn SDL_SetWindowMouseRect(window: *SDL_Window, rect: *const SDL_Rect) c_int;
pub extern fn SDL_GetWindowMouseRect(window: *SDL_Window) ?*const SDL_Rect;
pub extern fn SDL_SetWindowBrightness(window: *SDL_Window, brightness: f32) c_int;
pub extern fn SDL_GetWindowBrightness(window: *SDL_Window) f32;
pub extern fn SDL_SetWindowOpacity(window: *SDL_Window, opacity: f32) c_int;
pub extern fn SDL_GetWindowOpacity(window: *SDL_Window, out_opacity: ?*f32) c_int;
pub extern fn SDL_SetWindowModalFor(modal_window: *SDL_Window, parent_window: *SDL_Window) c_int;
pub extern fn SDL_SetWindowInputFocus(window: *SDL_Window) c_int;
pub extern fn SDL_SetWindowGammaRamp(window: *SDL_Window, red: ?*const Uint16, green: ?*const Uint16, blue: ?*const Uint16) c_int;
pub extern fn SDL_GetWindowGammaRamp(window: *SDL_Window, red: ?*Uint16, green: ?*Uint16, blue: ?*Uint16) c_int;
pub extern fn SDL_SetWindowHitTest(window: *SDL_Window, callback: ?SDL_HitTest, callback_data: ?*anyopaque) c_int;
pub extern fn SDL_FlashWindow(window: *SDL_Window, operation: SDL_FlashOperation) c_int;
pub extern fn SDL_DestroyWindow(window: *SDL_Window) void;
pub extern fn SDL_IsScreenSaverEnabled() SDL_bool;
pub extern fn SDL_EnableScreenSaver() void;
pub extern fn SDL_DisableScreenSaver() void;
pub extern fn SDL_GL_LoadLibrary(path: ?[*]const u8) c_int;
pub extern fn SDL_GL_GetProcAddress(proc: ?[*]const u8) ?*anyopaque;
pub extern fn SDL_GL_UnloadLibrary() void;
pub extern fn SDL_GL_ExtensionSupported(extension: ?[*]const u8) SDL_bool;
pub extern fn SDL_GL_ResetAttributes() void;
pub extern fn SDL_GL_SetAttribute(attr: SDL_GLattr, value: c_int) c_int;
pub extern fn SDL_GL_GetAttribute(attr: SDL_GLattr, value: ?*c_int) c_int;
pub extern fn SDL_GL_CreateContext(window: *SDL_Window) SDL_GLContext;
pub extern fn SDL_GL_MakeCurrent(window: *SDL_Window, context: SDL_GLContext) c_int;
pub extern fn SDL_GL_GetCurrentWindow() ?*SDL_Window;
pub extern fn SDL_GL_GetCurrentContext() SDL_GLContext;
pub extern fn SDL_GL_GetDrawableSize(window: *SDL_Window, w: ?*c_int, h: ?*c_int) void;
pub extern fn SDL_GL_SetSwapInterval(interval: c_int) c_int;
pub extern fn SDL_GL_GetSwapInterval() c_int;
pub extern fn SDL_GL_SwapWindow(window: *SDL_Window) void;
pub extern fn SDL_GL_DeleteContext(context: SDL_GLContext) void;
