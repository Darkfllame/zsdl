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

    const bOptions = b.addOptions();
    bOptions.addOption(LibType, "libType", libType);

    const name = formatTarget(b.allocator, target.result);
    defer b.allocator.free(name);

    const lib_path = b.pathJoin(&.{
        "libs", name,
    });
    defer b.allocator.free(lib_path);

    if (std.fs.cwd().access(lib_path, .{})) |_| {} else |_| {
        std.debug.print("Cannot compile zsdl to {s}\n", .{name});
        return error.UnsupportedTargetPlatform;
    }

    const bindingsLib = b.createModule(.{
        .root_source_file = b.path("src/bindings/sdl.zig"),
    });
    bindingsLib.addImport("sdl", bindingsLib);

    const lib = b.addModule("zsdl", .{
        .root_source_file = b.path("src/lib.zig"),
        .target = target,
        .optimize = optimize,
        .link_libc = true,
        .imports = &.{
            .{
                .name = "bindings",
                .module = bindingsLib,
            },
        },
    });
    lib.addImport("buildOptions", bOptions.createModule());
    lib.addIncludePath(b.path("include/"));
    lib.addLibraryPath(b.path(lib_path));
    if (libType == .wrapper) {
        lib.addImport("bindings", bindingsLib);
    }
    if (target.result.os.tag == .windows) {
        // windows is a special one, not in my heart tho, dev
        // on windows is like hell: forever stuck to suffer
        lib.linkSystemLibrary(
            // if shared and msvc then uses "SDL2"
            // if shared and not msvc then uses "SDL2.dll"
            // if not shared and msvc then uses "SDL2-static"
            // if not shared and not msvc then uses "SDL2"
            if (shared)
                if (target.result.abi == .msvc) "SDL2" else "SDL2.dll"
            else if (target.result.abi == .msvc) "SDL2-static" else "SDL2",
            .{ .preferred_link_mode = if (shared) .dynamic else .static },
        );
        if (target.result.abi == .msvc) {
            lib.linkSystemLibrary("Advapi32", .{});
            lib.linkSystemLibrary("Shell32", .{});
            lib.linkSystemLibrary("User32", .{});
        }
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

    // demo shit
    {
        const demo = b.addExecutable(.{
            .name = "zsdl",
            .root_source_file = b.path(if (libType == .bindings)
                "src/bindingsDemo.zig"
            else
                "src/wrapperDemo.zig"),
            .target = target,
            .optimize = optimize,
        });
        demo.root_module.addImport("zsdl", lib);

        b.installArtifact(demo);

        const run_cmd = b.addRunArtifact(demo);
        run_cmd.step.dependOn(b.getInstallStep());
        run_cmd.addArgs(b.args orelse &.{});

        const run_step = b.step("run", "Run the app");
        run_step.dependOn(&run_cmd.step);
    }
}
