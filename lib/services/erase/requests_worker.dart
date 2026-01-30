import 'dart:typed_data';

import 'package:http/http.dart';

mixin RequestsWorker {
  Future<Uint8List> sendToEraseBg(Uint8List bytes) async {
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
              bytes,
              filename: 'image',
              contentType: MediaType('image', 'jpeg'),
            ),
          ]);

    final response = await Response.fromStream(await request.send());
    if (response.statusCode == 200) {
      return Uint8List.fromList(response.bodyBytes);
    }

    throw 'error';
  }

  Future<Uint8List> sendToEraseObj(Uint8List original, Uint8List mask) async {
    final request = _buildRequest(
      'https://api.erasepix.click/erase_pix/remove_object/erasepix9595',
      files: [
        MultipartFile.fromBytes(
          'erasepix_ultra_image',
          original,
          filename: 'image',
          contentType: MediaType('image', 'jpeg'),
        ),
        MultipartFile.fromBytes(
          'erasepix_ultra_image_mask',
          mask,
          filename: 'mask',
          contentType: MediaType('image', 'jpeg'),
        ),
      ],
    );

    final response = await Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      return Uint8List.fromList(response.bodyBytes);
    }

    throw Exception(
      'erasepix Failed to remove object.\n'
      'erasepixStatus: ${response.statusCode}\n'
      'erasepixHeaders: ${response.headers}\n'
      'erasepixBody: ${response.body}',
    );
  }

  MultipartRequest _buildRequest(
    String url, {
    required List<MultipartFile> files,
  }) {
    return MultipartRequest('POST', Uri.parse(url))..files.addAll(files);
  }
}
