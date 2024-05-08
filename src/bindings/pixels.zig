const common = @import("common.zig");

const SDL_bool = common.SDL_bool;
const Uint8 = common.Uint8;
const Uint16 = common.Uint16;
const Uint32 = common.Uint32;
const SDL_FOURCC = common.SDL_FOURCC;

pub const SDL_PixelType = c_uint;
pub const SDL_PIXELTYPE_UNKNOWN: SDL_PixelType = 0;
pub const SDL_PIXELTYPE_INDEX1: SDL_PixelType = 1;
pub const SDL_PIXELTYPE_INDEX4: SDL_PixelType = 2;
pub const SDL_PIXELTYPE_INDEX8: SDL_PixelType = 3;
pub const SDL_PIXELTYPE_PACKED8: SDL_PixelType = 4;
pub const SDL_PIXELTYPE_PACKED16: SDL_PixelType = 5;
pub const SDL_PIXELTYPE_PACKED32: SDL_PixelType = 6;
pub const SDL_PIXELTYPE_ARRAYU8: SDL_PixelType = 7;
pub const SDL_PIXELTYPE_ARRAYU16: SDL_PixelType = 8;
pub const SDL_PIXELTYPE_ARRAYU32: SDL_PixelType = 9;
pub const SDL_PIXELTYPE_ARRAYF16: SDL_PixelType = 10;
pub const SDL_PIXELTYPE_ARRAYF32: SDL_PixelType = 11;
pub const SDL_PIXELTYPE_INDEX2: SDL_PixelType = 12;

pub const SDL_BitmapOrder = c_uint;
pub const SDL_BITMAPORDER_NONE: SDL_BitmapOrder = 0;
pub const SDL_BITMAPORDER_4321: SDL_BitmapOrder = 1;
pub const SDL_BITMAPORDER_1234: SDL_BitmapOrder = 2;

pub const SDL_PackedOrder = c_uint;
pub const SDL_PACKEDORDER_NONE: SDL_PackedOrder = 0;
pub const SDL_PACKEDORDER_XRGB: SDL_PackedOrder = 1;
pub const SDL_PACKEDORDER_RGBX: SDL_PackedOrder = 2;
pub const SDL_PACKEDORDER_ARGB: SDL_PackedOrder = 3;
pub const SDL_PACKEDORDER_RGBA: SDL_PackedOrder = 4;
pub const SDL_PACKEDORDER_XBGR: SDL_PackedOrder = 5;
pub const SDL_PACKEDORDER_BGRX: SDL_PackedOrder = 6;
pub const SDL_PACKEDORDER_ABGR: SDL_PackedOrder = 7;
pub const SDL_PACKEDORDER_BGRA: SDL_PackedOrder = 8;

pub const SDL_ArrayOrder = c_uint;
pub const SDL_ARRAYORDER_NONE: SDL_ArrayOrder = 0;
pub const SDL_ARRAYORDER_RGB: SDL_ArrayOrder = 1;
pub const SDL_ARRAYORDER_RGBA: SDL_ArrayOrder = 2;
pub const SDL_ARRAYORDER_ARGB: SDL_ArrayOrder = 3;
pub const SDL_ARRAYORDER_BGR: SDL_ArrayOrder = 4;
pub const SDL_ARRAYORDER_BGRA: SDL_ArrayOrder = 5;
pub const SDL_ARRAYORDER_ABGR: SDL_ArrayOrder = 6;

pub const SDL_PackedLayout = c_uint;
pub const SDL_PACKEDLAYOUT_NONE: SDL_PackedLayout = 0;
pub const SDL_PACKEDLAYOUT_332: SDL_PackedLayout = 1;
pub const SDL_PACKEDLAYOUT_4444: SDL_PackedLayout = 2;
pub const SDL_PACKEDLAYOUT_1555: SDL_PackedLayout = 3;
pub const SDL_PACKEDLAYOUT_5551: SDL_PackedLayout = 4;
pub const SDL_PACKEDLAYOUT_565: SDL_PackedLayout = 5;
pub const SDL_PACKEDLAYOUT_8888: SDL_PackedLayout = 6;
pub const SDL_PACKEDLAYOUT_2101010: SDL_PackedLayout = 7;
pub const SDL_PACKEDLAYOUT_1010102: SDL_PackedLayout = 8;

