const sdl = @import("sdl.zig");

const SDL_bool = sdl.SDL_bool;
const Sint8 = sdl.Sint8;
const Uint8 = sdl.Uint8;
const Sint16 = sdl.Sint16;
const Uint16 = sdl.Uint16;
const Sint32 = sdl.Sint32;
const Uint32 = sdl.Uint32;
const Sint64 = sdl.Sint64;
const Uint64 = sdl.Uint64;
const SDL_GUID = sdl.SDL_GUID;

pub const SDL_JoystickGUID = SDL_GUID;
pub const SDL_Joystick = opaque {};
pub const SDL_JoystickID = Sint32;

pub const SDL_IPHONE_MAX_GFORCE = 5.0;
pub const SDL_VIRTUAL_JOYSTICK_DESC_VERSION: c_int = 1;
pub const SDL_JOYSTICK_AXIS_MAX: c_short = 32767;
pub const SDL_JOYSTICK_AXIS_MIN: c_short = -32768;
pub const SDL_HAT_CENTERED: c_int = 0x00;
pub const SDL_HAT_UP: c_int = 0x01;
pub const SDL_HAT_RIGHT: c_int = 0x02;
pub const SDL_HAT_DOWN: c_int = 0x04;
pub const SDL_HAT_LEFT: c_int = 0x08;
pub const SDL_HAT_RIGHTUP = (SDL_HAT_RIGHT | SDL_HAT_UP);
pub const SDL_HAT_RIGHTDOWN = (SDL_HAT_RIGHT | SDL_HAT_DOWN);
pub const SDL_HAT_LEFTUP = (SDL_HAT_LEFT | SDL_HAT_UP);
pub const SDL_HAT_LEFTDOWN = (SDL_HAT_LEFT | SDL_HAT_DOWN);

pub const SDL_JoystickType = c_uint;
pub const SDL_JOYSTICK_TYPE_UNKNOWN: SDL_JoystickType = 0;
pub const SDL_JOYSTICK_TYPE_GAMECONTROLLER: SDL_JoystickType = 1;
pub const SDL_JOYSTICK_TYPE_WHEEL: SDL_JoystickType = 2;
pub const SDL_JOYSTICK_TYPE_ARCADE_STICK: SDL_JoystickType = 3;
pub const SDL_JOYSTICK_TYPE_FLIGHT_STICK: SDL_JoystickType = 4;
pub const SDL_JOYSTICK_TYPE_DANCE_PAD: SDL_JoystickType = 5;
pub const SDL_JOYSTICK_TYPE_GUITAR: SDL_JoystickType = 6;
pub const SDL_JOYSTICK_TYPE_DRUM_KIT: SDL_JoystickType = 7;
pub const SDL_JOYSTICK_TYPE_ARCADE_PAD: SDL_JoystickType = 8;
pub const SDL_JOYSTICK_TYPE_THROTTLE: SDL_JoystickType = 9;

pub const SDL_JoystickPowerLevel = c_int;
pub const SDL_JOYSTICK_POWER_UNKNOWN: SDL_JoystickPowerLevel = -1;
pub const SDL_JOYSTICK_POWER_EMPTY: SDL_JoystickPowerLevel = 0;
pub const SDL_JOYSTICK_POWER_LOW: SDL_JoystickPowerLevel = 1;
pub const SDL_JOYSTICK_POWER_MEDIUM: SDL_JoystickPowerLevel = 2;
pub const SDL_JOYSTICK_POWER_FULL: SDL_JoystickPowerLevel = 3;
pub const SDL_JOYSTICK_POWER_WIRED: SDL_JoystickPowerLevel = 4;
pub const SDL_JOYSTICK_POWER_MAX: SDL_JoystickPowerLevel = 5;

pub const SDL_VirtualJoystickDesc = extern struct {
    version: Uint16,
    type: Uint16,
    naxes: Uint16,
    nbuttons: Uint16,
    nhats: Uint16,
    vendor_id: Uint16,
    product_id: Uint16,
    padding: Uint16,
    button_mask: Uint32,
    axis_mask: Uint32,
    name: [*]const u8,
    userdata: ?*anyopaque,
    Update: ?*const fn (?*anyopaque) callconv(.C) void,
    SetPlayerIndex: ?*const fn (?*anyopaque, c_int) callconv(.C) void,
    Rumble: ?*const fn (?*anyopaque, Uint16, Uint16) callconv(.C) c_int,
    RumbleTriggers: ?*const fn (?*anyopaque, Uint16, Uint16) callconv(.C) c_int,
    SetLED: ?*const fn (?*anyopaque, Uint8, Uint8, Uint8) callconv(.C) c_int,
    SendEffect: ?*const fn (?*anyopaque, ?*const anyopaque, c_int) callconv(.C) c_int,
};

