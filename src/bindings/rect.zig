const sdl = @import("sdl");

const SDL_bool = sdl.SDL_bool;

pub const SDL_Point = extern struct {
    x: c_int,
    y: c_int,
};
pub const SDL_FPoint = extern struct {
    x: f32,
    y: f32,
};
pub const SDL_Rect = extern struct {
    x: c_int,
    y: c_int,
    w: c_int,
    h: c_int,
};
pub const SDL_FRect = extern struct {
    x: f32,
    y: f32,
    w: f32,
    h: f32,
};

pub inline fn SDL_PointInRect(p: *const SDL_Point, r: *const SDL_Rect) bool {
    return (p.x >= r.x) and (p.x < (r.x + r.w)) and (p.y >= r.y) and (p.y < (r.y + r.h));
}
pub inline fn SDL_RectEmpty(r: *const SDL_Rect) bool {
    return (r.w <= 0) or (r.h <= 0);
}
pub inline fn SDL_RectEquals(a: *const SDL_Rect, b: *const SDL_Rect) bool {
    return (a.x == b.x) and (a.y == b.y) and (a.w == b.w) and (a.h == b.h);
}
pub inline fn SDL_PointInFRect(p: *const SDL_FPoint, r: *const SDL_FRect) bool {
    return (p.x >= r.x) and (p.x < (r.x + r.w)) and (p.y >= r.y) and (p.y < (r.y + r.h));
}
pub inline fn SDL_FRectEmpty(r: *const SDL_FRect) bool {
    return (r.w <= 0.0) or (r.h <= 0.0);
}
pub inline fn SDL_FRectEqualsEpsilon(a: *const SDL_FRect, b: *const SDL_FRect, epsilon: f32) bool {
    return (a == b) or (@abs(a.x - b.x) <= epsilon) and (@abs(a.y - b.y) <= epsilon) and (@abs(a.w - b.w) <= epsilon) and (@abs(a.h - b.h) <= epsilon);
}
pub inline fn SDL_FRectEquals(a: *const SDL_FRect, b: *const SDL_FRect) bool {
    return SDL_FRectEqualsEpsilon(a, b, @import("std").math.floatEps(f32));
}

pub extern fn SDL_HasIntersection(A: *const SDL_Rect, B: *const SDL_Rect) SDL_bool;
pub extern fn SDL_IntersectRect(A: *const SDL_Rect, B: *const SDL_Rect, result: *SDL_Rect) SDL_bool;
pub extern fn SDL_UnionRect(A: *const SDL_Rect, B: *const SDL_Rect, result: *SDL_Rect) void;
pub extern fn SDL_EnclosePoints(points: [*]const SDL_Point, count: c_int, clip: ?*const SDL_Rect, result: *SDL_Rect) SDL_bool;
pub extern fn SDL_IntersectRectAndLine(rect: *const SDL_Rect, X1: *c_int, Y1: *c_int, X2: *c_int, Y2: *c_int) SDL_bool;
pub extern fn SDL_HasIntersectionF(A: *const SDL_FRect, B: *const SDL_FRect) SDL_bool;
pub extern fn SDL_IntersectFRect(A: *const SDL_FRect, B: *const SDL_FRect, result: *SDL_FRect) SDL_bool;
pub extern fn SDL_UnionFRect(A: *const SDL_FRect, B: *const SDL_FRect, result: *SDL_FRect) void;
pub extern fn SDL_EncloseFPoints(points: [*]const SDL_FPoint, count: c_int, clip: ?*const SDL_FRect, result: *SDL_FRect) SDL_bool;
pub extern fn SDL_IntersectFRectAndLine(rect: *const SDL_FRect, X1: *f32, Y1: *f32, X2: *f32, Y2: *f32) SDL_bool;
