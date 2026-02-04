import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';

import '../../core/exceptions/app_exceptions.dart';
import 'model/web_bg.dart';

mixin RequestsWorker {
  final _removeBg = '/v1/background/remove';
  final _removeObj = '/v1/object/remove';
  final _searchImg = '/v1/images/search';

  Future<Uint8List> sendToEraseObj(
    Uint8List photo,
    Uint8List mask,
    Dio dio,
  ) async {
    try {
      final body = FormData.fromMap({
        'image': _createMultipart(photo),
        'mask': _createMultipart(mask),
      });
      final response = await _sendPost(body, _removeObj, dio);
      if (response.statusCode == 200) {
        final url = _parseJson(response);
        final newBytes = await downloadBytes(url, dio);
        return newBytes;
      }

      throw NetworkException('Send to erase bg');
    } catch (e) {
      throw NetworkException('Send to erase bg:\n${e.toString()}');
    }
  }

  Future<Uint8List> sendToEraseBg(Uint8List bytes, Dio dio) async {
    try {
      final body = FormData.fromMap({'image': _createMultipart(bytes)});
      final response = await _sendPost(body, _removeBg, dio);
      if (response.statusCode == 200) {
        final url = _parseJson(response);
        final newBytes = await downloadBytes(url, dio);
        return newBytes;
      }

      throw NetworkException('Send to erase bg');
    } catch (e) {
      throw NetworkException('Send to erase bg:\n${e.toString()}');
    }
  }

  Future<List<WebBg>> sendToGetBgImages(Dio dio, {String? search}) async {
    try {
      final response = await dio.get(
        _searchImg,
        queryParameters: {'q': search ?? ''},
        options: Options(responseType: ResponseType.json),
      );
      if (response.statusCode == 200) {
        final list = response.data['hits'] as List<dynamic>;
        return WebBg.createList(list);
      }
      throw NetworkException('Send to erase bg');
    } catch (e) {
      throw NetworkException('Get background images:\n${e.toString()}');
    }
  }

  MultipartFile _createMultipart(Uint8List bytes) {
    return MultipartFile.fromBytes(bytes, filename: 'image.jpg');
  }

  Future<Response> _sendPost(FormData body, String url, Dio dio) async {
    return await dio.post<Map<String, dynamic>>(
      url,
      data: body,
      options: Options(responseType: ResponseType.json),
    );
  }

  String _parseJson(Response<dynamic> response) {
    final url = response.data?['url'];
    if (url is! String) throw NetworkException('Send to erase bg');
    return url;
  }

  Future<Uint8List> downloadBytes(String url, Dio dio) async {
    final response = await dio.get(
      url,
      options: Options(responseType: ResponseType.bytes),
    );

    if (response.statusCode != 200) throw 'Error get image from $url';
    final data = response.data;
    if (data is Uint8List) return data;
    if (data is List<int>) return Uint8List.fromList(data);
    throw 'remove bg: unexpected download type ${data.runtimeType}';
  }
}