pub extern fn SDL_LockJoysticks() void;
pub extern fn SDL_UnlockJoysticks() void;
pub extern fn SDL_NumJoysticks() c_int;
pub extern fn SDL_JoystickNameForIndex(device_index: c_int) ?[*]const u8;
pub extern fn SDL_JoystickPathForIndex(device_index: c_int) ?[*]const u8;
pub extern fn SDL_JoystickGetDevicePlayerIndex(device_index: c_int) c_int;
pub extern fn SDL_JoystickGetDeviceGUID(device_index: c_int) SDL_JoystickGUID;
pub extern fn SDL_JoystickGetDeviceVendor(device_index: c_int) Uint16;
pub extern fn SDL_JoystickGetDeviceProduct(device_index: c_int) Uint16;
pub extern fn SDL_JoystickGetDeviceProductVersion(device_index: c_int) Uint16;
pub extern fn SDL_JoystickGetDeviceType(device_index: c_int) SDL_JoystickType;
pub extern fn SDL_JoystickGetDeviceInstanceID(device_index: c_int) SDL_JoystickID;
pub extern fn SDL_JoystickOpen(device_index: c_int) *SDL_Joystick;
pub extern fn SDL_JoystickFromInstanceID(instance_id: SDL_JoystickID) ?*SDL_Joystick;
pub extern fn SDL_JoystickFromPlayerIndex(player_index: c_int) ?*SDL_Joystick;
pub extern fn SDL_JoystickAttachVirtual(@"type": SDL_JoystickType, naxes: c_int, nbuttons: c_int, nhats: c_int) c_int;
pub extern fn SDL_JoystickAttachVirtualEx(desc: *const SDL_VirtualJoystickDesc) c_int;
pub extern fn SDL_JoystickDetachVirtual(device_index: c_int) c_int;
pub extern fn SDL_JoystickIsVirtual(device_index: c_int) SDL_bool;
pub extern fn SDL_JoystickSetVirtualAxis(joystick: *SDL_Joystick, axis: c_int, value: Sint16) c_int;
pub extern fn SDL_JoystickSetVirtualButton(joystick: *SDL_Joystick, button: c_int, value: Uint8) c_int;
pub extern fn SDL_JoystickSetVirtualHat(joystick: *SDL_Joystick, hat: c_int, value: Uint8) c_int;
pub extern fn SDL_JoystickName(joystick: *SDL_Joystick) ?[*]const u8;
pub extern fn SDL_JoystickPath(joystick: *SDL_Joystick) ?[*]const u8;
pub extern fn SDL_JoystickGetPlayerIndex(joystick: *SDL_Joystick) c_int;
pub extern fn SDL_JoystickSetPlayerIndex(joystick: *SDL_Joystick, player_index: c_int) void;
pub extern fn SDL_JoystickGetGUID(joystick: *SDL_Joystick) SDL_JoystickGUID;
pub extern fn SDL_JoystickGetVendor(joystick: *SDL_Joystick) Uint16;
pub extern fn SDL_JoystickGetProduct(joystick: *SDL_Joystick) Uint16;
pub extern fn SDL_JoystickGetProductVersion(joystick: *SDL_Joystick) Uint16;
pub extern fn SDL_JoystickGetFirmwareVersion(joystick: *SDL_Joystick) Uint16;
pub extern fn SDL_JoystickGetSerial(joystick: *SDL_Joystick) [*]const u8;
pub extern fn SDL_JoystickGetType(joystick: *SDL_Joystick) SDL_JoystickType;
pub extern fn SDL_JoystickGetGUIDString(guid: SDL_JoystickGUID, pszGUID: [*]u8, cbGUID: c_int) void;
pub extern fn SDL_JoystickGetGUIDFromString(pchGUID: [*]const u8) SDL_JoystickGUID;
pub extern fn SDL_GetJoystickGUIDInfo(guid: SDL_JoystickGUID, vendor: ?*Uint16, product: ?*Uint16, version: ?*Uint16, crc16: ?*Uint16) void;
pub extern fn SDL_JoystickGetAttached(joystick: *SDL_Joystick) SDL_bool;
pub extern fn SDL_JoystickInstanceID(joystick: *SDL_Joystick) SDL_JoystickID;
pub extern fn SDL_JoystickNumAxes(joystick: *SDL_Joystick) c_int;
pub extern fn SDL_JoystickNumBalls(joystick: *SDL_Joystick) c_int;
pub extern fn SDL_JoystickNumHats(joystick: *SDL_Joystick) c_int;
pub extern fn SDL_JoystickNumButtons(joystick: *SDL_Joystick) c_int;
pub extern fn SDL_JoystickUpdate() void;
pub extern fn SDL_JoystickEventState(state: c_int) c_int;
pub extern fn SDL_JoystickGetAxis(joystick: *SDL_Joystick, axis: c_int) Sint16;
pub extern fn SDL_JoystickGetAxisInitialState(joystick: *SDL_Joystick, axis: c_int, state: ?*Sint16) SDL_bool;
pub extern fn SDL_JoystickGetHat(joystick: *SDL_Joystick, hat: c_int) Uint8;
pub extern fn SDL_JoystickGetBall(joystick: *SDL_Joystick, ball: c_int, dx: ?*c_int, dy: ?*c_int) c_int;
pub extern fn SDL_JoystickGetButton(joystick: *SDL_Joystick, button: c_int) Uint8;
pub extern fn SDL_JoystickRumble(joystick: *SDL_Joystick, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16, duration_ms: Uint32) c_int;
pub extern fn SDL_JoystickRumbleTriggers(joystick: *SDL_Joystick, left_rumble: Uint16, right_rumble: Uint16, duration_ms: Uint32) c_int;
pub extern fn SDL_JoystickHasLED(joystick: *SDL_Joystick) SDL_bool;
pub extern fn SDL_JoystickHasRumble(joystick: *SDL_Joystick) SDL_bool;
pub extern fn SDL_JoystickHasRumbleTriggers(joystick: *SDL_Joystick) SDL_bool;
pub extern fn SDL_JoystickSetLED(joystick: *SDL_Joystick, red: Uint8, green: Uint8, blue: Uint8) c_int;
pub extern fn SDL_JoystickSendEffect(joystick: *SDL_Joystick, data: ?*const anyopaque, size: c_int) c_int;
pub extern fn SDL_JoystickClose(joystick: *SDL_Joystick) void;
pub extern fn SDL_JoystickCurrentPowerLevel(joystick: *SDL_Joystick) SDL_JoystickPowerLevel;
