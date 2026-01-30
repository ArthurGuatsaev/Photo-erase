import 'dart:typed_data';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:erasica/core/const/system_untils.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
part 'mask_state.dart';

class MaskCubit extends Cubit<MaskState> {
  MaskCubit({required this.frame, required this.canvasSize})
    : super(MaskState(currentPath: Path(), frame: frame));
  final FrameInfo frame;
  final Size canvasSize;
  var hasPanned = false;
  int? _activePointer;
  Offset? _downPos;
  Offset? _lastPos;
  double _maxMove = 0.0;

  static const double _tapSlop = 6.0;
  void onPointerDown(PointerDownEvent e) {
    // если уже рисуем одним пальцем — игнорируем
    if (_activePointer != null) return;

    hasPanned = false;
    _activePointer = e.pointer;
    _downPos = e.localPosition;
    _lastPos = e.localPosition;
    _maxMove = 0.0;

    final p = e.localPosition;
    if (_isPointInBounds(p)) {
      emit(
        state.copyWith(
          isDrawing: true,
          currentStroke: [p],
          currentPath: Path()..moveTo(p.dx, p.dy),
        ),
      );
    }
  }

  void onPointerMove(PointerMoveEvent e) {
    if (_activePointer != e.pointer) return;
    if (!state.isDrawing) return;

    final p = e.localPosition;
    final last = _lastPos ?? p;
    _lastPos = p;

    final move = (p - last).distance;
    final fromDown = _downPos == null ? 0.0 : (p - _downPos!).distance;
    _maxMove = _maxMove < fromDown ? fromDown : _maxMove;

    if (_isPointInBounds(p)) {
      // как в твоем onPanUpdate (интерполяция)
      final newStrokes = [...state.currentStroke];

      if (state.currentStroke.isNotEmpty) {
        final lastPoint = state.currentStroke.last;
        final distance = (p - lastPoint).distance;
        if (distance > 2.0) {
          final steps = (distance / 2.0).round().clamp(1, 5);
          for (int i = 1; i <= steps; i++) {
            final t = i / steps;
            final interpolated = Offset.lerp(lastPoint, p, t)!;
            newStrokes.add(interpolated);
          }
        } else {
          newStrokes.add(p);
        }
      } else {
        newStrokes.add(p);
      }

      hasPanned = hasPanned || move > 0.0;
      emit(state.copyWith(currentStroke: newStrokes));
      _updateCurrentPath();
    }
  }

  void onPointerUp(PointerUpEvent e) {
    if (_activePointer != e.pointer) return;

    final p = e.localPosition;

    // если почти не двигался — это "тап": рисуем точку
    final isTap = _maxMove <= _tapSlop;

    if (state.isDrawing && _isPointInBounds(p)) {
      if (isTap) {
        final tapPath = Path()
          ..addOval(Rect.fromCircle(center: p, radius: state.lineSize / 2));

        final tapStroke = DrawingStroke(
          points: [p],
          details: DrawingDetails(size: state.lineSize, path: tapPath),
        );

        final newStrokes = [...state.strokes, tapStroke];
        emit(
          state.copyWith(
            redoStack: [],
            isDrawing: false,
            currentStroke: [],
            currentPath: Path(),
            strokes: newStrokes,
          ),
        );
      } else {
        // это "пан": финализируем как в onPanEnd
        emit(state.copyWith(isDrawing: false));
        if (state.currentStroke.isNotEmpty) {
          final stroke = DrawingStroke(
            points: List.from(state.currentStroke),
            details: DrawingDetails(
              size: state.lineSize,
              path: Path.from(state.currentPath),
            ),
          );
          final newStrokes = [...state.strokes, stroke];
          emit(
            state.copyWith(
              currentPath: Path(),
              redoStack: [],
              strokes: newStrokes,
              currentStroke: [],
            ),
          );
        }
      }
    } else {
      onPanCancel();
    }

    _resetPointerTracking();
  }

  void onPointerCancel(PointerCancelEvent e) {
    if (_activePointer != e.pointer) return;
    onPanCancel();
    _resetPointerTracking();
  }

  void onPanCancel() {
    if (!state.isDrawing) {
      _resetPointerTracking();
      return;
    }
    emit(
      state.copyWith(isDrawing: false, currentStroke: [], currentPath: Path()),
    );
    _resetPointerTracking();
  }

