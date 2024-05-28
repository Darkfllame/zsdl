const std = @import("std");
const root = @import("sdl.zig");
const sdl = @import("bindings");

pub const Sensor = opaque {};
pub const SensorID = i32;

pub const StandardGravity: f32 = 9.80665;

pub const SensorType = enum(c_int) {
    INVALID = sdl.SDL_SENSOR_INVALID,
    UNKNOWN = sdl.SDL_SENSOR_UNKNOWN,
    ACCEL = sdl.SDL_SENSOR_ACCEL,
    GYRO = sdl.SDL_SENSOR_GYRO,
    ACCEL_L = sdl.SDL_SENSOR_ACCEL_L,
    GYRO_L = sdl.SDL_SENSOR_GYRO_L,
    ACCEL_R = sdl.SDL_SENSOR_ACCEL_R,
    GYRO_R = sdl.SDL_SENSOR_GYRO_R,
};

pub inline fn lockSensors() void {
    sdl.SDL_LockSensors();
}
pub inline fn unlockSensors() void {
    sdl.SDL_UnlockSensors();
}
pub inline fn numSensors() u32 {
    return @intCast(sdl.SDL_NumSensors());
}
pub inline fn sensorGetDeviceName(device_index: u32) ?[:0]const u8 {
    return std.mem.span(sdl.SDL_SensorGetDeviceName(@intCast(device_index)) orelse return null);
}
pub inline fn sensorGetDeviceType(device_index: u32) SensorType {
    return @enumFromInt(sdl.SDL_SensorGetDeviceType(@intCast(device_index)));
}
pub inline fn sensorGetDeviceNonPortableType(device_index: u32) u32 {
    const v = sdl.SDL_SensorGetDeviceNonPortableType(@intCast(device_index));
    return if (v < 0)
        error.SdlError
    else
        @intCast(v);
}
pub inline fn sensorGetDeviceInstanceID(device_index: u32) SensorID {
    return sdl.SDL_SensorGetDeviceInstanceID(@intCast(device_index));
}
pub inline fn sensorOpen(device_index: u32) root.Error!*Sensor {
    return sdl.SDL_SensorOpen(@intCast(device_index)) orelse error.SdlError;
}
pub inline fn sensorFromInstanceID(instance_id: SensorID) root.Error!*Sensor {
    return sdl.SDL_SensorFromInstanceID(instance_id) orelse error.SdlError;
}
pub inline fn sensorGetName(sensor: *Sensor) ?[:0]const u8 {
    return std.mem.span(sdl.SDL_SensorGetName(@ptrCast(sensor)) orelse return null);
}
pub inline fn sensorGetType(sensor: *Sensor) SensorType {
    return @enumFromInt(sdl.SDL_SensorGetType(@ptrCast(sensor)));
}
pub inline fn sensorGetNonPortableType(sensor: *Sensor) u32 {
    return @intCast(sdl.SDL_SensorGetNonPortableType(@ptrCast(sensor)));
}
pub inline fn sensorGetInstanceID(sensor: *Sensor) SensorID {
    return sdl.SDL_SensorGetInstanceID(@ptrCast(sensor));
}
pub inline fn sensorGetData(sensor: *Sensor, data: []f32) u32 {
    return sdl.SDL_SensorGetData(@ptrCast(sensor), @ptrCast(data), @intCast(data.len));
}
pub inline fn sensorGetDataWithTimestamp(sensor: *Sensor, timestamp: *u64, data: []f32) u32 {
    return sdl.SDL_SensorGetDataWithTimestamp(@ptrCast(sensor), timestamp, @ptrCast(data), @intCast(data.len));
}
pub inline fn sensorClose(sensor: *Sensor) void {
    sdl.SDL_SensorClose(@ptrCast(sensor));
}
pub inline fn sensorUpdate() void {
    sdl.SDL_SensorUpdate();
}
