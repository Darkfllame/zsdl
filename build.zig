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

    const shared = b.option(bool, "shared", "Whether to dynamically link SDL, default: false") orelse false;
    const libType = b.option(LibType, "type", "Type of the library, default: bindings") orelse .bindings;

    if (b.option([]const u8, "install_prefix", "Only for library users")) |pref| {
        b.resolveInstallPrefix(pref, .{});
    }

    std.debug.print("{s}\n", .{b.install_path});

    if (target.result.abi == .msvc and !shared) @panic("MSVC currently doesn't support static SDL library");

    const bOptions = b.addOptions();
    bOptions.addOption(LibType, "libType", libType);

    const name = formatTarget(b.allocator, target.result);
    defer b.allocator.free(name);

    const lib_path = b.pathJoin(&.{
        "libs", name,
    });
    defer b.allocator.free(lib_path);

    const lib = b.addModule("zsdl", .{
        .root_source_file = b.path("src/lib.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });
    lib.addImport("buildOptions", bOptions.createModule());
    lib.addIncludePath(b.path("include"));
    lib.addLibraryPath(b.path(lib_path));
    if (target.result.os.tag == .windows) {
        lib.linkSystemLibrary(if (shared) "SDL2.dll" else "SDL2", .{
            .preferred_link_mode = if (shared) .dynamic else .static,
        });
        lib.linkSystemLibrary("Gdi32", .{});
        lib.linkSystemLibrary("Cfgmgr32", .{});
        lib.linkSystemLibrary("Ole32", .{});
        lib.linkSystemLibrary("Winmm", .{});
        lib.linkSystemLibrary("Imm32", .{});
        lib.linkSystemLibrary("Version", .{});
        lib.linkSystemLibrary("Setupapi", .{});
        lib.linkSystemLibrary("OleAut32", .{});
    } else {
        lib.linkSystemLibrary("SDL2", .{
            .preferred_link_mode = if (shared) .dynamic else .static,
        });
    }
    if (shared) {
        const libExt = switch (target.result.os.tag) {
            .windows => ".dll",
            .linux => ".so",
            .macos => ".dylib",
            else => @panic("Unsupported os for shared library"),
        };

        const sdlLibName = std.mem.join(b.allocator, "", &.{ "SDL2", libExt }) catch @panic("OOM");
        defer b.allocator.free(sdlLibName);

        const path = b.pathJoin(&.{ lib_path, sdlLibName });
        defer b.allocator.free(path);

        const istep = b.addInstallBinFile(b.path(path), sdlLibName);

        const emptyLib = b.addStaticLibrary(.{
            .name = "installShared",
            .root_source_file = b.path("src/sharedLib.zig"),
            .target = target,
            .optimize = optimize,
        });
        emptyLib.step.dependOn(&istep.step);

        lib.linkLibrary(emptyLib);
    }

    const remOut = b.addRemoveDirTree("zig-out");
    if (target.result.os.tag == .linux) {
        const remCache = b.addRemoveDirTree("zig-cache");
        b.getUninstallStep().dependOn(&remCache.step);
    }
    b.getUninstallStep().dependOn(&remOut.step);

    // demo shit
    {
        const demo = b.addExecutable(.{
            .name = "zsdl",
            .root_source_file = b.path("src/demo.zig"),
            .target = target,
            .optimize = optimize,
        });
        demo.root_module.addImport("zsdl", lib);

        b.installArtifact(demo);

        const run_cmd = b.addRunArtifact(demo);
        run_cmd.step.dependOn(b.getInstallStep());

        if (b.args) |args| {
            run_cmd.addArgs(args);
        }

        const run_step = b.step("run", "Run the app");
        run_step.dependOn(&run_cmd.step);

        const exe_unit_tests = b.addTest(.{
            .root_source_file = b.path("src/main.zig"),
            .target = target,
            .optimize = optimize,
        });

        const run_exe_unit_tests = b.addRunArtifact(exe_unit_tests);

        const test_step = b.step("test", "Run unit tests");
        test_step.dependOn(&run_exe_unit_tests.step);
    }
}
