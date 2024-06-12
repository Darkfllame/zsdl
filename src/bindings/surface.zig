const sdl = @import("sdl.zig");

const SDL_bool = sdl.SDL_bool;
const Uint8 = sdl.Uint8;
const Uint32 = sdl.Uint32;
const SDL_BlendMode = sdl.SDL_BlendMode;
const SDL_PixelFormat = sdl.SDL_PixelFormat;
const SDL_Rect = sdl.SDL_Rect;
const SDL_Palette = sdl.SDL_Palette;
const SDL_RWops = sdl.SDL_RWops;
const SDL_RWFromFile = sdl.SDL_RWFromFile;

pub const SDL_YUV_CONVERSION_MODE = c_uint;
pub const SDL_YUV_CONVERSION_JPEG: SDL_YUV_CONVERSION_MODE = 0;
pub const SDL_YUV_CONVERSION_BT601: SDL_YUV_CONVERSION_MODE = 1;
pub const SDL_YUV_CONVERSION_BT709: SDL_YUV_CONVERSION_MODE = 2;
pub const SDL_YUV_CONVERSION_AUTOMATIC: SDL_YUV_CONVERSION_MODE = 3;

pub const SDL_blit = ?*const fn (src: *SDL_Surface, srcrect: ?*SDL_Rect, dst: *SDL_Surface, dstrect: ?*SDL_Rect) callconv(.C) c_int;
pub const SDL_Surface = extern struct {
    flags: Uint32,
    format: *SDL_PixelFormat,
    w: c_int,
    h: c_int,
    pitch: c_int,
    pixels: [*]anyopaque,
    userdata: ?*anyopaque,
    locked: c_int,
    list_blitmap: ?*anyopaque,
    clip_rect: SDL_Rect,
    map: ?*SDL_BlitMap,
    refcount: c_int,
};
pub const SDL_BlitMap = opaque {};

pub const SDL_SWSURFACE: c_int = 0;
pub const SDL_PREALLOC: c_int = 0x00000001;
pub const SDL_RLEACCEL: c_int = 0x00000002;
pub const SDL_DONTFREE: c_int = 0x00000004;
pub const SDL_SIMD_ALIGNED: c_int = 0x00000008;

pub const SDL_BlitSurface = SDL_UpperBlit;
pub const SDL_BlitScaled = SDL_UpperBlitScaled;
pub inline fn SDL_MUSTLOCK(S: anytype) bool {
    return (S.flags & SDL_RLEACCEL) != 0;
}
pub inline fn SDL_LoadBMP(file: [*]const u8) ?*SDL_Surface {
    return SDL_LoadBMP_RW(SDL_RWFromFile(file, "rb"), 1);
}
pub inline fn SDL_SaveBMP(surface: *SDL_Surface, file: [*]const u8) c_int {
    return SDL_SaveBMP_RW(surface, SDL_RWFromFile(file, "wb"), 1);
}

