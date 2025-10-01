# Linux Build Verification for PosixError 1.0.4

This document records the verification that PosixError version 1.0.4 can be
built on Linux using the Swift Package Manager.

## Procedure

1. Fetched the upstream repository and checked out the `1.0.4` tag.
2. Ran `swift build` on Ubuntu 22.04 with Swift 5.9.2 (the version available in
   the execution environment).
3. Confirmed that the build finished successfully without errors.

## Output Summary

```
$ swift build
Build complete!
```

The package compiled successfully, demonstrating that version 1.0.4 builds on
Linux as expected.
