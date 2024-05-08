# Zig SDL
A bindings and wrapper library for SDL. It's purpose is to reflect the SDL library as much as possible and not
differ from the original API with the minimum overhead.

# Installation
You can simply fetch it with `zig fetch --save=zsdl https://github.com/Darkfllame/ZSDL/archive/<commit>.tar.gz`
and replacing `<commit>` by a commit hash or a branch name (i.e: main) to have the latest commit of the specified branch.

After fetching the library, you'll need to add:
```zig
const zsdl_dep = b.dependency("zsdl", .{
    // this is mandatory if you use shared, at least if you want your dll to be installed correctly
    .install_prefix = b.install_prefix,
    .target = target,
    .optimize = optimize,
    // optional, default: false. Whether to dynamically link SDL.
    .shared = flase,
    // optional, default: .bindings. Which API to use (bindings, wrapper).
    .libType = .bindings,
});

exe.root_module.addImport("zsdl", zsdl_dep.module("zsdl"));
```

I made so that, if you're dynamically linking SDL, it will automatically install it into the output folder so you don't need to
worry about that