pub extern fn SDL_CreateRGBSurface(flags: Uint32, width: c_int, height: c_int, depth: c_int, Rmask: Uint32, Gmask: Uint32, Bmask: Uint32, Amask: Uint32) ?*SDL_Surface;
pub extern fn SDL_CreateRGBSurfaceWithFormat(flags: Uint32, width: c_int, height: c_int, depth: c_int, format: Uint32) ?*SDL_Surface;
pub extern fn SDL_CreateRGBSurfaceFrom(pixels: ?*anyopaque, width: c_int, height: c_int, depth: c_int, pitch: c_int, Rmask: Uint32, Gmask: Uint32, Bmask: Uint32, Amask: Uint32) ?*SDL_Surface;
pub extern fn SDL_CreateRGBSurfaceWithFormatFrom(pixels: ?*anyopaque, width: c_int, height: c_int, depth: c_int, pitch: c_int, format: Uint32) ?*SDL_Surface;
pub extern fn SDL_FreeSurface(surface: *SDL_Surface) void;
pub extern fn SDL_SetSurfacePalette(surface: *SDL_Surface, palette: *SDL_Palette) c_int;
pub extern fn SDL_LockSurface(surface: *SDL_Surface) c_int;
pub extern fn SDL_UnlockSurface(surface: *SDL_Surface) void;
pub extern fn SDL_LoadBMP_RW(src: *SDL_RWops, freesrc: c_int) ?*SDL_Surface;
pub extern fn SDL_SaveBMP_RW(surface: *SDL_Surface, dst: *SDL_RWops, freedst: c_int) c_int;
pub extern fn SDL_SetSurfaceRLE(surface: *SDL_Surface, flag: c_int) c_int;
pub extern fn SDL_HasSurfaceRLE(surface: *SDL_Surface) SDL_bool;
pub extern fn SDL_SetColorKey(surface: *SDL_Surface, flag: c_int, key: Uint32) c_int;
pub extern fn SDL_HasColorKey(surface: *SDL_Surface) SDL_bool;
pub extern fn SDL_GetColorKey(surface: *SDL_Surface, key: *Uint32) c_int;
pub extern fn SDL_SetSurfaceColorMod(surface: *SDL_Surface, r: Uint8, g: Uint8, b: Uint8) c_int;
pub extern fn SDL_GetSurfaceColorMod(surface: *SDL_Surface, r: ?*Uint8, g: ?*Uint8, b: ?*Uint8) c_int;
pub extern fn SDL_SetSurfaceAlphaMod(surface: *SDL_Surface, alpha: Uint8) c_int;
pub extern fn SDL_GetSurfaceAlphaMod(surface: *SDL_Surface, alpha: ?*Uint8) c_int;
pub extern fn SDL_SetSurfaceBlendMode(surface: *SDL_Surface, blendMode: SDL_BlendMode) c_int;
pub extern fn SDL_GetSurfaceBlendMode(surface: *SDL_Surface, blendMode: ?*SDL_BlendMode) c_int;
pub extern fn SDL_SetClipRect(surface: *SDL_Surface, rect: ?*const SDL_Rect) SDL_bool;
pub extern fn SDL_GetClipRect(surface: *SDL_Surface, rect: *SDL_Rect) void;
pub extern fn SDL_DuplicateSurface(surface: *SDL_Surface) ?*SDL_Surface;
pub extern fn SDL_ConvertSurface(src: *SDL_Surface, fmt: *const SDL_PixelFormat, flags: Uint32) ?*SDL_Surface;
pub extern fn SDL_ConvertSurfaceFormat(src: *SDL_Surface, pixel_format: Uint32, flags: Uint32) ?*SDL_Surface;
pub extern fn SDL_ConvertPixels(width: c_int, height: c_int, src_format: Uint32, src: ?*const anyopaque, src_pitch: c_int, dst_format: Uint32, dst: ?*anyopaque, dst_pitch: c_int) c_int;
pub extern fn SDL_PremultiplyAlpha(width: c_int, height: c_int, src_format: Uint32, src: ?*const anyopaque, src_pitch: c_int, dst_format: Uint32, dst: ?*anyopaque, dst_pitch: c_int) c_int;
pub extern fn SDL_FillRect(dst: *SDL_Surface, rect: ?*const SDL_Rect, color: Uint32) c_int;
pub extern fn SDL_FillRects(dst: *SDL_Surface, rects: [*]const SDL_Rect, count: c_int, color: Uint32) c_int;
pub extern fn SDL_UpperBlit(src: *SDL_Surface, srcrect: ?*const SDL_Rect, dst: *SDL_Surface, dstrect: ?*SDL_Rect) c_int;
pub extern fn SDL_LowerBlit(src: *SDL_Surface, srcrect: ?*SDL_Rect, dst: *SDL_Surface, dstrect: ?*SDL_Rect) c_int;
pub extern fn SDL_SoftStretch(src: *SDL_Surface, srcrect: ?*const SDL_Rect, dst: *SDL_Surface, dstrect: ?*const SDL_Rect) c_int;
pub extern fn SDL_SoftStretchLinear(src: *SDL_Surface, srcrect: ?*const SDL_Rect, dst: *SDL_Surface, dstrect: ?*const SDL_Rect) c_int;
pub extern fn SDL_UpperBlitScaled(src: *SDL_Surface, srcrect: ?*const SDL_Rect, dst: *SDL_Surface, dstrect: ?*SDL_Rect) c_int;
pub extern fn SDL_LowerBlitScaled(src: *SDL_Surface, srcrect: ?*SDL_Rect, dst: *SDL_Surface, dstrect: ?*SDL_Rect) c_int;
pub extern fn SDL_SetYUVConversionMode(mode: SDL_YUV_CONVERSION_MODE) void;
pub extern fn SDL_GetYUVConversionMode() SDL_YUV_CONVERSION_MODE;
pub extern fn SDL_GetYUVConversionModeForResolution(width: c_int, height: c_int) SDL_YUV_CONVERSION_MODE;
