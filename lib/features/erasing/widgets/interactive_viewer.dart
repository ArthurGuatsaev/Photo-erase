import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'foreground_image.dart';
import 'object/mask_cubit/mask_cubit.dart';

class ZoomViewerWrapper extends StatefulWidget {
  const ZoomViewerWrapper({
    super.key,
    required this.canvasSize,
    this.layer,
    required this.imagePath,
    this.layerFoerground,
  });
  final Size canvasSize;
  final Widget? layer;
  final Widget? layerFoerground;
  final String imagePath;

  @override
  State<ZoomViewerWrapper> createState() => _ZoomViewerWrapperState();
}

class _ZoomViewerWrapperState extends State<ZoomViewerWrapper> {
  late final TransformationController _transform = TransformationController();
  @override
  void dispose() {
    _transform.dispose();
    super.dispose();
  }

  void _resetZoom() {
    _transform.value = Matrix4.identity();
    context.read<MaskCubit>().zooming(1);
  }

  void _onInteractionUpdate(ScaleUpdateDetails details) {
    if (details.pointerCount == 2) {
      context.read<MaskCubit>().onPanCancel();
      context.read<MaskCubit>().zooming(details.scale.clamp(1, 6));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onDoubleTap: _resetZoom,
        child: InteractiveViewer(
          transformationController: _transform,
          panEnabled: false,
          scaleEnabled: true,
          onInteractionUpdate: _onInteractionUpdate,
          minScale: 1.0,
          maxScale: 6.0,
          boundaryMargin: const EdgeInsets.all(200),
          clipBehavior: Clip.none,
          child: Padding(
            padding: context.appWidget.data.pagePadding,
            child: Center(
              child: SizedBox(
                width: widget.canvasSize.width,
                height: widget.canvasSize.height,
                child: Stack(
                  children: [
                    if (widget.layer != null)
                      Positioned.fill(child: widget.layer!),
                    ForegroundImage(widget: widget),
                    if (widget.layerFoerground != null)
                      Positioned.fill(child: widget.layerFoerground!),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
