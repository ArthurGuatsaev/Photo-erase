import 'dart:typed_data';

abstract class EraseService {
  Future<void> removeBg(String imagePath);
  Future<void> removeObject(String imagePath, String maskPath);
  Future<Uint8List?> changeBG(String imagePath, {Object? bg});
}