pub const SDL_PixelFormatEnum = c_uint;
pub const SDL_PIXELFORMAT_UNKNOWN: SDL_PixelFormat = 0;
pub const SDL_PIXELFORMAT_INDEX1LSB: SDL_PixelFormat = 286261504;
pub const SDL_PIXELFORMAT_INDEX1MSB: SDL_PixelFormat = 287310080;
pub const SDL_PIXELFORMAT_INDEX2LSB: SDL_PixelFormat = 470811136;
pub const SDL_PIXELFORMAT_INDEX2MSB: SDL_PixelFormat = 471859712;
pub const SDL_PIXELFORMAT_INDEX4LSB: SDL_PixelFormat = 303039488;
pub const SDL_PIXELFORMAT_INDEX4MSB: SDL_PixelFormat = 304088064;
pub const SDL_PIXELFORMAT_INDEX8: SDL_PixelFormat = 318769153;
pub const SDL_PIXELFORMAT_RGB332: SDL_PixelFormat = 336660481;
pub const SDL_PIXELFORMAT_XRGB4444: SDL_PixelFormat = 353504258;
pub const SDL_PIXELFORMAT_RGB444: SDL_PixelFormat = 353504258;
pub const SDL_PIXELFORMAT_XBGR4444: SDL_PixelFormat = 357698562;
pub const SDL_PIXELFORMAT_BGR444: SDL_PixelFormat = 357698562;
pub const SDL_PIXELFORMAT_XRGB1555: SDL_PixelFormat = 353570562;
pub const SDL_PIXELFORMAT_RGB555: SDL_PixelFormat = 353570562;
pub const SDL_PIXELFORMAT_XBGR1555: SDL_PixelFormat = 357764866;
pub const SDL_PIXELFORMAT_BGR555: SDL_PixelFormat = 357764866;
pub const SDL_PIXELFORMAT_ARGB4444: SDL_PixelFormat = 355602434;
pub const SDL_PIXELFORMAT_RGBA4444: SDL_PixelFormat = 356651010;
pub const SDL_PIXELFORMAT_ABGR4444: SDL_PixelFormat = 359796738;
pub const SDL_PIXELFORMAT_BGRA4444: SDL_PixelFormat = 360845314;
pub const SDL_PIXELFORMAT_ARGB1555: SDL_PixelFormat = 355667970;
pub const SDL_PIXELFORMAT_RGBA5551: SDL_PixelFormat = 356782082;
pub const SDL_PIXELFORMAT_ABGR1555: SDL_PixelFormat = 359862274;
pub const SDL_PIXELFORMAT_BGRA5551: SDL_PixelFormat = 360976386;
pub const SDL_PIXELFORMAT_RGB565: SDL_PixelFormat = 353701890;
pub const SDL_PIXELFORMAT_BGR565: SDL_PixelFormat = 357896194;
pub const SDL_PIXELFORMAT_RGB24: SDL_PixelFormat = 386930691;
pub const SDL_PIXELFORMAT_BGR24: SDL_PixelFormat = 390076419;
pub const SDL_PIXELFORMAT_XRGB8888: SDL_PixelFormat = 370546692;
pub const SDL_PIXELFORMAT_RGB888: SDL_PixelFormat = 370546692;
pub const SDL_PIXELFORMAT_RGBX8888: SDL_PixelFormat = 371595268;
pub const SDL_PIXELFORMAT_XBGR8888: SDL_PixelFormat = 374740996;
pub const SDL_PIXELFORMAT_BGR888: SDL_PixelFormat = 374740996;
pub const SDL_PIXELFORMAT_BGRX8888: SDL_PixelFormat = 375789572;
pub const SDL_PIXELFORMAT_ARGB8888: SDL_PixelFormat = 372645892;
pub const SDL_PIXELFORMAT_RGBA8888: SDL_PixelFormat = 373694468;
pub const SDL_PIXELFORMAT_ABGR8888: SDL_PixelFormat = 376840196;
pub const SDL_PIXELFORMAT_BGRA8888: SDL_PixelFormat = 377888772;
pub const SDL_PIXELFORMAT_ARGB2101010: SDL_PixelFormat = 372711428;
pub const SDL_PIXELFORMAT_RGBA32: SDL_PixelFormat = 376840196;
pub const SDL_PIXELFORMAT_ARGB32: SDL_PixelFormat = 377888772;
pub const SDL_PIXELFORMAT_BGRA32: SDL_PixelFormat = 372645892;
pub const SDL_PIXELFORMAT_ABGR32: SDL_PixelFormat = 373694468;
pub const SDL_PIXELFORMAT_RGBX32: SDL_PixelFormat = 374740996;
pub const SDL_PIXELFORMAT_XRGB32: SDL_PixelFormat = 375789572;
pub const SDL_PIXELFORMAT_BGRX32: SDL_PixelFormat = 370546692;
pub const SDL_PIXELFORMAT_XBGR32: SDL_PixelFormat = 371595268;
pub const SDL_PIXELFORMAT_YV12: SDL_PixelFormat = 842094169;
pub const SDL_PIXELFORMAT_IYUV: SDL_PixelFormat = 1448433993;
pub const SDL_PIXELFORMAT_YUY2: SDL_PixelFormat = 844715353;
pub const SDL_PIXELFORMAT_UYVY: SDL_PixelFormat = 1498831189;
pub const SDL_PIXELFORMAT_YVYU: SDL_PixelFormat = 1431918169;
pub const SDL_PIXELFORMAT_NV12: SDL_PixelFormat = 842094158;
pub const SDL_PIXELFORMAT_NV21: SDL_PixelFormat = 825382478;
pub const SDL_PIXELFORMAT_EXTERNAL_OES: SDL_PixelFormat = 542328143;

