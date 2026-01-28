import 'dart:ui';
import 'package:flutter/cupertino.dart';

import '../interactive_viewer.dart';
import '/features/widgets/wrapper/bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/buttons/main_button.dart';
import 'mask_cubit/mask_cubit.dart';
import 'widget/mask.dart';
import 'widget/thickness_box.dart';
import 'widget/undoredo_box.dart';

class ObjectLayer extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MaskCubit(frame: frame, canvasSize: canvasSize),
      child: Column(
        children: [
          ZoomViewerWrapper(
            canvasSize: canvasSize,
            imagePath: image,
            layerFoerground: DrawingMaskBoard(maskColor: Colors.blue),
          ),
          BottomWrapper(
            children: [
              UndoRedoBox(),
              ThicknessBox(),
              MainButton(
                icon: CupertinoIcons.ear,
                title: 'Erase',
              ), //TODO CHANGE ICON
            ],
          ),
        ],
      ),
    );
  }
}
