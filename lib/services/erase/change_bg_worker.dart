import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_editor/image_editor.dart' as ie;
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ChangeBgWorker {
  static Future<Uint8List?> changeBgUsingMix(Map<String, Object?> value) async {
    final token = value['token'] as ui.RootIsolateToken;
    BackgroundIsolateBinaryMessenger.ensureInitialized(token);
    try {
      final fgPath = value['image'] as String;
      final bg = value['bg'];
      final fgBytes = await File(fgPath).readAsBytes();
      if (bg is XFile) {
        return await changeBgImage(bg.path, fgBytes);
      }
      return null;
    } catch (e, st) {
      debugPrint('changeBgUsingMix error: $e\n$st');
      rethrow;
    }
  }

  static Future<Uint8List> changeBgGradient({
    required Uint8List bytes,
    required LinearGradient pressedGradient,
  }) async {
    final ui.Codec codec = await ui.instantiateImageCodec(bytes);
    final ui.FrameInfo frame = await codec.getNextFrame();
    final image = frame.image;
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    final paint = Paint();
    final size = Size(image.width.toDouble(), image.height.toDouble());
    final gradient = ui.Gradient.linear(
      const Offset(0, 0),
      Offset(size.width, size.height),
      pressedGradient.colors,
    );
    paint.shader = gradient;
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    final imagePaint = Paint();
    canvas.drawImage(image, Offset.zero, imagePaint);
    final picture = recorder.endRecording();
    final finalImage = await picture.toImage(image.width, image.height);
    final byteData = await finalImage.toByteData(
      format: ui.ImageByteFormat.png,
    );
    final pngBytes = byteData!.buffer.asUint8List();
    return pngBytes;
  }

  static Future<Uint8List?> changeBgImage(
    String bgPath,
    Uint8List fgBytes,
  ) async {
    final bgBytes = await File(bgPath).readAsBytes();
    final fgImg = img.decodeImage(fgBytes)!;
    final bgImg = img.decodeImage(bgBytes)!;
    final bgResizeOption = resizeBgImage(fgImg, bgImg);
    final fgResizeOption = resizeFgImage(fgImg);
    final base = img.Image(width: fgImg.width, height: fgImg.height);
    final opts = ie.ImageEditorOption()
      ..outputFormat = const ie.OutputFormat.png()
      ..addOption(bgResizeOption)
      ..addOption(fgResizeOption);

    return await ie.ImageEditor.editImage(
      image: Uint8List.fromList(img.encodePng(base)),
      imageEditorOption: opts,
    );
  }

  static ie.MixImageOption resizeBgImage(img.Image fgImg, img.Image bgImg) {
    final outW = fgImg.width;
    final outH = fgImg.height;
    final scale = max(fgImg.width / bgImg.width, outH / bgImg.height);
    final resizedW = (bgImg.width * scale).round();
    final resizedH = (bgImg.height * scale).round();
    final bgX = ((outW - resizedW) / 2).round();
    final bgY = ((outH - resizedH) / 2).round();
    return ie.MixImageOption(
      x: bgX,
      y: bgY,
      width: resizedW,
      height: resizedH,
      target: ie.MemoryImageSource(Uint8List.fromList(img.encodePng(bgImg))),
    );
  }

  static ie.MixImageOption resizeFgImage(img.Image fgImg) {
    return ie.MixImageOption(
      x: 0,
      y: 0,
      width: fgImg.width,
      height: fgImg.height,
      target: ie.MemoryImageSource(Uint8List.fromList(img.encodePng(fgImg))),
    );
  }
}
