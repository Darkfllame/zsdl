const buildOptins = @import("buildOptions");

pub usingnamespace switch (buildOptins.libType) {
    .bindings => @import("bindings/common.zig"),
    .wrapper => @compileError("Wrapper not yet implemented"),
};
