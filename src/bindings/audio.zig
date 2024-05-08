const common = @import("common.zig");

const Uint8 = common.Uint8;
const Uint16 = common.Uint16;
const Uint32 = common.Uint32;
const SDL_RWops = common.SDL_RWops;
const SDL_RWFromFile = common.SDL_RWFromFile;

pub const SDL_AudioFormat = Uint16;
pub const SDL_AudioDeviceID = Uint32;

pub const SDL_AudioStatus = c_uint;
pub const SDL_AUDIO_STOPPED: SDL_AudioStatus = 0;
pub const SDL_AUDIO_PLAYING: SDL_AudioStatus = 1;
pub const SDL_AUDIO_PAUSED: SDL_AudioStatus = 2;

pub const SDL_AudioFilter = *const fn (cvt: *SDL_AudioCVT, format: SDL_AudioFormat) callconv(.C) void;
pub const SDL_AudioCallback = *const fn (userdata: ?*anyopaque, stream: [*]Uint8, len: c_int) callconv(.C) void;
pub const SDL_AudioSpec = extern struct {
    freq: c_int,
    format: SDL_AudioFormat,
    channels: Uint8,
    silence: Uint8,
    samples: Uint16,
    padding: Uint16,
    size: Uint32,
    callback: ?SDL_AudioCallback,
    userdata: ?*anyopaque,
};
pub const SDL_AudioCVT = extern struct {
    needed: c_int align(1),
    src_format: SDL_AudioFormat align(1),
    dst_format: SDL_AudioFormat align(1),
    rate_incr: f64 align(1),
    buf: [*]Uint8 align(1),
    len: c_int align(1),
    len_cvt: c_int align(1),
    len_mult: c_int align(1),
    len_ratio: f64 align(1),
    filters: [SDL_AUDIOCVT_MAX_FILTERS:null]?SDL_AudioFilter align(1),
    filter_index: c_int align(1),
};
pub const SDL_AudioStream = opaque {};

pub const SDL_AUDIOCVT_MAX_FILTERS = 9;
pub const SDL_AUDIO_MASK_BITSIZE: c_int = 0xFF;
pub const SDL_AUDIO_MASK_DATATYPE: c_int = 1 << 8;
pub const SDL_AUDIO_MASK_ENDIAN: c_int = 1 << 12;
pub const SDL_AUDIO_MASK_SIGNED: c_int = 1 << 15;
pub const AUDIO_U8: c_int = 0x0008;
pub const AUDIO_S8: c_int = 0x8008;
pub const AUDIO_U16LSB: c_int = 0x0010;
pub const AUDIO_S16LSB: c_int = 0x8010;
pub const AUDIO_U16MSB: c_int = 0x1010;
pub const AUDIO_S16MSB: c_int = 0x9010;
pub const AUDIO_S32LSB: c_int = 0x8020;
pub const AUDIO_S32MSB: c_int = 0x9020;
pub const AUDIO_F32LSB: c_int = 0x8120;
pub const AUDIO_F32MSB: c_int = 0x9120;
pub const AUDIO_U16: c_int = AUDIO_U16LSB;
pub const AUDIO_U16SYS: c_int = AUDIO_U16LSB;
pub const AUDIO_S16: c_int = AUDIO_S16LSB;
pub const AUDIO_S16SYS: c_int = AUDIO_S16LSB;
pub const AUDIO_S32: c_int = AUDIO_S32LSB;
pub const AUDIO_S32SYS: c_int = AUDIO_S32LSB;
pub const AUDIO_F32: c_int = AUDIO_F32LSB;
pub const AUDIO_F32SYS: c_int = AUDIO_F32LSB;
pub const SDL_AUDIO_ALLOW_FREQUENCY_CHANGE: c_int = 0x00000001;
pub const SDL_AUDIO_ALLOW_FORMAT_CHANGE: c_int = 0x00000002;
pub const SDL_AUDIO_ALLOW_CHANNELS_CHANGE: c_int = 0x00000004;
pub const SDL_AUDIO_ALLOW_SAMPLES_CHANGE: c_int = 0x00000008;
pub const SDL_AUDIO_ALLOW_ANY_CHANGE: c_int = SDL_AUDIO_ALLOW_FREQUENCY_CHANGE | SDL_AUDIO_ALLOW_FORMAT_CHANGE | SDL_AUDIO_ALLOW_CHANNELS_CHANGE | SDL_AUDIO_ALLOW_SAMPLES_CHANGE;
pub const SDL_MIX_MAXVOLUME: c_int = 128;

pub inline fn SDL_AUDIO_BITSIZE(x: c_int) c_int {
    return x & SDL_AUDIO_MASK_BITSIZE;
}
pub inline fn SDL_AUDIO_ISFLOAT(x: c_int) bool {
    return (x & SDL_AUDIO_MASK_DATATYPE) != 0;
}
pub inline fn SDL_AUDIO_ISBIGENDIAN(x: c_int) bool {
    return (x & SDL_AUDIO_MASK_ENDIAN) != 0;
}
pub inline fn SDL_AUDIO_ISSIGNED(x: c_int) bool {
    return (x & SDL_AUDIO_MASK_SIGNED) != 0;
}
pub inline fn SDL_AUDIO_ISINT(x: c_int) bool {
    return !(SDL_AUDIO_ISFLOAT(x) != 0);
}
pub inline fn SDL_AUDIO_ISLITTLEENDIAN(x: c_int) bool {
    return !(SDL_AUDIO_ISBIGENDIAN(x) != 0);
}
pub inline fn SDL_AUDIO_ISUNSIGNED(x: c_int) bool {
    return !(SDL_AUDIO_ISSIGNED(x) != 0);
}
pub inline fn SDL_LoadWAV(file: [*]const u8, spec: [*]SDL_AudioSpec, audio_buf: *[*]Uint8, audio_len: *Uint32) ?*SDL_AudioSpec {
    return SDL_LoadWAV_RW(SDL_RWFromFile(file, "rb").?, 1, spec, audio_buf, audio_len);
}

