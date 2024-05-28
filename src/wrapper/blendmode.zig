const std = @import("std");
const root = @import("sdl.zig");
const sdl = @import("bindings");

pub const BlendMode = enum(c_uint) {
    None = sdl.SDL_BLENDMODE_NONE,
    Blend = sdl.SDL_BLENDMODE_BLEND,
    Add = sdl.SDL_BLENDMODE_ADD,
    Mod = sdl.SDL_BLENDMODE_MOD,
    Mul = sdl.SDL_BLENDMODE_MUL,
    Invalid = sdl.SDL_BLENDMODE_INVALID,
    _,
};

pub const BlendOperation = enum(c_uint) {
    Add = sdl.SDL_BLENDOPERATION_ADD,
    Substract = sdl.SDL_BLENDOPERATION_SUBSTRACT,
    RevSubstract = sdl.SDL_BLENDOPERATION_REV_SUBSTRACT,
    Minimum = sdl.SDL_BLENDOPERATION_MINIMUM,
    Maximum = sdl.SDL_BLENDOPERATION_MAXIMUM,
};

pub const BlendFactor = enum(c_uint) {
    ZERO = sdl.SDL_BLENDFACTOR_ZERO,
    ONE = sdl.SDL_BLENDFACTOR_ONE,
    SRC_COLOR = sdl.SDL_BLENDFACTOR_SRC_COLOR,
    ONE_MINUS_SRC_COLOR = sdl.SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR,
    SRC_ALPHA = sdl.SDL_BLENDFACTOR_SRC_ALPHA,
    ONE_MINUS_SRC_ALPHA = sdl.SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA,
    DST_COLOR = sdl.SDL_BLENDFACTOR_DST_COLOR,
    ONE_MINUS_DST_COLOR = sdl.SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR,
    DST_ALPHA = sdl.SDL_BLENDFACTOR_DST_ALPHA,
    ONE_MINUS_DST_ALPHA = sdl.SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA,
};

pub inline fn composeCustomBlendMode(
    srcColorFactor: BlendFactor,
    dstColorFactor: BlendFactor,
    colorOperation: BlendOperation,
    srcAlphaFactor: BlendFactor,
    dstAlphaFactor: BlendFactor,
    alphaOperation: BlendOperation,
) BlendMode {
    return @enumFromInt(sdl.SDL_ComposeCustomBlendMode(
        @intFromEnum(srcColorFactor),
        @intFromEnum(dstColorFactor),
        @intFromEnum(colorOperation),
        @intFromEnum(srcAlphaFactor),
        @intFromEnum(dstAlphaFactor),
        @intFromEnum(alphaOperation),
    ));
}
