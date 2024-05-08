const common = @import("common.zig");

const Sint32 = common.Sint32;
const Uint64 = common.Uint64;

pub const SDL_Sensor = opaque {};
pub const SDL_SensorID = Sint32;

pub const SDL_STANDARD_GRAVITY: f32 = 9.80665;

pub const SDL_SensorType = c_int;
pub const SDL_SENSOR_INVALID: SDL_SensorType = -1;
pub const SDL_SENSOR_UNKNOWN: SDL_SensorType = 0;
pub const SDL_SENSOR_ACCEL: SDL_SensorType = 1;
pub const SDL_SENSOR_GYRO: SDL_SensorType = 2;
pub const SDL_SENSOR_ACCEL_L: SDL_SensorType = 3;
pub const SDL_SENSOR_GYRO_L: SDL_SensorType = 4;
pub const SDL_SENSOR_ACCEL_R: SDL_SensorType = 5;
pub const SDL_SENSOR_GYRO_R: SDL_SensorType = 6;

pub extern fn SDL_LockSensors() void;
pub extern fn SDL_UnlockSensors() void;
pub extern fn SDL_NumSensors() c_int;
pub extern fn SDL_SensorGetDeviceName(device_index: c_int) ?[*]const u8;
pub extern fn SDL_SensorGetDeviceType(device_index: c_int) SDL_SensorType;
pub extern fn SDL_SensorGetDeviceNonPortableType(device_index: c_int) c_int;
pub extern fn SDL_SensorGetDeviceInstanceID(device_index: c_int) SDL_SensorID;
pub extern fn SDL_SensorOpen(device_index: c_int) ?*SDL_Sensor;
pub extern fn SDL_SensorFromInstanceID(instance_id: SDL_SensorID) ?*SDL_Sensor;
pub extern fn SDL_SensorGetName(sensor: *SDL_Sensor) ?[*]const u8;
pub extern fn SDL_SensorGetType(sensor: *SDL_Sensor) SDL_SensorType;
pub extern fn SDL_SensorGetNonPortableType(sensor: *SDL_Sensor) c_int;
pub extern fn SDL_SensorGetInstanceID(sensor: *SDL_Sensor) SDL_SensorID;
pub extern fn SDL_SensorGetData(sensor: *SDL_Sensor, data: ?*f32, num_values: c_int) c_int;
pub extern fn SDL_SensorGetDataWithTimestamp(sensor: *SDL_Sensor, timestamp: ?*Uint64, data: ?*f32, num_values: c_int) c_int;
pub extern fn SDL_SensorClose(sensor: *SDL_Sensor) void;
pub extern fn SDL_SensorUpdate() void;
