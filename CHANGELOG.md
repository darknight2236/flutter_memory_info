## 0.0.4

Port the Windows FFI path to win32 6, where `GlobalMemoryStatusEx` returns a
`Win32Result<bool>` instead of a bare `BOOL`. Success is decided by that
returned `BOOL` rather than by a follow-up `GetLastError()` call, whose value
the Dart VM can overwrite between the two native transitions. Raises `win32`
to `^6.0.1` and the Dart SDK floor to `^3.10.0` accordingly; the public API is
unchanged.

The two `flutter create` scaffolding tests referenced a platform-interface
layer and a `getPlatformVersion` method this package never had, so they never
compiled; they are replaced by one that asserts real memory values on Windows.

## 0.0.3

Fix crash on Android

## 0.0.1

initial version