pub const SDL_Color = extern struct {
    r: Uint8,
    g: Uint8,
    b: Uint8,
    a: Uint8,
};
pub const SDL_Palette = extern struct {
    ncolors: c_int = @import("std").mem.zeroes(c_int),
    colors: [*c]SDL_Color = @import("std").mem.zeroes([*c]SDL_Color),
    version: Uint32 = @import("std").mem.zeroes(Uint32),
    refcount: c_int = @import("std").mem.zeroes(c_int),
};
pub const SDL_PixelFormat = extern struct {
    format: SDL_PixelFormatEnum,
    palette: [*c]SDL_Palette,
    BitsPerPixel: Uint8,
    BytesPerPixel: Uint8,
    padding: [2]Uint8,
    Rmask: Uint32,
    Gmask: Uint32,
    Bmask: Uint32,
    Amask: Uint32,
    Rloss: Uint8,
    Gloss: Uint8,
    Bloss: Uint8,
    Aloss: Uint8,
    Rshift: Uint8,
    Gshift: Uint8,
    Bshift: Uint8,
    Ashift: Uint8,
    refcount: c_int,
    next: ?*SDL_PixelFormat,
};
/// For the bri'ish
pub const SDL_Colour = SDL_Color;

pub const SDL_ALPHA_OPAQUE = @as(c_int, 255);
pub const SDL_ALPHA_TRANSPARENT = @as(c_int, 0);

