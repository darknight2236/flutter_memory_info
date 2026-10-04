import 'dart:io';

import 'package:flutter_memory_info/flutter_memory_info.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('reads memory status through the win32 FFI path', () async {
    final total = await MemoryInfo.getTotalPhysicalMemorySize();
    final free = await MemoryInfo.getFreePhysicalMemorySize();
    final totalVirtual = await MemoryInfo.getTotalVirtualMemorySize();
    final freeVirtual = await MemoryInfo.getFreeVirtualMemorySize();

    expect(total, greaterThan(0));
    expect(free, greaterThan(0));
    expect(free, lessThanOrEqualTo(total!));
    expect(totalVirtual, greaterThan(0));
    expect(freeVirtual, lessThanOrEqualTo(totalVirtual!));
  }, skip: !Platform.isWindows);
}
