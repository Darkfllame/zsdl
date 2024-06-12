const std = @import("std");

fn formatTarget(allocator: std.mem.Allocator, target: std.Target) []const u8 {
    const arch = @tagName(target.cpu.arch);
    const os = @tagName(target.os.tag);
    const abi = @tagName(target.abi);

    return std.fmt.allocPrint(allocator, "{s}-{s}-{s}", .{ arch, os, abi }) catch @panic("OOM");
}

const LibType = enum {
    /// WIP
    bindings,
    /// WIP
    wrapper,
};

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const libType = b.option(LibType, "type", "Type of the library, default: bindings") orelse .bindings;

    const SDL = b.dependency("SDL", .{
        .target = target,
        .optimize = optimize,
    });

    const bOptions = b.addOptions();
    bOptions.addOption(LibType, "libType", libType);

    const bindingsLib = b.createModule(.{
        .root_source_file = b.path("src/bindings/sdl.zig"),
        .target = target,
        .optimize = optimize,
    });

    const lib = b.addModule("zsdl", .{
        .root_source_file = b.path("src/lib.zig"),
        .target = target,
        .optimize = optimize,
        .imports = &.{
            .{
                .name = "bindings",
                .module = bindingsLib,
            },
            .{
                .name = "buildOptions",
                .module = bOptions.createModule(),
            },
        },
    });
    lib.linkLibrary(SDL.artifact("SDL2"));

    { // test
        const unitTests = b.addTest(.{
            .root_source_file = b.path("src/lib.zig"),
            .target = target,
            .optimize = optimize,
        });
        unitTests.root_module.addImport("bindings", bindingsLib);
        unitTests.root_module.addImport("buildOptions", bOptions.createModule());
        unitTests.linkLibrary(SDL.artifact("SDL2"));

        const runTest = b.addRunArtifact(unitTests);
        runTest.step.dependOn(&unitTests.step);

        const testStep = b.step("test", "Run unit tests");
        testStep.dependOn(&runTest.step);
    }
}
