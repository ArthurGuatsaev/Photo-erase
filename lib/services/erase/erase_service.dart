import 'dart:typed_data';
import 'package:dio/dio.dart';

import 'model/web_bg.dart';

abstract class EraseService {
  Dio get dio;

  Future<void> eraseBg(String imagePath);
  Future<Uint8List> eraseObject(String imagePath, Uint8List maskBytes);
  Future<Uint8List> changeBG(String imagePath, {Object? bg});
  Future<List<WebBg>> getBgImages(String search);
  Future<Uint8List> downloadWebBg(WebBg webBg);
}
