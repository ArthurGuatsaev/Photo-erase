import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import 'erase_empty_canvas.dart';

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
