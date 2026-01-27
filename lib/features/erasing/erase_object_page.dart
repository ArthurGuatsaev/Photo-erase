import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../entities/photo/photo.dart';
import 'blocs/canvas/canvas_bloc.dart';
import 'widgets/before_canvas_ready.dart';
import 'widgets/bg/widgets/bg_action_btn.dart';
import 'widgets/erase_page_wrapper.dart';
import 'widgets/object/object_layer.dart';

@RoutePage()
class EraseObjPage extends StatelessWidget {
  const EraseObjPage({super.key, required this.photo});
  final Photo photo;
  @override
  Widget build(BuildContext context) {
    final image = photo.photoPath;
    return ErasePageWrapper(
      photo: photo,
      action: BgActionBtn(),
      body: BlocBuilder<CanvasBloc, CanvasState>(
        builder: (context, state) {
          if (state is CanvasReady) {
            return ObjectLayer(
              frame: state.frame,
              image: image,
              canvasSize: state.canvasSize,
            );
          }
          return BeforeCanvasReady(image: image);
        },
      ),
    );
  }
}
