const sdl = @import("sdl");

const Uint32 = sdl.Uint32;
const Sint64 = sdl.Sint64;

pub const SDL_TouchID = Sint64;
pub const SDL_FingerID = Sint64;

pub const SDL_TouchDeviceType = c_int;
pub const SDL_TOUCH_DEVICE_INVALID: SDL_TouchDeviceType = -1;
pub const SDL_TOUCH_DEVICE_DIRECT: SDL_TouchDeviceType = 0;
pub const SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE: SDL_TouchDeviceType = 1;
pub const SDL_TOUCH_DEVICE_INDIRECT_RELATIVE: SDL_TouchDeviceType = 2;

pub const SDL_TOUCH_MOUSEID: Uint32 = @truncate(-1);
pub const SDL_MOUSE_TOUCHID: Uint32 = @truncate(-1);

pub const SDL_Finger = extern struct {
    id: SDL_FingerID,
    x: f32,
    y: f32,
    pressure: f32,
};

pub extern fn SDL_GetNumTouchDevices() c_int;
pub extern fn SDL_GetTouchDevice(index: c_int) SDL_TouchID;
pub extern fn SDL_GetTouchName(index: c_int) [*c]const u8;
pub extern fn SDL_GetTouchDeviceType(touchID: SDL_TouchID) SDL_TouchDeviceType;
pub extern fn SDL_GetNumTouchFingers(touchID: SDL_TouchID) c_int;
pub extern fn SDL_GetTouchFinger(touchID: SDL_TouchID, index: c_int) ?*SDL_Finger;
