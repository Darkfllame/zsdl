const common = @import("common.zig");

const SDL_bool = common.SDL_bool;
const Uint8 = common.Uint8;
const Sint16 = common.Sint16;
const Uint16 = common.Uint16;
const Uint32 = common.Uint32;
const Uint64 = common.Uint64;
const SDL_RWops = common.SDL_RWops;
const SDL_JoystickGUID = common.SDL_JoystickGUID;
const SDL_JoystickID = common.SDL_JoystickID;
const SDL_Joystick = common.SDL_Joystick;
const SDL_SensorType = common.SDL_SensorType;

pub const SDL_GameController = opaque {};
pub const SDL_GameControllerButtonBind = extern struct {
    bindType: SDL_GameControllerBindType,
    value: extern union {
        button: c_int,
        axis: c_int,
        hat: extern struct {
            hat: c_int,
            hat_mask: c_int,
        },
    },
};

pub const SDL_GameControllerType = c_uint;
pub const SDL_CONTROLLER_TYPE_UNKNOWN: SDL_GameControllerType = 0;
pub const SDL_CONTROLLER_TYPE_XBOX360: SDL_GameControllerType = 1;
pub const SDL_CONTROLLER_TYPE_XBOXONE: SDL_GameControllerType = 2;
pub const SDL_CONTROLLER_TYPE_PS3: SDL_GameControllerType = 3;
pub const SDL_CONTROLLER_TYPE_PS4: SDL_GameControllerType = 4;
pub const SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_PRO: SDL_GameControllerType = 5;
pub const SDL_CONTROLLER_TYPE_VIRTUAL: SDL_GameControllerType = 6;
pub const SDL_CONTROLLER_TYPE_PS5: SDL_GameControllerType = 7;
pub const SDL_CONTROLLER_TYPE_AMAZON_LUNA: SDL_GameControllerType = 8;
pub const SDL_CONTROLLER_TYPE_GOOGLE_STADIA: SDL_GameControllerType = 9;
pub const SDL_CONTROLLER_TYPE_NVIDIA_SHIELD: SDL_GameControllerType = 10;
pub const SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_LEFT: SDL_GameControllerType = 11;
pub const SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT: SDL_GameControllerType = 12;
pub const SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_PAIR: SDL_GameControllerType = 13;
pub const SDL_CONTROLLER_TYPE_MAX: SDL_GameControllerType = 14;

pub const SDL_GameControllerBindType = c_uint;
pub const SDL_CONTROLLER_BINDTYPE_NONE: SDL_GameControllerBindType = 0;
pub const SDL_CONTROLLER_BINDTYPE_BUTTON: SDL_GameControllerBindType = 1;
pub const SDL_CONTROLLER_BINDTYPE_AXIS: SDL_GameControllerBindType = 2;
pub const SDL_CONTROLLER_BINDTYPE_HAT: SDL_GameControllerBindType = 3;

pub const SDL_GameControllerAxis = c_int;
pub const SDL_CONTROLLER_AXIS_INVALID: SDL_GameControllerAxis = -1;
pub const SDL_CONTROLLER_AXIS_LEFTX: SDL_GameControllerAxis = 0;
pub const SDL_CONTROLLER_AXIS_LEFTY: SDL_GameControllerAxis = 1;
pub const SDL_CONTROLLER_AXIS_RIGHTX: SDL_GameControllerAxis = 2;
pub const SDL_CONTROLLER_AXIS_RIGHTY: SDL_GameControllerAxis = 3;
pub const SDL_CONTROLLER_AXIS_TRIGGERLEFT: SDL_GameControllerAxis = 4;
pub const SDL_CONTROLLER_AXIS_TRIGGERRIGHT: SDL_GameControllerAxis = 5;
pub const SDL_CONTROLLER_AXIS_MAX: SDL_GameControllerAxis = 6;

