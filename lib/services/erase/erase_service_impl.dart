import 'dart:io';
import 'package:erasica/services/erase/requests_worker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:injectable/injectable.dart';
import 'change_bg_worker.dart';
import 'erase_service.dart';

@LazySingleton(as: EraseService)
class EraseServiceImpl with RequestsWorker implements EraseService {
  @override
  Future<Uint8List?> eraseBg(String imagePath) async {
    final bytes = await File(imagePath).readAsBytes();
    final withoutBgBytes = await sendToEraseBg(bytes);
    await File(imagePath).writeAsBytes(withoutBgBytes);
    return withoutBgBytes;
  }

  @override
  Future<Uint8List?> eraseObject(String imagePath, Uint8List maskBytes) async {
    final bytes = await File(imagePath).readAsBytes();
    final withoutMaskBytes = await sendToEraseObj(bytes, maskBytes);
    await File(imagePath).writeAsBytes(withoutMaskBytes);
    return withoutMaskBytes;
  }

  @override
  Future<Uint8List?> changeBG(String imagePath, {Object? bg}) async {
    if (bg is Color) {
      return await ChangeBgWorker.changeBgGradient(
        bytes: await File(imagePath).readAsBytes(),
        pressedGradient: LinearGradient(colors: [bg, bg]),
      );
    }
    if (bg is LinearGradient) {
      return await ChangeBgWorker.changeBgGradient(
        bytes: await File(imagePath).readAsBytes(),
        pressedGradient: bg,
      );
    }
    final token = ui.RootIsolateToken.instance!;
    return await compute<Map<String, Object?>, Uint8List?>(
      ChangeBgWorker.changeBgUsingMix,
      {'image': imagePath, 'token': token, 'bg': bg},
    );
  }
}
