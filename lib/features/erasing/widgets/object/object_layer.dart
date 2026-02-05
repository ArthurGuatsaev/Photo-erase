import 'dart:ui';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import '../../blocs/erase/erase_bloc.dart';
import '../interactive_viewer.dart';
import '/features/widgets/wrapper/bottom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'mask_cubit/mask_cubit.dart';
import 'widget/erase_button.dart';
import 'widget/mask.dart';
import 'widget/thickness_box.dart';
import 'widget/undoredo_box.dart';

class ObjectLayer extends StatefulWidget {
  const ObjectLayer({
    super.key,
    required this.frame,
    required this.image,
    required this.canvasSize,
  });

  final FrameInfo frame;
  final String image;
  final Size canvasSize;

  @override
  State<ObjectLayer> createState() => _ObjectLayerState();
}

class _ObjectLayerState extends State<ObjectLayer> {
  late final MaskCubit maskCubit = MaskCubit(
    frame: widget.frame,
    canvasSize: widget.canvasSize,
  );
  @override
  Widget build(BuildContext context) {
    final eraseBloc = context.read<EraseBloc>();
    return BlocProvider(
      create: (_) => maskCubit,
      child: Column(
        children: [
          ZoomViewerWrapper(
            canvasSize: widget.canvasSize,
            imagePath: widget.image,
            reset: () => maskCubit.zooming(1),
            onInteractionUpdate: (details) {
              maskCubit.onPanCancel();
              maskCubit.zooming(details.scale.clamp(1, 6));
            },
            layerFoerground: DrawingMaskBoard(maskColor: context.color.mask),
          ),
          Padding(
            padding: context.appWidget.data.pagePadding,
            child: BottomWrapper(
              children: [
                const UndoRedoBox(),
                const ThicknessBox(),
                MaskEraseButton(maskCubit: maskCubit, eraseBloc: eraseBloc),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