pub const SDL_GameControllerButton = c_int;
pub const SDL_CONTROLLER_BUTTON_INVALID: SDL_GameControllerButton = -1;
pub const SDL_CONTROLLER_BUTTON_A: SDL_GameControllerButton = 0;
pub const SDL_CONTROLLER_BUTTON_B: SDL_GameControllerButton = 1;
pub const SDL_CONTROLLER_BUTTON_X: SDL_GameControllerButton = 2;
pub const SDL_CONTROLLER_BUTTON_Y: SDL_GameControllerButton = 3;
pub const SDL_CONTROLLER_BUTTON_BACK: SDL_GameControllerButton = 4;
pub const SDL_CONTROLLER_BUTTON_GUIDE: SDL_GameControllerButton = 5;
pub const SDL_CONTROLLER_BUTTON_START: SDL_GameControllerButton = 6;
pub const SDL_CONTROLLER_BUTTON_LEFTSTICK: SDL_GameControllerButton = 7;
pub const SDL_CONTROLLER_BUTTON_RIGHTSTICK: SDL_GameControllerButton = 8;
pub const SDL_CONTROLLER_BUTTON_LEFTSHOULDER: SDL_GameControllerButton = 9;
pub const SDL_CONTROLLER_BUTTON_RIGHTSHOULDER: SDL_GameControllerButton = 10;
pub const SDL_CONTROLLER_BUTTON_DPAD_UP: SDL_GameControllerButton = 11;
pub const SDL_CONTROLLER_BUTTON_DPAD_DOWN: SDL_GameControllerButton = 12;
pub const SDL_CONTROLLER_BUTTON_DPAD_LEFT: SDL_GameControllerButton = 13;
pub const SDL_CONTROLLER_BUTTON_DPAD_RIGHT: SDL_GameControllerButton = 14;
pub const SDL_CONTROLLER_BUTTON_MISC1: SDL_GameControllerButton = 15;
pub const SDL_CONTROLLER_BUTTON_PADDLE1: SDL_GameControllerButton = 16;
pub const SDL_CONTROLLER_BUTTON_PADDLE2: SDL_GameControllerButton = 17;
pub const SDL_CONTROLLER_BUTTON_PADDLE3: SDL_GameControllerButton = 18;
pub const SDL_CONTROLLER_BUTTON_PADDLE4: SDL_GameControllerButton = 19;
pub const SDL_CONTROLLER_BUTTON_TOUCHPAD: SDL_GameControllerButton = 20;
pub const SDL_CONTROLLER_BUTTON_MAX: SDL_GameControllerButton = 21;

pub inline fn SDL_GameControllerAddMappingsFromFile(file: [*]const u8) c_int {
    return SDL_GameControllerAddMappingsFromRW(common.SDL_RWFromFile(file, "rb"), common.SDL_TRUE);
}

