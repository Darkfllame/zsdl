const common = @import("common.zig");

const SDL_bool = common.SDL_bool;
const Sint8 = common.Sint8;
const Uint8 = common.Uint8;
const Sint16 = common.Sint16;
const Uint16 = common.Uint16;
const Sint32 = common.Sint32;
const Uint32 = common.Uint32;
const Sint64 = common.Sint64;
const Uint64 = common.Uint64;
const SDL_Keysym = common.SDL_Keysym;
const SDL_JoystickID = common.SDL_JoystickID;
const SDL_JoystickPowerLevel = common.SDL_JoystickPowerLevel;
const SDL_TouchID = common.SDL_TouchID;
const SDL_FingerID = common.SDL_FingerID;
const SDL_GestureID = common.SDL_GestureID;

pub const SDL_RELEASED = 0;
pub const SDL_PRESSED = 0;

pub const SDL_EventType = Uint32;
//#region SDL_EventType constants
pub const SDL_FIRSTEVENT: SDL_EventType = 0;
pub const SDL_QUIT: SDL_EventType = 0x100;
pub const SDL_APP_TERMINATING: SDL_EventType = 0x101;
pub const SDL_APP_LOWMEMORY: SDL_EventType = 0x102;
pub const SDL_APP_WILLENTERBACKGROUND: SDL_EventType = 0x103;
pub const SDL_APP_DIDENTERBACKGROUND: SDL_EventType = 0x104;
pub const SDL_APP_WILLENTERFOREGROUND: SDL_EventType = 0x105;
pub const SDL_APP_DIDENTERFOREGROUND: SDL_EventType = 0x106;
pub const SDL_LOCALECHANGED: SDL_EventType = 0x107;
pub const SDL_DISPLAYEVENT: SDL_EventType = 0x150;
pub const SDL_WINDOWEVENT: SDL_EventType = 0x200;
pub const SDL_SYSWMEVENT: SDL_EventType = 0x201;
pub const SDL_KEYDOWN: SDL_EventType = 0x300;
pub const SDL_KEYUP: SDL_EventType = 0x301;
pub const SDL_TEXTEDITING: SDL_EventType = 0x302;
pub const SDL_TEXTINPUT: SDL_EventType = 0x303;
pub const SDL_KEYMAPCHANGED: SDL_EventType = 0x304;
pub const SDL_TEXTEDITING_EXT: SDL_EventType = 0x305;
pub const SDL_MOUSEMOTION: SDL_EventType = 0x400;
pub const SDL_MOUSEBUTTONDOWN: SDL_EventType = 0x401;
pub const SDL_MOUSEBUTTONUP: SDL_EventType = 0x402;
pub const SDL_MOUSEWHEEL: SDL_EventType = 0x403;
pub const SDL_JOYAXISMOTION: SDL_EventType = 0x600;
pub const SDL_JOYBALLMOTION: SDL_EventType = 0x601;
pub const SDL_JOYHATMOTION: SDL_EventType = 0x602;
pub const SDL_JOYBUTTONDOWN: SDL_EventType = 0x603;
pub const SDL_JOYBUTTONUP: SDL_EventType = 0x604;
pub const SDL_JOYDEVICEADDED: SDL_EventType = 0x605;
pub const SDL_JOYDEVICEREMOVED: SDL_EventType = 0x606;
pub const SDL_JOYBATTERYUPDATED: SDL_EventType = 0x607;
pub const SDL_CONTROLLERAXISMOTION: SDL_EventType = 0x650;
pub const SDL_CONTROLLERBUTTONDOWN: SDL_EventType = 0x651;
pub const SDL_CONTROLLERBUTTONUP: SDL_EventType = 0x652;
pub const SDL_CONTROLLERDEVICEADDED: SDL_EventType = 0x653;
pub const SDL_CONTROLLERDEVICEREMOVED: SDL_EventType = 0x654;
pub const SDL_CONTROLLERDEVICEREMAPPED: SDL_EventType = 0x655;
pub const SDL_CONTROLLERTOUCHPADDOWN: SDL_EventType = 0x656;
pub const SDL_CONTROLLERTOUCHPADMOTION: SDL_EventType = 0x657;
pub const SDL_CONTROLLERTOUCHPADUP: SDL_EventType = 0x658;
pub const SDL_CONTROLLERSENSORUPDATE: SDL_EventType = 0x659;
pub const SDL_CONTROLLERUPDATECOMPLETE_RESERVED_FOR_SDL3: SDL_EventType = 0x65A;
pub const SDL_CONTROLLERSTEAMHANDLEUPDATED: SDL_EventType = 0x65B;
pub const SDL_FINGERDOWN: SDL_EventType = 0x700;
pub const SDL_FINGERUP: SDL_EventType = 0x701;
pub const SDL_FINGERMOTION: SDL_EventType = 0x702;
pub const SDL_DOLLARGESTURE: SDL_EventType = 0x800;
pub const SDL_DOLLARRECORD: SDL_EventType = 0x801;
pub const SDL_MULTIGESTURE: SDL_EventType = 0x802;
pub const SDL_CLIPBOARDUPDATE: SDL_EventType = 0x900;
pub const SDL_DROPFILE: SDL_EventType = 0x1000;
pub const SDL_DROPTEXT: SDL_EventType = 0x1001;
pub const SDL_DROPBEGIN: SDL_EventType = 0x1001;
pub const SDL_DROPCOMPLETE: SDL_EventType = 0x1003;
pub const SDL_AUDIODEVICEADDED: SDL_EventType = 0x1100;
pub const SDL_AUDIODEVICEREMOVED: SDL_EventType = 0x1101;
pub const SDL_SENSORUPDATE: SDL_EventType = 0x1200;
pub const SDL_RENDER_TARGETS_RESET: SDL_EventType = 0x2000;
pub const SDL_RENDER_DEVICE_RESET: SDL_EventType = 0x2001;
pub const SDL_POLLSENTINEL: SDL_EventType = 0x7F00;
pub const SDL_USEREVENT: SDL_EventType = 0x8000;
pub const SDL_LASTEVENT: SDL_EventType = 0xFFFF;
//#endregion

