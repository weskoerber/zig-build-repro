pub fn build(b: *std.Build) void {
    const run_cargo = b.addSystemCommand(&.{ "cargo", "build" });
    const install_cargo_outputs = b.addInstallLibFile(b.path("target/debug/libmylib.a"), "libmylib.a");

    install_cargo_outputs.step.dependOn(&run_cargo.step);
    b.getInstallStep().dependOn(&install_cargo_outputs.step);
}
const std = @import("std");
