pub const SDL_errorcode = enum(c_uint) {
    SDL_ENOMEM,
    SDL_EFREAD,
    SDL_EFWRITE,
    SDL_EFSEEK,
    SDL_UNSUPPORTED,
    SDL_LASTERROR,
};
pub usingnamespace SDL_errorcode;

pub inline fn SDL_OutOfMemory() c_int {
    return SDL_Error(.SDL_ENOMEM);
}
pub inline fn SDL_Unsupported() c_int {
    return SDL_Error(.SDL_UNSUPPORTED);
}
pub inline fn SDL_InvalidParamError(param: [*c]const u8) c_int {
    return SDL_SetError("Parameter %s is invalid", param);
}

pub extern fn SDL_SetError(fmt: [*c]const u8, ...) c_int;
pub extern fn SDL_GetError() [*c]const u8;
pub extern fn SDL_GetErrorMsg(errStr: [*c]u8, maxLen: c_int) [*c]u8;
pub extern fn SDL_ClearError() void;
pub extern fn SDL_Error(code: SDL_errorcode) c_int;