//#region SDL_Event Sub-types
pub const SDL_CommonEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
};
pub const SDL_DisplayEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    display: Uint32,
    event: Uint8,
    padding1: Uint8,
    padding2: Uint8,
    padding3: Uint8,
    data1: Sint32,
};
pub const SDL_WindowEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    windowID: Uint32,
    event: Uint8,
    padding1: Uint8,
    padding2: Uint8,
    padding3: Uint8,
    data1: Sint32,
    data2: Sint32,
};
pub const SDL_KeyboardEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    windowID: Uint32,
    state: Uint8,
    repeat: Uint8,
    padding2: Uint8,
    padding3: Uint8,
    keysym: SDL_Keysym,
};
pub const SDL_TEXTEDITINGEVENT_TEXT_SIZE = 32;
pub const SDL_TextEditingEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    windowID: Uint32,
    text: [SDL_TEXTEDITINGEVENT_TEXT_SIZE]u8,
    start: Sint32,
    length: Sint32,
};
pub const SDL_TextEditingExtEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    windowID: Uint32,
    text: [*c]u8,
    start: Sint32,
    length: Sint32,
};
pub const SDL_TEXTINPUTEVENT_TEXT_SIZE = 32;
pub const SDL_TextInputEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    windowID: Uint32,
    text: [SDL_TEXTINPUTEVENT_TEXT_SIZE]u8,
};
pub const SDL_MouseMotionEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    windowID: Uint32,
    which: Uint32,
    state: Uint32,
    x: Sint32,
    y: Sint32,
    xrel: Sint32,
    yrel: Sint32,
};
pub const SDL_MouseButtonEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    windowID: Uint32,
    which: Uint32,
    button: Uint8,
    state: Uint8,
    clicks: Uint8,
    padding1: Uint8,
    x: Sint32,
    y: Sint32,
};
pub const SDL_MouseWheelEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    windowID: Uint32,
    which: Uint32,
    x: Sint32,
    y: Sint32,
    direction: Uint32,
    preciseX: f32,
    preciseY: f32,
    mouseX: Sint32,
    mouseY: Sint32,
};
pub const SDL_JoyAxisEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    which: SDL_JoystickID,
    axis: Uint8,
    padding1: Uint8,
    padding2: Uint8,
    padding3: Uint8,
    value: Sint32,
    padding4: Uint16,
};
pub const SDL_JoyBallEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    which: SDL_JoystickID,
    ball: Uint8,
    padding1: Uint8,
    padding2: Uint8,
    padding3: Uint8,
    xrel: Sint16,
    yrel: Sint16,
};
pub const SDL_JoyHatEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    which: SDL_JoystickID,
    hat: Uint8,
    value: Uint8,
    padding1: Uint8,
    padding2: Uint8,
};
pub const SDL_JoyButtonEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    which: SDL_JoystickID,
    button: Uint8,
    state: Uint8,
    padding1: Uint8,
    padding2: Uint8,
};
pub const SDL_JoyDeviceEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    which: Sint32,
};
pub const SDL_JoyBatteryEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    which: SDL_JoystickID,
    level: SDL_JoystickPowerLevel,
};
pub const SDL_ControllerAxisEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    which: SDL_JoystickID,
    axis: Uint8,
    padding1: Uint8,
    padding2: Uint8,
    padding3: Uint8,
    value: Sint32,
    padding4: Uint16,
};
pub const SDL_ControllerButtonEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    which: SDL_JoystickID,
    button: Uint8,
    state: Uint8,
    padding1: Uint8,
    padding2: Uint8,
};
pub const SDL_ControllerDeviceEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    which: Sint32,
};
pub const SDL_ControllerTouchpadEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    which: SDL_JoystickID,
    touchpad: Sint32,
    finger: Sint32,
    x: f32,
    y: f32,
    pressure: f32,
};
pub const SDL_ControllerSensorEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    which: SDL_JoystickID,
    sensor: Sint32,
    data: [3]f32,
    timestamp_us: Uint64,
};
pub const SDL_AudioDeviceEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    which: Uint32,
    iscapture: Uint8,
    padding1: Uint8,
    padding2: Uint8,
    padding3: Uint8,
};
pub const SDL_TouchFingerEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    touchId: SDL_TouchID,
    fingerId: SDL_FingerID,
    x: f32,
    y: f32,
    dx: f32,
    dy: f32,
    pressure: f32,
    windowID: Uint32,
};
pub const SDL_MultiGestureEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    touchId: SDL_TouchID,
    dTheta: f32,
    dDist: f32,
    x: f32,
    y: f32,
    numFingers: Uint16,
    padding: Uint16,
};
pub const SDL_DollarGestureEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    toucheId: SDL_TouchID,
    gestureId: SDL_GestureID,
    numFingers: Uint32,
    @"error": f32,
    x: f32,
    y: f32,
};
pub const SDL_DropEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    file: [*c]u8,
    windowID: Uint32,
};
pub const SDL_SensorEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    which: Sint32,
    data: [6]f32,
    timestamp_us: Uint64,
};
pub const SDL_QuitEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
};
pub const SDL_UserEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    windowID: Uint32,
    code: Sint32,
    data1: ?*anyopaque,
    data2: ?*anyopaque,
};
pub const SDL_SysWMmsg = opaque {};
pub const SDL_SysWMEvent = extern struct {
    type: SDL_EventType,
    timestamp: Uint32,
    msg: ?*SDL_SysWMmsg,
};
//#endregion
pub const SDL_Event = extern union {
    type: SDL_EventType,
    common: SDL_CommonEvent,
    display: SDL_DisplayEvent,
    window: SDL_WindowEvent,
    key: SDL_KeyboardEvent,
    edit: SDL_TextEditingEvent,
    editExt: SDL_TextEditingExtEvent,
    text: SDL_TextInputEvent,
    motion: SDL_MouseMotionEvent,
    button: SDL_MouseButtonEvent,
    wheel: SDL_MouseWheelEvent,
    jaxis: SDL_JoyAxisEvent,
    jball: SDL_JoyBallEvent,
    jhat: SDL_JoyHatEvent,
    jbutton: SDL_JoyButtonEvent,
    jdevice: SDL_JoyDeviceEvent,
    jbattery: SDL_JoyBatteryEvent,
    caxis: SDL_ControllerAxisEvent,
    cbutton: SDL_ControllerButtonEvent,
    cdevice: SDL_ControllerDeviceEvent,
    ctouchpad: SDL_ControllerTouchpadEvent,
    csensor: SDL_ControllerSensorEvent,
    adevice: SDL_AudioDeviceEvent,
    sensor: SDL_SensorEvent,
    quit: SDL_QuitEvent,
    user: SDL_UserEvent,
    syswm: SDL_SysWMEvent,
    tfinger: SDL_TouchFingerEvent,
    mgesture: SDL_MultiGestureEvent,
    dgesture: SDL_DollarGestureEvent,
    drop: SDL_DropEvent,

    padding: [
        switch (@sizeOf(?*anyopaque)) {
            0...8 => 56,
            16 => 64,
            else => 3 * @sizeOf(?*anyopaque),
        }
    ]Uint8,

    comptime {
        if (@sizeOf(SDL_Event) != @sizeOf(@TypeOf(@as(?*SDL_Event, null).padding)))
            @compileError("Binary compatibility broken");
    }
};