pub extern fn SDL_GameControllerAddMappingsFromRW(rw: *SDL_RWops, freerw: c_int) c_int;
pub extern fn SDL_GameControllerAddMapping(mappingString: [*]const u8) c_int;
pub extern fn SDL_GameControllerNumMappings() c_int;
pub extern fn SDL_GameControllerMappingForIndex(mapping_index: c_int) ?[*]u8;
pub extern fn SDL_GameControllerMappingForGUID(guid: SDL_JoystickGUID) ?[*]u8;
pub extern fn SDL_GameControllerMapping(gamecontroller: *SDL_GameController) ?[*]u8;
pub extern fn SDL_IsGameController(joystick_index: c_int) SDL_bool;
pub extern fn SDL_GameControllerNameForIndex(joystick_index: c_int) ?[*]const u8;
pub extern fn SDL_GameControllerPathForIndex(joystick_index: c_int) ?[*]const u8;
pub extern fn SDL_GameControllerTypeForIndex(joystick_index: c_int) SDL_GameControllerType;
pub extern fn SDL_GameControllerMappingForDeviceIndex(joystick_index: c_int) ?[*]u8;
pub extern fn SDL_GameControllerOpen(joystick_index: c_int) ?*SDL_GameController;
pub extern fn SDL_GameControllerFromInstanceID(joyid: SDL_JoystickID) ?*SDL_GameController;
pub extern fn SDL_GameControllerFromPlayerIndex(player_index: c_int) ?*SDL_GameController;
pub extern fn SDL_GameControllerName(gamecontroller: *SDL_GameController) ?[*]const u8;
pub extern fn SDL_GameControllerPath(gamecontroller: *SDL_GameController) ?[*]const u8;
pub extern fn SDL_GameControllerGetType(gamecontroller: *SDL_GameController) SDL_GameControllerType;
pub extern fn SDL_GameControllerGetPlayerIndex(gamecontroller: *SDL_GameController) c_int;
pub extern fn SDL_GameControllerSetPlayerIndex(gamecontroller: *SDL_GameController, player_index: c_int) void;
pub extern fn SDL_GameControllerGetVendor(gamecontroller: *SDL_GameController) Uint16;
pub extern fn SDL_GameControllerGetProduct(gamecontroller: *SDL_GameController) Uint16;
pub extern fn SDL_GameControllerGetProductVersion(gamecontroller: *SDL_GameController) Uint16;
pub extern fn SDL_GameControllerGetFirmwareVersion(gamecontroller: *SDL_GameController) Uint16;
pub extern fn SDL_GameControllerGetSerial(gamecontroller: *SDL_GameController) ?[*]const u8;
pub extern fn SDL_GameControllerGetSteamHandle(gamecontroller: *SDL_GameController) Uint64;
pub extern fn SDL_GameControllerGetAttached(gamecontroller: *SDL_GameController) SDL_bool;
pub extern fn SDL_GameControllerGetJoystick(gamecontroller: *SDL_GameController) ?*SDL_Joystick;
pub extern fn SDL_GameControllerEventState(state: c_int) c_int;
pub extern fn SDL_GameControllerUpdate() void;
pub extern fn SDL_GameControllerGetAxisFromString(str: [*]const u8) SDL_GameControllerAxis;
pub extern fn SDL_GameControllerGetStringForAxis(axis: SDL_GameControllerAxis) ?[*]const u8;
pub extern fn SDL_GameControllerGetBindForAxis(gamecontroller: *SDL_GameController, axis: SDL_GameControllerAxis) SDL_GameControllerButtonBind;
pub extern fn SDL_GameControllerHasAxis(gamecontroller: *SDL_GameController, axis: SDL_GameControllerAxis) SDL_bool;
pub extern fn SDL_GameControllerGetAxis(gamecontroller: *SDL_GameController, axis: SDL_GameControllerAxis) Sint16;
pub extern fn SDL_GameControllerGetButtonFromString(str: [*]const u8) SDL_GameControllerButton;
pub extern fn SDL_GameControllerGetStringForButton(button: SDL_GameControllerButton) ?[*]const u8;
pub extern fn SDL_GameControllerGetBindForButton(gamecontroller: *SDL_GameController, button: SDL_GameControllerButton) SDL_GameControllerButtonBind;
pub extern fn SDL_GameControllerHasButton(gamecontroller: *SDL_GameController, button: SDL_GameControllerButton) SDL_bool;
pub extern fn SDL_GameControllerGetButton(gamecontroller: *SDL_GameController, button: SDL_GameControllerButton) Uint8;
pub extern fn SDL_GameControllerGetNumTouchpads(gamecontroller: *SDL_GameController) c_int;
pub extern fn SDL_GameControllerGetNumTouchpadFingers(gamecontroller: *SDL_GameController, touchpad: c_int) c_int;
pub extern fn SDL_GameControllerGetTouchpadFinger(gamecontroller: *SDL_GameController, touchpad: c_int, finger: c_int, state: ?*Uint8, x: ?*f32, y: ?*f32, pressure: ?*f32) c_int;
pub extern fn SDL_GameControllerHasSensor(gamecontroller: *SDL_GameController, @"type": SDL_SensorType) SDL_bool;
pub extern fn SDL_GameControllerSetSensorEnabled(gamecontroller: *SDL_GameController, @"type": SDL_SensorType, enabled: SDL_bool) c_int;
pub extern fn SDL_GameControllerIsSensorEnabled(gamecontroller: *SDL_GameController, @"type": SDL_SensorType) SDL_bool;
pub extern fn SDL_GameControllerGetSensorDataRate(gamecontroller: *SDL_GameController, @"type": SDL_SensorType) f32;
pub extern fn SDL_GameControllerGetSensorData(gamecontroller: *SDL_GameController, @"type": SDL_SensorType, data: ?[*]f32, num_values: c_int) c_int;
pub extern fn SDL_GameControllerGetSensorDataWithTimestamp(gamecontroller: *SDL_GameController, @"type": SDL_SensorType, timestamp: ?[*]Uint64, data: ?[*]f32, num_values: c_int) c_int;
pub extern fn SDL_GameControllerRumble(gamecontroller: *SDL_GameController, low_frequency_rumble: Uint16, high_frequency_rumble: Uint16, duration_ms: Uint32) c_int;
pub extern fn SDL_GameControllerRumbleTriggers(gamecontroller: *SDL_GameController, left_rumble: Uint16, right_rumble: Uint16, duration_ms: Uint32) c_int;
pub extern fn SDL_GameControllerHasLED(gamecontroller: *SDL_GameController) SDL_bool;
pub extern fn SDL_GameControllerHasRumble(gamecontroller: *SDL_GameController) SDL_bool;
pub extern fn SDL_GameControllerHasRumbleTriggers(gamecontroller: *SDL_GameController) SDL_bool;
pub extern fn SDL_GameControllerSetLED(gamecontroller: *SDL_GameController, red: Uint8, green: Uint8, blue: Uint8) c_int;
pub extern fn SDL_GameControllerSendEffect(gamecontroller: *SDL_GameController, data: ?*const anyopaque, size: c_int) c_int;
pub extern fn SDL_GameControllerClose(gamecontroller: *SDL_GameController) void;
pub extern fn SDL_GameControllerGetAppleSFSymbolsNameForButton(gamecontroller: *SDL_GameController, button: SDL_GameControllerButton) ?[*]const u8;
pub extern fn SDL_GameControllerGetAppleSFSymbolsNameForAxis(gamecontroller: *SDL_GameController, axis: SDL_GameControllerAxis) ?[*]const u8;
