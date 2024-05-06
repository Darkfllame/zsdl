const buildOptins = @import("buildOptions");

pub usingnamespace switch (buildOptins.libType) {
    .bindings => @import("lib/common.zig"),
    .wrapper => @compileError("Wrapper not yet implemented"),
};
