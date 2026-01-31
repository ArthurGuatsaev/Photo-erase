import 'dart:async';
import 'package:erasica/main.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../core/theme/app_theme.dart';
import 'ui_message_service.dart';

@LazySingleton(as: UIMessageService)
class UIMessageServiceImpl implements UIMessageService {
  BuildContext? get context => appRouter.navigatorKey.currentContext;

  @override
  Future<T?> showAppDialog<T>({required Widget child}) async {
    final ctx = context;
    if (ctx == null) return null;
    return showDialog<T>(
      context: ctx,
      builder: (dialogContext) {
        return child;
      },
    );
  }

  @override
  Future<T?> showAppSheet<T>(
    Widget child, {
    bool isDismissible = true,
    String? name,
  }) async {
    final ctx = context;
    if (ctx == null) return null;
    return showModalBottomSheet<T>(
      routeSettings: RouteSettings(name: name),
      isDismissible: isDismissible,
      enableDrag: isDismissible,
      backgroundColor: ctx.color.background,
      isScrollControlled: true,
      context: ctx,
      builder: (context) => ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        child: child,
      ),
    );
  }
}
