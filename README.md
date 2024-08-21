# Update

This was fixed thanks to [@kristoff-it](https://github.com/kristoff-it/) for
his help on Ziggit in [this
thread](https://ziggit.dev/t/build-step-cached-even-though-file-changed/5708)!

## Overview

```
❯ zig build
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.00s
❯ shasum ./zig-out/lib/libmylib.a
8f7bbf753fa3c4dbb3e52d7aabf6f8a2f27abf8c  ./zig-out/lib/libmylib.a
❯ nvim src/lib.rs
❯ zig build
   Compiling mylib v0.1.0 (/home/wes/Documents/repos/zig/zig-build-repro)
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.04s
❯ shasum ./zig-out/lib/libmylib.a
8f7bbf753fa3c4dbb3e52d7aabf6f8a2f27abf8c  ./zig-out/lib/libmylib.a
❯ zig build
    Finished `dev` profile [unoptimized + debuginfo] target(s) in 0.00s
❯ shasum ./zig-out/lib/libmylib.a
daa5ac9d92d3d9891578d9882263083705494505  ./zig-out/lib/libmylib.a
```

## To Repro

1. Build
    ```
    zig build
    ```
2. Get lib checksum
    ```
    shasum ./zig-out/lib/libmylib.a
    ```
3. Modify `src/lib.rs` (e.g. add/remove `!` at the end of string)
4. Build again
5. Get lib checksum again
    - Notice this time how checksum is identical to initial checksum!
6. Build one last time
7. Get lib checksum again
    - Notice how checksum is now changed
