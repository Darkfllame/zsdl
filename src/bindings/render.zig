const sdl = @import("sdl");

const SDL_bool = sdl.SDL_bool;
const Uint8 = sdl.Uint8;
const Uint32 = sdl.Uint32;
const SDL_FPoint = sdl.SDL_FPoint;
const SDL_Color = sdl.SDL_Color;
const SDL_Window = sdl.SDL_Window;
const SDL_Surface = sdl.SDL_Surface;
const SDL_BlendMode = sdl.SDL_BlendMode;
const SDL_Rect = sdl.SDL_Rect;
const SDL_FRect = sdl.SDL_FRect;
const SDL_Point = sdl.SDL_Point;

pub const SDL_RendererInfo = extern struct {
    name: [*]const u8,
    flags: Uint32,
    num_texture_formats: Uint32,
    texture_formats: [16]Uint32,
    max_texture_width: c_int,
    max_texture_height: c_int,
};
pub const SDL_Vertex = extern struct {
    position: SDL_FPoint,
    color: SDL_Color,
    tex_coord: SDL_FPoint,
};
pub const SDL_Renderer = opaque {};
pub const SDL_Texture = opaque {};

pub const SDL_RendererFlags = c_uint;
pub const SDL_RENDERER_SOFTWARE: SDL_RendererFlags = 1;
pub const SDL_RENDERER_ACCELERATED: SDL_RendererFlags = 2;
pub const SDL_RENDERER_PRESENTVSYNC: SDL_RendererFlags = 4;
pub const SDL_RENDERER_TARGETTEXTURE: SDL_RendererFlags = 8;

pub const SDL_ScaleMode = c_uint;
pub const SDL_ScaleModeNearest: SDL_ScaleMode = 0;
pub const SDL_ScaleModeLinear: SDL_ScaleMode = 1;
pub const SDL_ScaleModeBest: SDL_ScaleMode = 2;

pub const SDL_TextureAccess = c_uint;
pub const SDL_TEXTUREACCESS_STATIC: SDL_TextureAccess = 0;
pub const SDL_TEXTUREACCESS_STREAMING: SDL_TextureAccess = 1;
pub const SDL_TEXTUREACCESS_TARGET: SDL_TextureAccess = 2;

pub const SDL_TextureModulate = c_uint;
pub const SDL_TEXTUREMODULATE_NONE: SDL_TextureModulate = 0;
pub const SDL_TEXTUREMODULATE_COLOR: SDL_TextureModulate = 1;
pub const SDL_TEXTUREMODULATE_ALPHA: SDL_TextureModulate = 2;

pub const SDL_RendererFlip = c_uint;
pub const SDL_FLIP_NONE: SDL_RendererFlip = 0;
pub const SDL_FLIP_HORIZONTAL: SDL_RendererFlip = 1;
pub const SDL_FLIP_VERTICAL: SDL_RendererFlip = 2;