  void _resetPointerTracking() {
    _activePointer = null;
    _downPos = null;
    _lastPos = null;
    _maxMove = 0.0;
    hasPanned = false;
  }

  void onTapDown(TapDownDetails details) {
    dprint('onTapDown');

    hasPanned = false;
    final localPosition = details.localPosition;
    if (_isPointInBounds(localPosition)) {
      emit(
        state.copyWith(
          isDrawing: true,
          currentStroke: [localPosition],
          currentPath: Path(),
        ),
      );
    }
  }

  void onTapUp(TapUpDetails details) {
    if (!hasPanned && state.isDrawing) {
      final localPosition = details.localPosition;
      if (_isPointInBounds(localPosition)) {
        final tapPath = Path()
          ..addOval(
            Rect.fromCircle(center: localPosition, radius: state.lineSize / 2),
          );
        final tapStroke = DrawingStroke(
          points: [localPosition],
          details: DrawingDetails(size: state.lineSize, path: tapPath),
        );
        final newStrokes = [...state.strokes];
        newStrokes.add(tapStroke);
        emit(
          state.copyWith(
            redoStack: [],
            isDrawing: false,
            currentStroke: [],
            currentPath: Path(),
            strokes: newStrokes,
          ),
        );
      }
    } else if (state.isDrawing) {
      emit(
        state.copyWith(
          currentStroke: [],
          isDrawing: false,
          currentPath: Path(),
        ),
      );
    }
  }

  void onPanStart(DragStartDetails details) {
    dprint('onPanStart');
    final localPosition = details.localPosition;
    if (_isPointInBounds(localPosition)) {
      hasPanned = true;
      if (!state.isDrawing) {
        emit(
          state.copyWith(
            currentStroke: [localPosition],
            isDrawing: true,
            currentPath: Path(),
          ),
        );
      }
      if (state.currentPath.getBounds().isEmpty) {
        state.currentPath.moveTo(localPosition.dx, localPosition.dy);
      }
    }
  }

  void onPanUpdate(DragUpdateDetails details) {
    dprint('onPanUpdate');

    if (!state.isDrawing) return;
    final localPosition = details.localPosition;
    final newStrokes = [...state.currentStroke];

    if (_isPointInBounds(localPosition)) {
      if (state.currentStroke.isNotEmpty) {
        final lastPoint = state.currentStroke.last;
        final distance = (localPosition - lastPoint).distance;
        if (distance > 2.0) {
          final steps = (distance / 2.0).round().clamp(1, 5);
          for (int i = 1; i <= steps; i++) {
            final t = i / steps;
            final interpolated = Offset.lerp(lastPoint, localPosition, t)!;
            newStrokes.add(interpolated);
          }
        } else {
          newStrokes.add(localPosition);
        }
      } else {
        newStrokes.add(localPosition);
      }
      emit(state.copyWith(currentStroke: newStrokes));

      _updateCurrentPath();
    }
  }

  void onPanEnd(DragEndDetails details) {
    dprint('onPanEnd');

    if (!state.isDrawing) return;
    emit(state.copyWith(isDrawing: false));
    if (state.currentStroke.isNotEmpty) {
      final stroke = DrawingStroke(
        points: List.from(state.currentStroke),
        details: DrawingDetails(
          size: state.lineSize,
          path: Path.from(state.currentPath),
        ),
      );
      final newStrokes = [...state.strokes];

      newStrokes.add(stroke);
      emit(
        state.copyWith(
          currentPath: Path(),
          redoStack: [],
          strokes: newStrokes,
          currentStroke: [],
        ),
      );
    }
  }

  void _updateCurrentPath() {
    if (state.currentStroke.length < 2) return;
    final path = Path();
    path.moveTo(state.currentStroke[0].dx, state.currentStroke[0].dy);
    if (state.currentStroke.length == 2) {
      path.lineTo(state.currentStroke[1].dx, state.currentStroke[1].dy);
    } else {
      for (int i = 1; i < state.currentStroke.length - 1; i++) {
        final p1 = state.currentStroke[i];
        final p2 = state.currentStroke[i + 1];
        final control = Offset((p1.dx + p2.dx) / 2, (p1.dy + p2.dy) / 2);
        path.quadraticBezierTo(p1.dx, p1.dy, control.dx, control.dy);
      }
      final last = state.currentStroke.last;
      path.lineTo(last.dx, last.dy);
    }
    emit(state.copyWith(currentPath: path));
  }