pub const SDL_DEFINE_PIXELFOURCC = SDL_FOURCC;
pub inline fn SDL_DEFINE_PIXELFORMAT(@"type": SDL_PixelType, order: SDL_ArrayOrder, layout: SDL_PackedLayout, bits: u8, bytes: u8) Uint32 {
    return (((((1 << 28) | (@"type" << 24)) | (order << 20)) | (layout << 16)) | (bits << 8)) | (bytes << 0);
}
pub inline fn SDL_PIXELFLAG(X: Uint32) u8 {
    return (X >> 28) & 0x0F;
}
pub inline fn SDL_PIXELTYPE(X: Uint32) SDL_PixelType {
    return (X >> 24) & 0x0F;
}
pub inline fn SDL_PIXELORDER(X: Uint32) SDL_ArrayOrder {
    return (X >> 20) & 0x0F;
}
pub inline fn SDL_PIXELLAYOUT(X: Uint32) SDL_PackedLayout {
    return (X >> 16) & 0x0F;
}
pub inline fn SDL_BITSPERPIXEL(X: Uint32) u8 {
    return (X >> 8) & 0xFF;
}
pub inline fn SDL_BYTESPERPIXEL(X: Uint32) u8 {
    return if (SDL_ISPIXELFORMAT_FOURCC(X))
        1 + @intFromBool((X == SDL_PIXELFORMAT_YUY2) or (X == SDL_PIXELFORMAT_UYVY) or (X == SDL_PIXELFORMAT_YVYU))
    else
        X & 0xFF;
}
pub inline fn SDL_ISPIXELFORMAT_INDEXED(format: Uint32) bool {
    return !(SDL_ISPIXELFORMAT_FOURCC(format) != 0) and ((((SDL_PIXELTYPE(format) == SDL_PIXELTYPE_INDEX1) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_INDEX2)) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_INDEX4)) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_INDEX8));
}
pub inline fn SDL_ISPIXELFORMAT_PACKED(format: Uint32) bool {
    return !(SDL_ISPIXELFORMAT_FOURCC(format) != 0) and (((SDL_PIXELTYPE(format) == SDL_PIXELTYPE_PACKED8) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_PACKED16)) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_PACKED32));
}
pub inline fn SDL_ISPIXELFORMAT_ARRAY(format: Uint32) bool {
    return !(SDL_ISPIXELFORMAT_FOURCC(format) != 0) and (((((SDL_PIXELTYPE(format) == SDL_PIXELTYPE_ARRAYU8) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_ARRAYU16)) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_ARRAYU32)) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_ARRAYF16)) or (SDL_PIXELTYPE(format) == SDL_PIXELTYPE_ARRAYF32));
}
pub inline fn SDL_ISPIXELFORMAT_ALPHA(format: Uint32) bool {
    return ((SDL_ISPIXELFORMAT_PACKED(format) != 0) and ((((SDL_PIXELORDER(format) == SDL_PACKEDORDER_ARGB) or
        (SDL_PIXELORDER(format) == SDL_PACKEDORDER_RGBA)) or
        (SDL_PIXELORDER(format) == SDL_PACKEDORDER_ABGR)) or
        (SDL_PIXELORDER(format) == SDL_PACKEDORDER_BGRA))) or
        ((SDL_ISPIXELFORMAT_ARRAY(format) != 0) and ((((SDL_PIXELORDER(format) == SDL_ARRAYORDER_ARGB) or
        (SDL_PIXELORDER(format) == SDL_ARRAYORDER_RGBA)) or
        (SDL_PIXELORDER(format) == SDL_ARRAYORDER_ABGR)) or
        (SDL_PIXELORDER(format) == SDL_ARRAYORDER_BGRA)));
}
pub inline fn SDL_ISPIXELFORMAT_FOURCC(format: Uint32) bool {
    return (format != 0) and (SDL_PIXELFLAG(format) != 1);
}

pub extern fn SDL_GetPixelFormatName(format: Uint32) ?[*]const u8;
pub extern fn SDL_PixelFormatEnumToMasks(format: Uint32, bpp: ?*c_int, Rmask: ?*Uint32, Gmask: ?*Uint32, Bmask: ?*Uint32, Amask: ?*Uint32) SDL_bool;
pub extern fn SDL_MasksToPixelFormatEnum(bpp: c_int, Rmask: Uint32, Gmask: Uint32, Bmask: Uint32, Amask: Uint32) Uint32;
pub extern fn SDL_AllocFormat(pixel_format: Uint32) ?*SDL_PixelFormat;
pub extern fn SDL_FreeFormat(format: *SDL_PixelFormat) void;
pub extern fn SDL_AllocPalette(ncolors: c_int) ?*SDL_Palette;
pub extern fn SDL_SetPixelFormatPalette(format: *SDL_PixelFormat, palette: ?*SDL_Palette) c_int;
pub extern fn SDL_SetPaletteColors(palette: *SDL_Palette, colors: ?*const SDL_Color, firstcolor: c_int, ncolors: c_int) c_int;
pub extern fn SDL_FreePalette(palette: *SDL_Palette) void;
pub extern fn SDL_MapRGB(format: *const SDL_PixelFormat, r: Uint8, g: Uint8, b: Uint8) Uint32;
pub extern fn SDL_MapRGBA(format: *const SDL_PixelFormat, r: Uint8, g: Uint8, b: Uint8, a: Uint8) Uint32;
pub extern fn SDL_GetRGB(pixel: Uint32, format: *const SDL_PixelFormat, r: ?*Uint8, g: ?*Uint8, b: ?*Uint8) void;
pub extern fn SDL_GetRGBA(pixel: Uint32, format: *const SDL_PixelFormat, r: ?*Uint8, g: ?*Uint8, b: ?*Uint8, a: ?*Uint8) void;
pub extern fn SDL_CalculateGammaRamp(gamma: f32, ramp: ?*Uint16) void;