pub extern fn SDL_GetNumRenderDrivers() c_int;
pub extern fn SDL_GetRenderDriverInfo(index: c_int, info: ?*SDL_RendererInfo) c_int;
pub extern fn SDL_CreateWindowAndRenderer(width: c_int, height: c_int, window_flags: Uint32, window: *?*SDL_Window, renderer: *?*SDL_Renderer) c_int;
pub extern fn SDL_CreateRenderer(window: *SDL_Window, index: c_int, flags: Uint32) ?*SDL_Renderer;
pub extern fn SDL_CreateSoftwareRenderer(surface: *SDL_Surface) ?*SDL_Renderer;
pub extern fn SDL_GetRenderer(window: *SDL_Window) ?*SDL_Renderer;
pub extern fn SDL_RenderGetWindow(renderer: *SDL_Renderer) ?*SDL_Window;
pub extern fn SDL_GetRendererInfo(renderer: *SDL_Renderer, info: *SDL_RendererInfo) c_int;
pub extern fn SDL_GetRendererOutputSize(renderer: *SDL_Renderer, w: ?*c_int, h: ?*c_int) c_int;
pub extern fn SDL_CreateTexture(renderer: *SDL_Renderer, format: Uint32, access: c_int, w: c_int, h: c_int) ?*SDL_Texture;
pub extern fn SDL_CreateTextureFromSurface(renderer: *SDL_Renderer, surface: *SDL_Surface) ?*SDL_Texture;
pub extern fn SDL_QueryTexture(texture: *SDL_Texture, format: ?*Uint32, access: ?*c_int, w: ?*c_int, h: ?*c_int) c_int;
pub extern fn SDL_SetTextureColorMod(texture: *SDL_Texture, r: Uint8, g: Uint8, b: Uint8) c_int;
pub extern fn SDL_GetTextureColorMod(texture: *SDL_Texture, r: ?*Uint8, g: ?*Uint8, b: ?*Uint8) c_int;
pub extern fn SDL_SetTextureAlphaMod(texture: *SDL_Texture, alpha: Uint8) c_int;
pub extern fn SDL_GetTextureAlphaMod(texture: *SDL_Texture, alpha: *Uint8) c_int;
pub extern fn SDL_SetTextureBlendMode(texture: *SDL_Texture, blendMode: SDL_BlendMode) c_int;
pub extern fn SDL_GetTextureBlendMode(texture: *SDL_Texture, blendMode: *SDL_BlendMode) c_int;
pub extern fn SDL_SetTextureScaleMode(texture: *SDL_Texture, scaleMode: SDL_ScaleMode) c_int;
pub extern fn SDL_GetTextureScaleMode(texture: *SDL_Texture, scaleMode: *SDL_ScaleMode) c_int;
pub extern fn SDL_SetTextureUserData(texture: *SDL_Texture, userdata: ?*anyopaque) c_int;
pub extern fn SDL_GetTextureUserData(texture: *SDL_Texture) ?*anyopaque;
pub extern fn SDL_UpdateTexture(texture: *SDL_Texture, rect: ?*const SDL_Rect, pixels: [*]const anyopaque, pitch: c_int) c_int;
pub extern fn SDL_UpdateYUVTexture(texture: *SDL_Texture, rect: ?*const SDL_Rect, Yplane: [*]const Uint8, Ypitch: c_int, Uplane: [*]const Uint8, Upitch: c_int, Vplane: [*]const Uint8, Vpitch: c_int) c_int;
pub extern fn SDL_UpdateNVTexture(texture: *SDL_Texture, rect: ?*const SDL_Rect, Yplane: [*]const Uint8, Ypitch: c_int, UVplane: [*]const Uint8, UVpitch: c_int) c_int;
pub extern fn SDL_LockTexture(texture: *SDL_Texture, rect: ?*const SDL_Rect, pixels: [*][*]anyopaque, pitch: *c_int) c_int;
pub extern fn SDL_LockTextureToSurface(texture: *SDL_Texture, rect: ?*const SDL_Rect, surface: **SDL_Surface) c_int;
pub extern fn SDL_UnlockTexture(texture: *SDL_Texture) void;
pub extern fn SDL_RenderTargetSupported(renderer: *SDL_Renderer) SDL_bool;
pub extern fn SDL_SetRenderTarget(renderer: *SDL_Renderer, texture: ?*SDL_Texture) c_int;
pub extern fn SDL_GetRenderTarget(renderer: *SDL_Renderer) ?*SDL_Texture;
pub extern fn SDL_RenderSetLogicalSize(renderer: *SDL_Renderer, w: c_int, h: c_int) c_int;
pub extern fn SDL_RenderGetLogicalSize(renderer: *SDL_Renderer, w: ?*c_int, h: ?*c_int) void;
pub extern fn SDL_RenderSetIntegerScale(renderer: *SDL_Renderer, enable: SDL_bool) c_int;
pub extern fn SDL_RenderGetIntegerScale(renderer: *SDL_Renderer) SDL_bool;
pub extern fn SDL_RenderSetViewport(renderer: *SDL_Renderer, rect: ?*const SDL_Rect) c_int;
pub extern fn SDL_RenderGetViewport(renderer: *SDL_Renderer, rect: *SDL_Rect) void;
pub extern fn SDL_RenderSetClipRect(renderer: *SDL_Renderer, rect: ?*const SDL_Rect) c_int;
pub extern fn SDL_RenderGetClipRect(renderer: *SDL_Renderer, rect: *SDL_Rect) void;
pub extern fn SDL_RenderIsClipEnabled(renderer: *SDL_Renderer) SDL_bool;
pub extern fn SDL_RenderSetScale(renderer: *SDL_Renderer, scaleX: f32, scaleY: f32) c_int;
pub extern fn SDL_RenderGetScale(renderer: *SDL_Renderer, scaleX: ?*f32, scaleY: ?*f32) void;
pub extern fn SDL_RenderWindowToLogical(renderer: *SDL_Renderer, windowX: c_int, windowY: c_int, logicalX: ?*f32, logicalY: ?*f32) void;
pub extern fn SDL_RenderLogicalToWindow(renderer: *SDL_Renderer, logicalX: f32, logicalY: f32, windowX: ?*c_int, windowY: ?*c_int) void;
pub extern fn SDL_SetRenderDrawColor(renderer: *SDL_Renderer, r: Uint8, g: Uint8, b: Uint8, a: Uint8) c_int;
pub extern fn SDL_GetRenderDrawColor(renderer: *SDL_Renderer, r: ?*Uint8, g: ?*Uint8, b: ?*Uint8, a: ?*Uint8) c_int;
pub extern fn SDL_SetRenderDrawBlendMode(renderer: *SDL_Renderer, blendMode: SDL_BlendMode) c_int;
pub extern fn SDL_GetRenderDrawBlendMode(renderer: *SDL_Renderer, blendMode: *SDL_BlendMode) c_int;
pub extern fn SDL_RenderClear(renderer: *SDL_Renderer) c_int;
pub extern fn SDL_RenderDrawPoint(renderer: *SDL_Renderer, x: c_int, y: c_int) c_int;
pub extern fn SDL_RenderDrawPoints(renderer: *SDL_Renderer, points: [*]const SDL_Point, count: c_int) c_int;
pub extern fn SDL_RenderDrawLine(renderer: *SDL_Renderer, x1: c_int, y1: c_int, x2: c_int, y2: c_int) c_int;
pub extern fn SDL_RenderDrawLines(renderer: *SDL_Renderer, points: [*]const SDL_Point, count: c_int) c_int;
pub extern fn SDL_RenderDrawRect(renderer: *SDL_Renderer, rect: ?*const SDL_Rect) c_int;
pub extern fn SDL_RenderDrawRects(renderer: *SDL_Renderer, rects: [*]const SDL_Rect, count: c_int) c_int;
pub extern fn SDL_RenderFillRect(renderer: *SDL_Renderer, rect: ?*const SDL_Rect) c_int;
pub extern fn SDL_RenderFillRects(renderer: *SDL_Renderer, rects: [*]const SDL_Rect, count: c_int) c_int;
pub extern fn SDL_RenderCopy(renderer: *SDL_Renderer, texture: *SDL_Texture, srcrect: ?*const SDL_Rect, dstrect: ?*const SDL_Rect) c_int;
pub extern fn SDL_RenderCopyEx(renderer: *SDL_Renderer, texture: *SDL_Texture, srcrect: ?*const SDL_Rect, dstrect: ?*const SDL_Rect, angle: f64, center: ?*const SDL_Point, flip: SDL_RendererFlip) c_int;
pub extern fn SDL_RenderDrawPointF(renderer: *SDL_Renderer, x: f32, y: f32) c_int;
pub extern fn SDL_RenderDrawPointsF(renderer: *SDL_Renderer, points: [*]const SDL_FPoint, count: c_int) c_int;
pub extern fn SDL_RenderDrawLineF(renderer: *SDL_Renderer, x1: f32, y1: f32, x2: f32, y2: f32) c_int;
pub extern fn SDL_RenderDrawLinesF(renderer: *SDL_Renderer, points: [*]const SDL_FPoint, count: c_int) c_int;
pub extern fn SDL_RenderDrawRectF(renderer: *SDL_Renderer, rect: ?*const SDL_FRect) c_int;
pub extern fn SDL_RenderDrawRectsF(renderer: *SDL_Renderer, rects: [*]const SDL_FRect, count: c_int) c_int;
pub extern fn SDL_RenderFillRectF(renderer: *SDL_Renderer, rect: ?*const SDL_FRect) c_int;
pub extern fn SDL_RenderFillRectsF(renderer: *SDL_Renderer, rects: [*]const SDL_FRect, count: c_int) c_int;
pub extern fn SDL_RenderCopyF(renderer: *SDL_Renderer, texture: *SDL_Texture, srcrect: ?*const SDL_Rect, dstrect: ?*const SDL_FRect) c_int;
pub extern fn SDL_RenderCopyExF(renderer: *SDL_Renderer, texture: *SDL_Texture, srcrect: ?*const SDL_Rect, dstrect: ?*const SDL_FRect, angle: f64, center: ?*const SDL_FPoint, flip: SDL_RendererFlip) c_int;
pub extern fn SDL_RenderGeometry(renderer: *SDL_Renderer, texture: *SDL_Texture, vertices: [*]const SDL_Vertex, num_vertices: c_int, indices: [*]const c_int, num_indices: c_int) c_int;
pub extern fn SDL_RenderGeometryRaw(renderer: *SDL_Renderer, texture: *SDL_Texture, xy: [*]const f32, xy_stride: c_int, color: [*]const SDL_Color, color_stride: c_int, uv: [*]const f32, uv_stride: c_int, num_vertices: c_int, indices: [*]const anyopaque, num_indices: c_int, size_indices: c_int) c_int;
pub extern fn SDL_RenderReadPixels(renderer: *SDL_Renderer, rect: ?*const SDL_Rect, format: Uint32, pixels: [*]anyopaque, pitch: c_int) c_int;
pub extern fn SDL_RenderPresent(renderer: *SDL_Renderer) void;
pub extern fn SDL_DestroyTexture(texture: *SDL_Texture) void;
pub extern fn SDL_DestroyRenderer(renderer: *SDL_Renderer) void;
pub extern fn SDL_RenderFlush(renderer: *SDL_Renderer) c_int;
pub extern fn SDL_GL_BindTexture(texture: *SDL_Texture, texw: ?*f32, texh: ?*f32) c_int;
pub extern fn SDL_GL_UnbindTexture(texture: *SDL_Texture) c_int;
pub extern fn SDL_RenderGetMetalLayer(renderer: *SDL_Renderer) ?*anyopaque;
pub extern fn SDL_RenderGetMetalCommandEncoder(renderer: *SDL_Renderer) ?*anyopaque;
pub extern fn SDL_RenderSetVSync(renderer: *SDL_Renderer, vsync: c_int) c_int;
