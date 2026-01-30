import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/erase/erase_bloc.dart';
import 'interactive_viewer.dart';

class ForegroundImage extends StatelessWidget {
  const ForegroundImage({super.key, required this.widget});

  final ZoomViewerWrapper widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EraseBloc, EraseState>(
      buildWhen: (previous, current) => current is! EraseObjLoading,
      builder: (context, state) {
        imageCache.clear();
        imageCache.clearLiveImages();
        return Positioned.fill(
          child: Image.file(
            key: UniqueKey(),
            File(state.image),
            fit: BoxFit.contain,
          ),
        );
      },
    );
  }
}
