import 'package:flutter/material.dart';
import '../pop/sheet_handle.dart';
import '../wrapper/loading.dart';

class LoadingWithSheet extends StatefulWidget {
  const LoadingWithSheet({super.key, required this.content});
  final Widget content;

  @override
  State<LoadingWithSheet> createState() => _LoadingWithSheetState();
}

class _LoadingWithSheetState extends State<LoadingWithSheet> {
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
    return const LoadingWrapper();
  }
}
