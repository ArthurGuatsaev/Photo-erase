import 'package:flutter/material.dart';

abstract class UIMessageService {
  Future<T?> showAppDialog<T>({required Widget child});
  Future<T?> showAppSheet<T>(
    Widget child, {
    bool isDismissible = true,
    String? name,
  });
}
