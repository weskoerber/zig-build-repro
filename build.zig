pub fn build(b: *std.Build) void {
    b.getInstallStep().dependOn(&b.addSystemCommand(&.{ "cargo", "build" }).step);
    b.getInstallStep().dependOn(&b.addInstallLibFile(b.path("target/debug/libmylib.a"), "libmylib.a").step);
}

const std = @import("std");
