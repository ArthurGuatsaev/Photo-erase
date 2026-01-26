import 'dart:io';
import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({
    super.key,
    required this.path,
    this.borderRadiusValue,
    this.child,
  });
  final String path;
  final double? borderRadiusValue;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusValue ?? 12),
        image: DecorationImage(
          image: Image.file(
            File(path),
            errorBuilder: (context, error, stackTrace) =>
                Container(color: Colors.amber),
          ).image,

          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
