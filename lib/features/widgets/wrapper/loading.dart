import 'dart:ui';

import 'package:erasica/main.dart';
import 'package:flutter/material.dart';

import '../pop/sheet.dart';

class LoadingWrapper extends StatefulWidget {
  const LoadingWrapper({super.key, required this.content});
  final Widget content;

  @override
  State<LoadingWrapper> createState() => _LoadingWrapperState();
}

class _LoadingWrapperState extends State<LoadingWrapper> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showModal();
    });
    super.initState();
  }

  showModal() {
    showAppSheet(context, widget.content, isDismissible: false);
  }

  @override
  void dispose() {
    appRouter.maybePop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ],
      ),
    );
  }
}
