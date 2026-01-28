import 'dart:ui';
import 'package:erasica/main.dart';
import 'package:flutter/material.dart';

import '../pop/sheet.dart';
import '../pop/sheet_handle.dart';

class LoadingWrapper extends StatefulWidget {
  const LoadingWrapper({super.key, required this.content});
  final Widget content;

  @override
  State<LoadingWrapper> createState() => _LoadingWrapperState();
}

class _LoadingWrapperState extends State<LoadingWrapper> {
  AppSheetHandle? _sheet;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _sheet = showAppSheetHandle(
        context,
        widget.content,
        isDismissible: false,
        name: 'dialog',
        useRootNavigator: true,
      );
    });
  }

  @override
  void dispose() {
    _sheet?.close();
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
