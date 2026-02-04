import 'package:flutter/material.dart';

abstract class UIMessageService {
  Future<void> hideToast();
  Future<void> showToast({
    String? text,
    IconData? iconData,
    Widget? icon,
    Widget? content,
    VoidCallback? onTap,
  });
  Future<T?> showAppDialog<T>({required Widget child});

  Future<T?> showAppSheet<T>(
    Widget child, {
    bool isDismissible = true,
    String? name,
  });
}
