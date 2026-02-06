import 'dart:io';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

mixin FileSystem {
  Future<void> getApplicationDirectory() async {
    applicationDirectory = (await getApplicationDocumentsDirectory());
    tmpDirectory = (await getTemporaryDirectory());
  }

  Future<String> saveAsFileFromPath(String path, {bool tmp = false}) async {
    final bytes = await File(path).readAsBytes();
    return await saveAsFile(bytes, tmp: tmp);
  }

  Future<String> saveAsFile(Uint8List bytes, {bool tmp = false}) async {
    final dirctoryPath = tmp ? tmpDirectory.path : applicationDirectory.path;
    final fileName = const Uuid().v4();
    final path = join(dirctoryPath, '$fileName.jpg');
    await File(path).writeAsBytes(bytes);
    return path;
  }

  Future<String> changeFilePathByTmp(String path) async {
    final fileName = const Uuid().v4();
    final newPath = join(tmpDirectory.path, '$fileName.jpg');
    await File(path).copy(newPath);
    if (await File(path).exists()) await File(path).delete();
    return newPath;
  }

  Future<void> deleteFile(String path) async {
    try {
      await File(path).delete();
    } catch (_) {}
  }

  late final Directory applicationDirectory;

  late final Directory tmpDirectory;
}
