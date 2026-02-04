import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CloseButtonWidget extends StatelessWidget {
  const CloseButtonWidget({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IconButton(
        onPressed: onClose,
        icon: Icon(
          CupertinoIcons.xmark,
          color: Colors.white.withValues(alpha: 0.2),
          size: 24,
        ),
      ),
    );
  }
}
