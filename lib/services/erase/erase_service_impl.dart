import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'dart:ui' as ui;
import 'package:injectable/injectable.dart';
import 'change_bg_worker.dart';
import 'erase_service.dart';

@LazySingleton(as: EraseService)
class EraseServiceImpl implements EraseService {
  @override
  Future<Uint8List?> removeBg(String imagePath) async {
    final bytes = await sendToRemoveBg(imagePath);
    await File(imagePath).writeAsBytes(bytes);
    return bytes;
  }

  Future<Uint8List> sendToRemoveBg(String imagePath) async {
    final byte = await File(imagePath).readAsBytes();

    final request =
        MultipartRequest(
            'POST',
            Uri.parse(
              'https://api.erasepix.click/erase_pix/remove_background/erasepix9595',
            ),
          )
          ..files.addAll([
            MultipartFile.fromBytes(
              'erasepix_ultra_image',
              byte,
              filename: 'image',
              contentType: MediaType('image', 'jpeg'),
            ),
          ]);

    final response = await Response.fromStream(await request.send());
    if (response.statusCode == 200) {
      return Uint8List.fromList(response.bodyBytes);
    }

    throw Exception(
      'erasepixFailed to remove background.\n'
      'erasepixStatus: ${response.statusCode}\n'
      'erasepixHeaders: ${response.headers}\n'
      'erasepixBody: ${response.body}',
    );
  }

  @override
  Future<Uint8List?> removeObject(String imagePath, String maskPath) {
    // TODO: implement removeObject
    throw UnimplementedError();
  }

  @override
  Future<Uint8List?> changeBG(String imagePath, {Object? bg}) async {
    final token = ui.RootIsolateToken.instance!;
    return await compute<Map<String, Object?>, Uint8List?>(
      ChangeBgWorker.changeBgUsingMix,
      {'image': imagePath, 'token': token, 'bg': bg},
    );
  }
}
