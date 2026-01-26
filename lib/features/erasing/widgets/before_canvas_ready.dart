import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/theme/app_theme.dart';
import '../blocs/canvas/canvas_bloc.dart';

class BeforeCanvasReady extends StatelessWidget {
  const BeforeCanvasReady({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.appWidget.data.pagePadding,
      child: LayoutBuilder(
        builder: (_, cnstr) => EmptyCanvas(constraints: cnstr, image: image),
      ),
    );
  }
}

class EmptyCanvas extends StatefulWidget {
  final BoxConstraints constraints;
  final String image;
  const EmptyCanvas({
    super.key,
    required this.constraints,
    required this.image,
  });

  @override
  State<EmptyCanvas> createState() => _EmptyCanvasState();
}

class _EmptyCanvasState extends State<EmptyCanvas> {
  @override
  void initState() {
    context.read<CanvasBloc>().add(
      CreateBackgroundFrame(
        image: widget.image,
        constraints: widget.constraints,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: const CircularProgressIndicator.adaptive());
  }
}
