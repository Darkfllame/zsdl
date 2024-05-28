pub const SDL_BlendMode = c_uint;
pub const SDL_BLENDMODE_NONE: SDL_BlendMode = 0x00000000;
pub const SDL_BLENDMODE_BLEND: SDL_BlendMode = 0x00000001;
pub const SDL_BLENDMODE_ADD: SDL_BlendMode = 0x00000002;
pub const SDL_BLENDMODE_MOD: SDL_BlendMode = 0x00000004;
pub const SDL_BLENDMODE_MUL: SDL_BlendMode = 0x00000008;
pub const SDL_BLENDMODE_INVALID: SDL_BlendMode = 0x7FFFFFFF;

pub const SDL_BlendOperation = c_uint;
pub const SDL_BLENDOPERATION_ADD: SDL_BlendOperation = 0x1;
pub const SDL_BLENDOPERATION_SUBSTRACT: SDL_BlendOperation = 0x2;
pub const SDL_BLENDOPERATION_REV_SUBSTRACT: SDL_BlendOperation = 0x3;
pub const SDL_BLENDOPERATION_MINIMUM: SDL_BlendOperation = 0x4;
pub const SDL_BLENDOPERATION_MAXIMUM: SDL_BlendOperation = 0x5;

pub const SDL_BlendFactor = c_uint;
pub const SDL_BLENDFACTOR_ZERO: SDL_BlendFactor = 0x1;
pub const SDL_BLENDFACTOR_ONE: SDL_BlendFactor = 0x2;
pub const SDL_BLENDFACTOR_SRC_COLOR: SDL_BlendFactor = 0x3;
pub const SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR: SDL_BlendFactor = 0x4;
pub const SDL_BLENDFACTOR_SRC_ALPHA: SDL_BlendFactor = 0x5;
pub const SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA: SDL_BlendFactor = 0x6;
pub const SDL_BLENDFACTOR_DST_COLOR: SDL_BlendFactor = 0x7;
pub const SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR: SDL_BlendFactor = 0x8;
pub const SDL_BLENDFACTOR_DST_ALPHA: SDL_BlendFactor = 0x9;
pub const SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA: SDL_BlendFactor = 0xA;

pub extern fn SDL_ComposeCustomBlendMode(
    srcColorFactor: SDL_BlendFactor,
    dstColorFactor: SDL_BlendFactor,
    colorOperation: SDL_BlendOperation,
    srcAlphaFactor: SDL_BlendFactor,
    dstAlphaFactor: SDL_BlendFactor,
    alphaOperation: SDL_BlendOperation,
) SDL_BlendMode;
