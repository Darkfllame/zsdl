const std = @import("std");
const root = @import("sdl.zig");
const sdl = @import("bindings");

fn TypeInt(comptime size: u16, comptime signedness: std.builtin.Signedness) type {
    return @Type(.{ .Int = .{ .bits = size, .signedness = signedness } });
}

pub const Whence = enum(c_int) {
    set = 0,
    cur,
    end,
};

pub const RWops = struct {
    _internal: sdl.SDL_RWops,

    pub inline fn fromFile(file: [:0]const u8, mode: [:0]const u8) ?*RWops {
        return @ptrCast(sdl.SDL_RWFromFile(file.ptr, mode.ptr));
    }
    pub inline fn fromFilePointer(fp: *anyopaque, autoClose: bool) ?*RWops {
        return @ptrCast(sdl.SDL_RWFromFP(fp, @intFromBool(autoClose)));
    }
    pub inline fn fromMem(mem: []u8) ?*RWops {
        return @ptrCast(sdl.SDL_RWFromMem(@ptrCast(mem), @intCast(mem.len)));
    }
    pub inline fn fromConstMem(mem: []const u8) ?*RWops {
        return @ptrCast(sdl.SDL_RWFromConstMem(@ptrCast(mem), @intCast(mem.len)));
    }
    pub inline fn alloc() ?*RWops {
        return @ptrCast(sdl.SDL_AllocRW());
    }

    pub inline fn free(area: *RWops) void {
        sdl.SDL_FreeRW(@ptrCast(area));
    }
    pub inline fn size(context: *RWops) root.Error!i64 {
        const ret = context._internal.size();
        return if (ret < 0) error.SdlError else @bitCast(ret);
    }
    pub inline fn seek(context: *RWops, offset: usize, whence: Whence) root.Error!i64 {
        const ret = context._internal.seek(@bitCast(offset), @intFromEnum(whence));
        return if (ret < 0) error.SdlError else @bitCast(ret);
    }
    pub inline fn tell(context: *RWops) root.Error!i64 {
        return seek(context, 0, .cur);
    }
    pub inline fn read(context: *RWops, comptime osz: comptime_int, ptr: []TypeInt(osz, .unsigned)) root.Error!usize {
        const ret = context._internal.read(@ptrCast(ptr), osz, ptr.len);
        return if (ret < 0) error.SdlError else @bitCast(ret);
    }
    pub inline fn write(context: *RWops, comptime osz: comptime_int, ptr: []TypeInt(osz, .unsigned)) root.Error!usize {
        const ret = context._internal.write(@ptrCast(ptr), osz, ptr.len);
        return if (ret < 0) error.SdlError else @bitCast(ret);
    }
    pub inline fn close(context: *RWops) void {
        context._internal.close();
    }

    pub inline fn loadFile_RW(src: *RWops, freesrc: bool) root.Error![]u8 {
        var datasize: usize = 0;
        return @as(
            [*]u8,
            @ptrCast(sdl.SDL_LoadFile_RW(@ptrCast(src), &datasize, @intFromBool(freesrc)) orelse
                return error.SdlError),
        )[0..datasize];
    }
    pub inline fn loadFile(file: [:0]const u8) root.Error![]u8 {
        var datasize: usize = 0;
        return @as(
            [*]u8,
            @ptrCast(sdl.SDL_LoadFile(@ptrCast(file), &datasize) orelse
                return error.SdlError),
        )[0..datasize];
    }

    pub inline fn readInt(context: *RWops, comptime T: type, comptime endian: std.builtin.Endian) root.Error!T {
        if (T != u8 and T != u16 and T != u32 and T != u64)
            @compileError("Int type can only be u8, u16, u32 or u64");
        const fnName = std.fmt.comptimePrint("SDL_Read{s}{d}", .{
            if (T == u8) "U" else if (endian == .big) "BE" else "LE",
            @typeInfo(T).Int.bits,
        });
        const ret = @call(.auto, @field(sdl, fnName), .{@as(*sdl.SDL_RWops, @ptrCast(context))});
        return if (ret == 0) error.SdlError else ret;
    }
    pub inline fn writeInt(context: *RWops, v: anytype, comptime endian: std.builtin.Endian) root.Error!void {
        const T = @TypeOf(v);
        if (T != u8 and T != u16 and T != u32 and T != u64)
            @compileError("Int type can only be u8, u16, u32 or u64");
        const fnName = std.fmt.comptimePrint("SDL_Write{s}{d}", .{
            if (T == u8) "U" else if (endian == .big) "BE" else "LE",
            @typeInfo(T).Int.bits,
        });
        const ret = @call(.auto, @field(sdl, fnName), .{
            @as(*sdl.SDL_RWops, @ptrCast(context)),
            v,
        });
        if (!ret)
            return error.SdlError;
    }
};