pub extern fn SDL_GetNumAudioDrivers() c_int;
pub extern fn SDL_GetAudioDriver(index: c_int) ?[*]const u8;
pub extern fn SDL_AudioInit(driver_name: [*]const u8) c_int;
pub extern fn SDL_AudioQuit() void;
pub extern fn SDL_GetCurrentAudioDriver() ?[*]const u8;
pub extern fn SDL_OpenAudio(desired: *SDL_AudioSpec, obtained: ?*SDL_AudioSpec) c_int;
pub extern fn SDL_GetNumAudioDevices(iscapture: c_int) c_int;
pub extern fn SDL_GetAudioDeviceName(index: c_int, iscapture: c_int) ?[*]const u8;
pub extern fn SDL_GetAudioDeviceSpec(index: c_int, iscapture: c_int, spec: ?*SDL_AudioSpec) c_int;
pub extern fn SDL_GetDefaultAudioInfo(name: ?*[*]u8, spec: ?*SDL_AudioSpec, iscapture: c_int) c_int;
pub extern fn SDL_OpenAudioDevice(device: ?[*]const u8, iscapture: c_int, desired: ?*const SDL_AudioSpec, obtained: ?*SDL_AudioSpec, allowed_changes: c_int) SDL_AudioDeviceID;
pub extern fn SDL_GetAudioStatus() SDL_AudioStatus;
pub extern fn SDL_GetAudioDeviceStatus(dev: SDL_AudioDeviceID) SDL_AudioStatus;
pub extern fn SDL_PauseAudio(pause_on: c_int) void;
pub extern fn SDL_PauseAudioDevice(dev: SDL_AudioDeviceID, pause_on: c_int) void;
pub extern fn SDL_LoadWAV_RW(src: *SDL_RWops, freesrc: c_int, spec: *SDL_AudioSpec, audio_buf: *[*]Uint8, audio_len: *Uint32) ?*SDL_AudioSpec;
pub extern fn SDL_FreeWAV(audio_buf: [*]Uint8) void;
pub extern fn SDL_BuildAudioCVT(cvt: *SDL_AudioCVT, src_format: SDL_AudioFormat, src_channels: Uint8, src_rate: c_int, dst_format: SDL_AudioFormat, dst_channels: Uint8, dst_rate: c_int) c_int;
pub extern fn SDL_ConvertAudio(cvt: *SDL_AudioCVT) c_int;
pub extern fn SDL_NewAudioStream(src_format: SDL_AudioFormat, src_channels: Uint8, src_rate: c_int, dst_format: SDL_AudioFormat, dst_channels: Uint8, dst_rate: c_int) ?*SDL_AudioStream;
pub extern fn SDL_AudioStreamPut(stream: *SDL_AudioStream, buf: [*]const anyopaque, len: c_int) c_int;
pub extern fn SDL_AudioStreamGet(stream: *SDL_AudioStream, buf: [*]anyopaque, len: c_int) c_int;
pub extern fn SDL_AudioStreamAvailable(stream: *SDL_AudioStream) c_int;
pub extern fn SDL_AudioStreamFlush(stream: *SDL_AudioStream) c_int;
pub extern fn SDL_AudioStreamClear(stream: *SDL_AudioStream) void;
pub extern fn SDL_FreeAudioStream(stream: *SDL_AudioStream) void;
pub extern fn SDL_MixAudio(dst: [*]Uint8, src: [*]const Uint8, len: Uint32, volume: c_int) void;
pub extern fn SDL_MixAudioFormat(dst: [*]Uint8, src: [*]const Uint8, format: SDL_AudioFormat, len: Uint32, volume: c_int) void;
pub extern fn SDL_QueueAudio(dev: SDL_AudioDeviceID, data: [*]const anyopaque, len: Uint32) c_int;
pub extern fn SDL_DequeueAudio(dev: SDL_AudioDeviceID, data: [*]anyopaque, len: Uint32) Uint32;
pub extern fn SDL_GetQueuedAudioSize(dev: SDL_AudioDeviceID) Uint32;
pub extern fn SDL_ClearQueuedAudio(dev: SDL_AudioDeviceID) void;
pub extern fn SDL_LockAudio() void;
pub extern fn SDL_LockAudioDevice(dev: SDL_AudioDeviceID) void;
pub extern fn SDL_UnlockAudio() void;
pub extern fn SDL_UnlockAudioDevice(dev: SDL_AudioDeviceID) void;
pub extern fn SDL_CloseAudio() void;
pub extern fn SDL_CloseAudioDevice(dev: SDL_AudioDeviceID) void;
