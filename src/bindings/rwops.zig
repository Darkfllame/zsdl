const common = @import("common.zig");
const builtin = @import("builtin");

const SDL_bool = common.SDL_bool;
const Sint8 = common.Sint8;
const Uint8 = common.Uint8;
const Sint16 = common.Sint16;
const Uint16 = common.Uint16;
const Sint32 = common.Sint32;
const Uint32 = common.Uint32;
const Sint64 = common.Sint64;
const Uint64 = common.Uint64;

pub const SDL_RWOPS_UNKNOWN: Uint32 = 0;
pub const SDL_RWOPS_WINFILE: Uint32 = 1;
pub const SDL_RWOPS_STDFILE: Uint32 = 2;
pub const SDL_RWOPS_JNIFILE: Uint32 = 3;
pub const SDL_RWOPS_MEMORY: Uint32 = 4;
pub const SDL_RWOPS_MEMORY_RO: Uint32 = 5;

pub const RW_SEEK_SET: c_int = 0;
pub const RW_SEEK_CUR: c_int = 1;
pub const RW_SEEK_END: c_int = 2;

pub const SDL_RWops = extern struct {
    size: *const fn (context: *SDL_RWops) callconv(.C) Sint64,
    seek: *const fn (context: *SDL_RWops, offset: Sint64, whence: c_int) callconv(.C) Sint64,
    read: *const fn (context: *SDL_RWops, ptr: [*]anyopaque, size: usize, maxnum: usize) callconv(.C) usize,
    write: *const fn (context: *SDL_RWops, ptr: [*]const anyopaque, size: usize, num: usize) callconv(.C) usize,
    close: *const fn (context: *SDL_RWops) callconv(.C) c_int,
    type: Uint32,
    hidden: @Type(.{
        .Union = .{
            .decls = &.{},
            .fields = (if (builtin.abi == .android) &.{.{
                .name = "androidio",
                .alignment = 8,
                .type = extern struct {
                    assets: ?*anyopaque,
                },
            }} else if (builtin.abi == .msvc) &.{.{
                .name = "windowsio",
                .alignment = 8,
                .type = extern struct {
                    append: SDL_bool,
                    h: ?*anyopaque,
                    buffer: extern struct {
                        data: ?*anyopaque,
                        size: usize,
                        left: usize,
                    },
                },
            }}) ++ @typeInfo(extern union {
                mem: extern struct {
                    base: [*c]Uint8,
                    here: [*c]Uint8,
                    stop: [*c]Uint8,
                },
                unknown: extern struct {
                    data1: ?*anyopaque,
                    data2: ?*anyopaque,
                },
            }).Union.fields,
            .layout = .@"extern",
            .tag_type = null,
        },
    }),
};

pub extern fn SDL_RWFromFile(file: [*:0]const u8, mode: [*:0]const u8) ?*SDL_RWops;
pub extern fn SDL_RWFromFP(fp: *anyopaque, autoclose: SDL_bool) ?*SDL_RWops;
pub extern fn SDL_RWFromMem(mem: *anyopaque, size: c_int) ?*SDL_RWops;
pub extern fn SDL_RWFromConstMem(mem: *const anyopaque, size: c_int) ?*SDL_RWops;
pub extern fn SDL_AllocRW() ?*SDL_RWops;
pub extern fn SDL_FreeRW(area: *SDL_RWops) void;
pub extern fn SDL_RWsize(context: *SDL_RWops) Sint64;
pub extern fn SDL_RWseek(context: *SDL_RWops, offset: Sint64, whence: c_int) Sint64;
pub extern fn SDL_RWtell(context: *SDL_RWops) Sint64;
pub extern fn SDL_RWread(context: *SDL_RWops, ptr: [*]anyopaque, size: usize, maxnum: usize) usize;
pub extern fn SDL_RWwrite(context: *SDL_RWops, ptr: [*]const anyopaque, size: usize, num: usize) usize;
pub extern fn SDL_RWclose(context: *SDL_RWops) c_int;
pub extern fn SDL_LoadFile_RW(src: *SDL_RWops, datasize: ?*usize, freesrc: SDL_bool) ?*anyopaque;
pub extern fn SDL_LoadFile(file: [*:0]const u8, datasize: ?*usize) ?*anyopaque;
pub extern fn SDL_ReadU8(src: *SDL_RWops) Uint8;
pub extern fn SDL_ReadLE16(src: *SDL_RWops) Uint16;
pub extern fn SDL_ReadBE16(src: *SDL_RWops) Uint16;
pub extern fn SDL_ReadLE32(src: *SDL_RWops) Uint32;
pub extern fn SDL_ReadBE32(src: *SDL_RWops) Uint32;
pub extern fn SDL_ReadLE64(src: *SDL_RWops) Uint64;
pub extern fn SDL_ReadBE64(src: *SDL_RWops) Uint64;
pub extern fn SDL_WriteU8(dst: *SDL_RWops, value: Uint8) bool;
pub extern fn SDL_WriteLE16(dst: *SDL_RWops, value: Uint16) bool;
pub extern fn SDL_WriteBE16(dst: *SDL_RWops, value: Uint16) bool;
pub extern fn SDL_WriteLE32(dst: *SDL_RWops, value: Uint32) bool;
pub extern fn SDL_WriteBE32(dst: *SDL_RWops, value: Uint32) bool;
pub extern fn SDL_WriteLE64(dst: *SDL_RWops, value: Uint64) bool;
pub extern fn SDL_WriteBE64(dst: *SDL_RWops, value: Uint64) bool;
