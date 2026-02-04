import 'package:flutter/material.dart';

import '../mask_cubit/mask_cubit.dart';

class EraseMaskPainter extends CustomPainter {
  const EraseMaskPainter({
    required this.strokes,
    required this.currentStroke,
    required this.brushSize,
    required this.color,
    required this.drawing,
    required this.currentPath,
    required this.scale,
  });

  final List<DrawingStroke> strokes;
  final List<Offset> currentStroke;
  final double brushSize;
  final Color color;
  final bool drawing;
  final Path currentPath;
  final double scale;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.clipRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final paint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Рисуем уже завершённые линии
    for (final stroke in strokes) {
      paint
        ..strokeWidth = stroke.details.size
        ..color = color.withValues(alpha: 0.8)
        ..style = PaintingStyle.stroke;

      if (stroke.points.length == 1) {
        paint.style = PaintingStyle.fill;
        canvas.drawCircle(stroke.points.first, stroke.details.size / 2, paint);
      } else {
        canvas.drawPath(stroke.details.path, paint);
      }
    }

    // Рисуем текущий активный штрих
    if (!drawing || currentStroke.isEmpty) return;

    paint
      ..strokeWidth = brushSize
      ..color = color.withValues(alpha: 0.9)
      ..style = PaintingStyle.stroke;

    if (currentStroke.length == 1) {
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(currentStroke.first, brushSize / 2, paint);
    } else {
      canvas.drawPath(currentPath, paint);
      final last = currentStroke.last;
      paint
        ..style = PaintingStyle.fill
        ..color = color.withValues(alpha: 0.3);
      canvas.drawCircle(last, brushSize / 2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant EraseMaskPainter old) {
    return old.strokes.length != strokes.length ||
        old.currentStroke.length != currentStroke.length ||
        old.brushSize != brushSize ||
        old.color != color ||
        old.drawing != drawing ||
        old.currentPath != currentPath;
  }
}
