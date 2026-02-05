import 'package:erasica/core/di/di.dart';

import '../interactive_viewer.dart';
import '/features/erasing/widgets/bg/bg_cubit/bg_cubit.dart';
import '/features/erasing/widgets/bg/widgets/reset_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../widgets/wrapper/bottom.dart';
import 'widgets/bg_items_box.dart';
import 'widgets/bg_loading.dart';
import 'widgets/bg_shower.dart';

class BgLayer extends StatefulWidget {
  const BgLayer({super.key, required this.image, required this.convasSize});
  final String image;
  final Size convasSize;

  @override
  State<BgLayer> createState() => _BgLayerState();
}

class _BgLayerState extends State<BgLayer> {
  final bgCubit = getIt<BgCubit>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bgCubit,
      child: Column(
        children: [
          ZoomViewerWrapper(
            canvasSize: widget.convasSize,
            imagePath: widget.image,
            layer: const BgShower(),
            layerFoerground: const BgLoading(),
          ),
          const BottomWrapper(children: [BgResetBtn(), BgItemsBox()]),
        ],
      ),
    );
  }
}
