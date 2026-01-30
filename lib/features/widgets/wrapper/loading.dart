import 'dart:ui';
import 'package:flutter/material.dart';

class LoadingWrapper extends StatelessWidget {
  const LoadingWrapper({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}
