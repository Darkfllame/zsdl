# Zig SDL

A bindings and wrapper library for SDL. It's purpose is to reflect the SDL library as much as possible and not
differ from the original API with the minimum overhead.

# Installation

You can simply fetch it with `zig fetch --save=zsdl https://github.com/Darkfllame/ZSDL/archive/<commit>.tar.gz`
and replacing `<commit>` by a commit hash or a branch name (i.e: main) to have the latest commit of the specified branch.

After fetching the library, you'll need to add:

```zig
const zsdl_dep = b.dependency("zsdl", .{
    .target = target,
    .optimize = optimize,
    // optional, default: false. Whether to dynamically link SDL.
    .shared = flase,
    // optional, default: .bindings. Which API to use (bindings, wrapper).
    // bindings are currently fully functional for purely rendering. wrapper WIP
    .libType = .bindings,
});

exe.root_module.addImport("zsdl", zsdl_dep.module("zsdl"));
```

I made so that, if you're dynamically linking SDL, it will automatically install it into the output folder so you don't need to
worry about that.

##

Quick note: fetching the package will take forever, and i know but i couldn't figure out how to compile SDL from source with zig,
yeah ik, skill issue right ?
