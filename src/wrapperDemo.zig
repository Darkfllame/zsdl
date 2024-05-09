const std = @import("std");
const zsdl = @import("zsdl");

pub fn main() !void {
    zsdl.init(zsdl.InitFlags.EVERYTHING) catch {
        return std.debug.print("[Error] Cannot initialize SDL: {s}", .{zsdl.getError()});
    };
    defer zsdl.quit();
}
