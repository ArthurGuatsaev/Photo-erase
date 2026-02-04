import 'package:flutter/material.dart';

class AdaptiveLoading extends StatelessWidget {
  const AdaptiveLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(backgroundColor: Colors.white),
    );
  }
}
