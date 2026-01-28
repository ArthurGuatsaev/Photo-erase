import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:erasica/core/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:no_screenshot/no_screenshot.dart';
import '../../../../core/const/system_untils.dart';
import '../../../../main.dart';
part 'canvas_event.dart';
part 'canvas_state.dart';

class CanvasBloc extends Bloc<CanvasEvent, CanvasState> {
  CanvasBloc() : super(CanvasInitial()) {
    on<CreateBackgroundFrame>(onCreateBackgroundFrame);
    onOffScreenshot();
  }
  StreamSubscription? _noScreenshotSubscription;
  onCreateBackgroundFrame(
    CreateBackgroundFrame event,
    Emitter<CanvasState> emit,
  ) async {
    try {
      final imageFile = File(event.image);
      final bytes = await imageFile.readAsBytes();
      final codec = await ui.instantiateImageCodec(bytes);
      final frame = await codec.getNextFrame();
      final size = _computeCanvasSize(event.constraints, frame);
      emit(CanvasReady(frame: frame, canvasSize: size));
    } catch (e) {
      dprint(e);
      return null;
    }
  }

  onOffScreenshot() async {
    final noScreenshot = NoScreenshot.instance;
    await noScreenshot.screenshotOff();
    _noScreenshotSubscription = noScreenshot.screenshotStream.listen((value) {
      if (value.wasScreenshotTaken) {
        appRouter.push(ScreenshotRoute());
      }
    });
  }

  Size _computeCanvasSize(BoxConstraints constraints, FrameInfo frame) {
    final imgRatio = frame.image.width / frame.image.height;
    final maxW = constraints.maxWidth;
    final maxH = constraints.maxHeight;
    final screenRatio = maxW / maxH;
    if (imgRatio > screenRatio) return Size(maxW, maxW / imgRatio);
    return Size(maxH * imgRatio, maxH);
  }

  @override
  Future<void> close() {
    _noScreenshotSubscription?.cancel();
    NoScreenshot.instance.screenshotOn();
    return super.close();
  }
}