  bool _isPointInBounds(Offset point) {
    return point.dx >= 0 &&
        point.dx <= canvasSize.width &&
        point.dy >= 0 &&
        point.dy <= canvasSize.height;
  }

  void undo() {
    if (state.strokes.isNotEmpty) {
      final newStrokes = [...state.strokes];
      final newRedo = [...state.redoStack];
      newRedo.add(newStrokes.removeLast());
      emit(
        state.copyWith(
          currentStroke: [],
          currentPath: Path(),
          isDrawing: false,
          strokes: newStrokes,
          redoStack: newRedo,
        ),
      );
    }
  }

  void redo() {
    if (state.redoStack.isNotEmpty) {
      final newStrokes = [...state.strokes];
      final newRedo = [...state.redoStack];
      newStrokes.add(newRedo.removeLast());
      emit(
        state.copyWith(
          currentStroke: [],
          strokes: newStrokes,
          redoStack: newRedo,
          currentPath: Path(),
          isDrawing: false,
        ),
      );
    }
  }

  void clear() {
    emit(
      state.copyWith(
        currentStroke: [],
        strokes: [],
        redoStack: [],
        currentPath: Path(),
        isDrawing: false,
      ),
    );
  }

  Future<Uint8List?> saveMask() async {
    try {
      if (state.imageWidth == null || state.imageHeight == null) return null;
      final recorder = ui.PictureRecorder();
      final canvas = Canvas(recorder);
      final backgroundPaint = Paint();
      canvas.drawRect(
        Rect.fromLTWH(0, 0, state.imageWidth!, state.imageHeight!),
        backgroundPaint,
      );

      final scaleX = state.imageWidth! / (canvasSize.width);
      final scaleY = state.imageHeight! / (canvasSize.height);
      final maskPaint = Paint()
        ..color = Colors.white
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round
        ..style = PaintingStyle.stroke;

      for (final stroke in state.strokes) {
        maskPaint.strokeWidth = stroke.details.size * scaleX;

        if (stroke.points.length == 1) {
          _drawOnePoint(stroke, scaleX, scaleY, canvas);
        } else if (stroke.points.isNotEmpty) {
          _drawFewPoint(stroke, scaleX, scaleY, canvas, maskPaint);
        }
      }
      clear();
      return await _createMask(recorder);
    } catch (e) {
      debugPrint('Error saving mask: $e');
      return null;
    }
  }

  void _drawOnePoint(
    DrawingStroke stroke,
    double scaleX,
    double scaleY,
    Canvas canvas,
  ) {
    final p = stroke.points.first;
    final scaled = Offset(p.dx * scaleX, p.dy * scaleY);
    final radius = (stroke.details.size / 2) * scaleX;
    canvas.drawCircle(
      scaled,
      radius,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.fill,
    );
  }

  void _drawFewPoint(
    DrawingStroke stroke,
    double scaleX,
    double scaleY,
    Canvas canvas,
    Paint maskPaint,
  ) {
    final scaledPath = Path();
    bool first = true;
    for (final point in stroke.points) {
      final scaled = Offset(point.dx * scaleX, point.dy * scaleY);
      if (first) {
        scaledPath.moveTo(scaled.dx, scaled.dy);
        first = false;
      } else {
        scaledPath.lineTo(scaled.dx, scaled.dy);
      }
    }

    canvas.drawPath(scaledPath, maskPaint);
  }

  void onUpdateBrushSize(double newSize) {
    final clamped = newSize.clamp(0.0, 100.0);
    emit(state.copyWith(lineSize: clamped));
  }

  Future<Uint8List?> _createMask(PictureRecorder recorder) async {
    final picture = recorder.endRecording();
    final image = await picture.toImage(
      state.imageWidth!.toInt(),
      state.imageHeight!.toInt(),
    );
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    clear();

    if (byteData == null) return null;
    return byteData.buffer.asUint8List();
  }
}
