import '../interactive_viewer.dart';
import '/features/erasing/widgets/bg/bg_cubit/bg_cubit.dart';
import '/features/erasing/widgets/bg/widgets/reset_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/wrapper/bottom.dart';
import 'widgets/bg_items_box.dart';
import 'widgets/bg_shower.dart';

class BgLayer extends StatelessWidget {
  const BgLayer({super.key, required this.image, required this.convasSize});
  final String image;
  final Size convasSize;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BgCubit(),
      child: Column(
        children: [
          ZoomViewerWrapper(
            canvasSize: convasSize,
            imagePath: image,
            layer: BgShower(),
          ),
          BottomWrapper(children: [BgResetBtn(), BgItemsBox()]),
        ],
      ),
    );
  }
}
