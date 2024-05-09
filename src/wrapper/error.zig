const std = @import("std");
const root = @import("sdl.zig");
const sdl = @import("bindings");

pub const ErrorCode = enum(c_uint) {
    NoMem = 0,
    FRead,
    FWrite,
    FSeek,
    Unsupported,
    LastError,
};

pub inline fn SDL_OutOfMemory() root.Error {
    return @"error"(.NoMem);
}
pub inline fn SDL_Unsupported() root.Error {
    return @"error"(.Unsupported);
}
pub inline fn SDL_InvalidParamError(param: []const u8) c_int {
    return setError("Parameter %.*s is invalid", .{ param.len, param });
}

/// Only supports C format strings, see https://cplusplus.com/reference/cstdio/printf/ for more infos
pub inline fn setError(fmt: [:0]const u8, args: anytype) root.Error {
    _ = @call(.auto, sdl.SDL_SetError, .{fmt} ++ args);
    return error.SdlError;
}
pub inline fn getError() []const u8 {
    return std.mem.span(sdl.SDL_GetError());
}
pub inline fn getErrorMsg(errStr: []u8) []u8 {
    return std.mem.span(sdl.SDL_GetErrorMsg(errStr.ptr, @intCast(errStr.len)));
}
pub inline fn clearError() void {
    sdl.SDL_ClearError();
}
pub inline fn @"error"(errcode: ErrorCode) root.Error {
    _ = sdl.SDL_Error(@intFromEnum(errcode));
    return error.SdlError;
}
