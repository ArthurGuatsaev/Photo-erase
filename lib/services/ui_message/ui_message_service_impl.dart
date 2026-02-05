import 'dart:async';
import 'package:erasica/main.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:toastification/toastification.dart';
import '../../core/theme/app_theme.dart';
import '../../features/widgets/pop/toast.dart';
import 'ui_message_service.dart';

@LazySingleton(as: UIMessageService)
class UIMessageServiceImpl implements UIMessageService {
  BuildContext? get context => appRouter.navigatorKey.currentContext;
  @override
  Future<void> hideToast() async {
    toastification.dismissAll(delayForAnimation: true);
  }

  @override
  Future<void> showToast({
    String? text,
    IconData? iconData,
    Widget? icon,
    Widget? content,
    VoidCallback? onTap,
  }) async {
    final ctx = context;
    if (ctx == null) return;
    Widget? builtContent = content;
    if (builtContent == null && text != null) {
      builtContent = Text(text, maxLines: 2, overflow: TextOverflow.ellipsis);
    }
    if (builtContent == null) return;
    toastification.show(
      context: ctx,
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      title: CustomToast(
        content: builtContent,
        icon: icon,
        iconData: iconData,
        onTap: onTap,
      ),
      alignment: Alignment.topCenter,
      showProgressBar: false,
      autoCloseDuration: const Duration(seconds: 2),
      dragToClose: true,
      closeOnClick: true,
      borderSide: const BorderSide(color: Colors.transparent),
      boxShadow: [
        const BoxShadow(
          color: Color(0x19000000),
          blurRadius: 4,
          offset: Offset(0, 4),
          spreadRadius: 0,
        ),
      ],
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.zero,
      animationDuration: const Duration(milliseconds: 300),
      showIcon: false,
      closeButton: const ToastCloseButton(showType: CloseButtonShowType.none),
      primaryColor: Colors.transparent,
    );
  }

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
      useSafeArea: true,
      backgroundColor: ctx.color.background,
      isScrollControlled: true,
      context: ctx,
      builder: (context) => ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        child: child,
      ),
    );
  }
}
