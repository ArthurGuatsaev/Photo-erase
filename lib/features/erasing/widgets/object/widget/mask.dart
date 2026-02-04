import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../mask_cubit/mask_cubit.dart';
import 'painter.dart';

class DrawingMaskBoard extends StatefulWidget {
  const DrawingMaskBoard({
    super.key,
    required this.maskColor,
    this.gesturesEnabled = true,
  });

  final Color maskColor;
  final bool gesturesEnabled;

  @override
  State<DrawingMaskBoard> createState() => _DrawingMaskBoardState();
}

class _DrawingMaskBoardState extends State<DrawingMaskBoard> {
  late final MaskCubit maskCubit = context.read<MaskCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaskCubit, MaskState>(
      builder: (context, state) {
        return RepaintBoundary(
          child: Listener(
            behavior: HitTestBehavior.opaque,
            onPointerDown: maskCubit.onPointerDown,
            onPointerMove: maskCubit.onPointerMove,
            onPointerUp: maskCubit.onPointerUp,
            onPointerCancel: maskCubit.onPointerCancel,
            child: CustomPaint(
              painter: EraseMaskPainter(
                strokes: state.strokes,
                currentStroke: state.currentStroke,
                brushSize: state.lineSize,
                color: widget.maskColor,
                drawing: state.isDrawing,
                currentPath: state.currentPath,
                scale: state.scale,
              ),
            ),
          ),
        );
      },
    );
  }
}
