pub const SDL_errorcode = c_uint;
pub const SDL_ENOMEM: SDL_errorcode = 0;
pub const SDL_EFREAD: SDL_errorcode = 1;
pub const SDL_EFWRITE: SDL_errorcode = 2;
pub const SDL_EFSEEK: SDL_errorcode = 3;
pub const SDL_UNSUPPORTED: SDL_errorcode = 4;
pub const SDL_LASTERROR: SDL_errorcode = 5;

pub inline fn SDL_OutOfMemory() c_int {
    return SDL_Error(.SDL_ENOMEM);
}
pub inline fn SDL_Unsupported() c_int {
    return SDL_Error(.SDL_UNSUPPORTED);
}
pub inline fn SDL_InvalidParamError(param: [*:0]const u8) c_int {
    return SDL_SetError("Parameter %s is invalid", param);
}

pub extern fn SDL_SetError(fmt: [*:0]const u8, ...) c_int;
pub extern fn SDL_GetError() [*:0]const u8;
pub extern fn SDL_GetErrorMsg(errStr: [*:0]u8, maxLen: c_int) [*:0]u8;
pub extern fn SDL_ClearError() void;
pub extern fn SDL_Error(code: SDL_errorcode) c_int;
