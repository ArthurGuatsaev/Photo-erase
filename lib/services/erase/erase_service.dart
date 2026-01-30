import 'dart:typed_data';

abstract class EraseService {
  Future<void> eraseBg(String imagePath);
  Future<Uint8List?> eraseObject(String imagePath, Uint8List maskBytes);
  Future<Uint8List?> changeBG(String imagePath, {Object? bg});
}
