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
    final dirctoryPath = tmp ? applicationDirectory.path : tmpDirectory.path;
    final fileName = Uuid().v4();
    final path = join(dirctoryPath, fileName);
    await File(path).writeAsBytes(bytes);
    return path;
  }

  late final Directory applicationDirectory;

  late final Directory tmpDirectory;
}
