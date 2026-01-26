import 'dart:math';

import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class TunnelStepWrapper extends StatelessWidget {
  const TunnelStepWrapper({
    super.key,
    required this.icon,
    required this.child,
    required this.linesRotate,
  });

  final IconData icon;
  final Widget child;
  final double linesRotate;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _CirclesWrapper(
          linesRotate: linesRotate,
          child: Icon(icon, size: 52.h, color: Colors.white),
        ),
        Expanded(child: child),
      ],
    );
  }
}

class _CirclesWrapper extends StatelessWidget {
  const _CirclesWrapper({required this.child, required this.linesRotate});
  final Widget child;
  final double linesRotate;
  @override
  Widget build(BuildContext context) {
    final padding = 25.0;
    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.white.withValues(alpha: 0.1),
        Colors.white.withValues(alpha: 0.015),
        Colors.white.withValues(alpha: 0),
      ],
    );
    final decoration = BoxDecoration(
      border: GradientBoxBorder(gradient: gradient, width: 1.5),
      shape: BoxShape.circle,
    );
    return Container(
      decoration: decoration,
      padding: EdgeInsets.all(padding),
      child: Container(
        decoration: decoration,
        padding: EdgeInsets.all(padding),
        child: Stack(
          children: [
            Container(
              width: 108.w,
              height: 108.h,
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                gradient: context.gradient.continueBtn,
                shape: CircleBorder(),
              ),
              child: child,
            ),
            Transform.rotate(
              angle: linesRotate,
              child: CustomPaint(
                painter: _TunnelIconLines(),
                size: Size(108.w, 108.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TunnelIconLines extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..strokeCap = StrokeCap.round;

    final radius = size.width / 4;
    final rect = Rect.fromCircle(
      center: Offset(size.width - radius, size.height - radius),
      radius: radius,
    );

    canvas.drawArc(rect, pi / 2, -pi / 2, false, paint);

    final angle70 = 125 * pi / 180;
    final lineLength = size.width / 3;

    final startOffset = Offset(size.width * 0.1, size.height * 0.1);

    final endOffset = Offset(
      startOffset.dx + lineLength * cos(angle70),
      startOffset.dy + lineLength * sin(angle70),
    );
    canvas.drawLine(startOffset, endOffset, paint);
  }

  @override
  bool shouldRepaint(_TunnelIconLines oldDelegate) => false;
}
