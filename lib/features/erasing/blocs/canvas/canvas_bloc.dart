import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/const/system_untils.dart';

part 'canvas_event.dart';
part 'canvas_state.dart';

class CanvasBloc extends Bloc<CanvasEvent, CanvasState> {
  CanvasBloc() : super(CanvasInitial()) {
    on<CreateBackgroundFrame>(onCreateBackgroundFrame);
  }

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

  Size _computeCanvasSize(BoxConstraints constraints, FrameInfo frame) {
    final imgRatio = frame.image.width / frame.image.height;
    final maxW = constraints.maxWidth;
    final maxH = constraints.maxHeight;
    final screenRatio = maxW / maxH;
    if (imgRatio > screenRatio) return Size(maxW, maxW / imgRatio);
    return Size(maxH * imgRatio, maxH);
  }
}
