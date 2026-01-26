import 'package:flutter/material.dart';

class BottomWrapper extends StatelessWidget {
  const BottomWrapper({super.key, required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          spacing: 20,
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}
