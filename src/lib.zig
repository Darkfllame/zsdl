const buildOptins = @import("buildOptions");

pub usingnamespace switch (buildOptins.libType) {
    .bindings => @import("bindings"),
    .wrapper => @import("wrapper/sdl.zig"),
};
