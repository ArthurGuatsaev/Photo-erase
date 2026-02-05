import 'package:auto_route/auto_route.dart';
import 'package:erasica/entities/photo/photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/canvas/canvas_bloc.dart';
import 'widgets/before_canvas_ready.dart';
import 'widgets/bg/bg_layer.dart';
import 'widgets/erase_page_wrapper.dart';
import 'widgets/result_action_btn.dart';

@RoutePage()
class EraseBgPage extends StatelessWidget {
  const EraseBgPage({super.key, required this.photo});
  final Photo photo;
  @override
  Widget build(BuildContext context) {
    final image = photo.photoPath;
    return ErasePageWrapper(
      photo: photo,
      action: const ResultActionBtn(),
      body: BlocBuilder<CanvasBloc, CanvasState>(
        builder: (context, state) {
          if (state is CanvasReady) {
            return BgLayer(convasSize: state.canvasSize, image: image);
          }
          return BeforeCanvasReady(image: image);
        },
      ),
    );
  }
}
