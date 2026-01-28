import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/canvas/canvas_bloc.dart';

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
