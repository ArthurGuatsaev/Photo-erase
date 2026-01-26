import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:toastification/toastification.dart';
import '../../features/widgets/pop/custom_toast.dart';
import '../../main.dart';
import 'ui_message_service.dart';

@LazySingleton(as: UIMessageService)
class UIMessageServiceImpl implements UIMessageService {
  BuildContext? get _context => appRouter.navigatorKey.currentContext;

  @override
  Future<void> hideToast() async {
    toastification.dismissAll(delayForAnimation: true);
  }

  @override
  Future<void> showToast({
    IconData? iconData,
    Widget? icon,
    String? text,
    Widget? content,
    VoidCallback? onTap,
  }) async {
    final ctx = _context;
    if (ctx == null) return;

    Widget? builtContent = content;

    if (builtContent == null && text != null) {
      builtContent = Text(text, maxLines: 2, overflow: TextOverflow.ellipsis);
    }

    if (builtContent == null) return;

    // hideToast();
    ToastificationItem? item;

    item = toastification.show(
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
      autoCloseDuration: Duration(seconds: 2),
      dragToClose: true,
      closeOnClick: true,
      borderSide: BorderSide(color: Colors.transparent),
      boxShadow: [
        BoxShadow(
          color: Color(0x19000000),
          blurRadius: 4,
          offset: Offset(0, 4),
          spreadRadius: 0,
        ),
      ],
      backgroundColor: Colors.transparent,
      // foregroundColor: AppColors.titleColorReverse,
      padding: EdgeInsets.zero,
      animationDuration: Duration(milliseconds: 300),
      showIcon: false,
      closeButton: const ToastCloseButton(showType: CloseButtonShowType.none),
      primaryColor: Colors.transparent,
    );
  }
}
