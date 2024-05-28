const std = @import("std");
const root = @import("sdl.zig");
const sdl = @import("bindings");

pub const Point = struct {
    x: i32,
    y: i32,

    pub inline fn inRect(p: Point, r: Rect) bool {
        return (p.x >= r.x) and (p.x < (r.x + r.w)) and (p.y >= r.y) and (p.y < (r.y + r.h));
    }
    pub inline fn enclosePoints(points: []const Point, clip: ?Rect, result: *Rect) bool {
        sdl.SDL_EnclosePoints(@ptrCast(points), @intCast(points.len), if (clip) |_| &clip.? else null, @ptrCast(result));
    }
};
pub const FPoint = struct {
    x: f32,
    y: f32,

    pub inline fn inRect(p: FPoint, r: FRect) bool {
        return (p.x >= r.x) and (p.x < (r.x + r.w)) and (p.y >= r.y) and (p.y < (r.y + r.h));
    }
    pub inline fn encloseFPoints(points: []const FPoint, clip: ?FRect, result: *FRect) bool {
        sdl.SDL_EncloseFPoints(@ptrCast(points), @intCast(points.len), if (clip) |_| &clip.? else null, @ptrCast(result));
    }
};
pub const Rect = struct {
    x: i32,
    y: i32,
    w: i32,
    h: i32,

    pub inline fn empty(r: Rect) bool {
        return (r.w <= 0) or (r.h <= 0);
    }
    pub inline fn eql(a: Rect, b: Rect) bool {
        return (a.x == b.x) and (a.y == b.y) and (a.w == b.w) and (a.h == b.h);
    }
    pub inline fn hasIntersection(A: Rect, B: Rect) bool {
        return sdl.SDL_IntersectRect(@ptrCast(&A), @ptrCast(&B)) > 0;
    }
    pub inline fn intersectRect(A: Rect, B: Rect) bool {
        return sdl.SDL_IntersectRect(@ptrCast(&A), @ptrCast(&B)) > 0;
    }
    pub inline fn unionRect(A: Rect, B: Rect) Rect {
        var R: Rect = undefined;
        sdl.SDL_UnionRect(@ptrCast(&A), @ptrCast(&B), @ptrCast(&R));
        return R;
    }
    pub inline fn intersectRectAndLine(rect: Rect, X1: *u32, Y1: *u32, X2: *u32, Y2: *u32) bool {
        return sdl.SDL_IntersectRectAndLine(@ptrCast(&rect), @ptrCast(X1), @ptrCast(Y1), @ptrCast(X2), @ptrCast(Y2)) > 0;
    }
};
pub const FRect = struct {
    x: f32,
    y: f32,
    w: f32,
    h: f32,

    pub inline fn empty(r: FRect) bool {
        return (r.w <= 0.0) or (r.h <= 0.0);
    }
    pub inline fn eqlEpsilon(a: FRect, b: FRect, epsilon: f32) bool {
        return (a == b) or (@abs(a.x - b.x) <= epsilon) and (@abs(a.y - b.y) <= epsilon) and (@abs(a.w - b.w) <= epsilon) and (@abs(a.h - b.h) <= epsilon);
    }
    pub inline fn esl(a: FRect, b: FRect) bool {
        return eqlEpsilon(a, b, std.math.floatEps(f32));
    }
    pub inline fn hasIntersectionF(A: FRect, B: FRect) bool {
        return sdl.SDL_HasIntersectionF(@ptrCast(&A), @ptrCast(&B)) > 0;
    }
    pub inline fn SDL_IntersectFRect(A: FRect, B: FRect, result: *FRect) bool {
        return sdl.SDL_IntersectFRect(@ptrCast(&A), @ptrCast(&B), @ptrCast(result)) > 0;
    }
    pub inline fn unionFRect(A: FRect, B: FRect, result: *FRect) void {
        return sdl.SDL_UnionFRect(@ptrCast(&A), @ptrCast(&B), @ptrCast(result)) > 0;
    }
    pub inline fn SDL_IntersectFRectAndLine(rect: FRect, X1: *f32, Y1: *f32, X2: *f32, Y2: *f32) bool {
        return sdl.SDL_IntersectFRectAndLine(@ptrCast(&rect), X1, Y1, X2, Y2) > 0;
    }
};