pub const SDL_eventaction = c_uint;
pub const SDL_ADDEVENT: SDL_eventaction = 0;
pub const SDL_PEEKEVENT: SDL_eventaction = 1;
pub const SDL_GETEVENT: SDL_eventaction = 2;

pub const SDL_QUERY: Uint32 = -1;
pub const SDL_IGNORE: Uint32 = 0;
pub const SDL_DISABLE: Uint32 = 0;
pub const SDL_ENABLE: Uint32 = 1;

pub const SDL_EventFilter = *const fn (userdata: ?*anyopaque, event: *SDL_Event) c_int;

pub inline fn SDL_GetEventState(@"type": SDL_EventType) Uint8 {
    return SDL_EventState(@"type", SDL_QUERY);
}

pub extern fn SDL_PumpEvents() void;
pub extern fn SDL_PeepEvents(
    events: ?[*]SDL_Event,
    numevents: c_int,
    action: SDL_eventaction,
    mintype: SDL_EventType,
    maxtype: SDL_EventType,
) c_int;
pub extern fn SDL_HasEvent(@"type": SDL_EventType) SDL_bool;
pub extern fn SDL_HasEvents(mintype: SDL_EventType, maxtype: SDL_EventType) SDL_bool;
pub extern fn SDL_FlushEvent(@"type": SDL_EventType) void;
pub extern fn SDL_FlushEventS(mintype: SDL_EventType, maxtype: SDL_EventType) void;
pub extern fn SDL_PollEvent(event: ?*SDL_Event) c_int;
pub extern fn SDL_WaitEvent(event: ?*SDL_Event) c_int;
pub extern fn SDL_WaitEventTimeout(event: ?*SDL_Event, timeout: c_int) c_int;
pub extern fn SDL_PushEvent(event: *SDL_Event) c_int;
pub extern fn SDL_SetEventFilter(filter: ?SDL_EventFilter, userdata: ?*anyopaque) void;
pub extern fn SDL_AddEventWatch(filter: ?SDL_EventFilter, userdata: ?*anyopaque) SDL_bool;
pub extern fn SDL_DelEventWatch(filter: SDL_EventFilter, userdata: ?*anyopaque) void;
pub extern fn SDL_FilterEvents(filter: ?SDL_EventFilter, userdata: ?*anyopaque) void;
pub extern fn SDL_EventState(@"type": SDL_EventType, state: c_int) Uint8;
pub extern fn SDL_RegisterEvents(numevents: c_int) Uint32;
