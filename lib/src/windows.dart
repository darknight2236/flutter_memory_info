import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

int? _queryMemoryStatus(int Function(MEMORYSTATUSEX status) field) {
  final status = calloc<MEMORYSTATUSEX>();
  // GlobalMemoryStatusEx reports ERROR_INVALID_PARAMETER unless the caller
  // declares the struct size first.
  status.ref.dwLength = sizeOf<MEMORYSTATUSEX>();
  try {
    final result = GlobalMemoryStatusEx(status);
    // Trust the BOOL, not the captured last-error code: a successful call
    // leaves whatever error the VM's own Win32 calls set in between, and
    // win32 reads GetLastError() from Dart, after that transition.
    if (!result.value) throw WindowsException(result.error.toHRESULT());
    return field(status.ref);
  } finally {
    free(status);
  }
}

int? getTotalPhysicalMemorySize() => _queryMemoryStatus((s) => s.ullTotalPhys);

int? getFreePhysicalMemorySize() => _queryMemoryStatus((s) => s.ullAvailPhys);

int? getTotalVirtualMemorySize() =>
    _queryMemoryStatus((s) => s.ullTotalVirtual);

int? getFreeVirtualMemorySize() => _queryMemoryStatus((s) => s.ullAvailVirtual);
