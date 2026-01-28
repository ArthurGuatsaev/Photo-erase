import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

Future showAppSheet(
  BuildContext context,
  Widget child, {
  bool isDismissible = true,
  String? name,
}) async {
  return showModalBottomSheet(
    routeSettings: RouteSettings(name: name),
    isDismissible: isDismissible,
    enableDrag: isDismissible,
    backgroundColor: context.color.background,
    isScrollControlled: true,
    // useRootNavigator: true,
    context: context,
    builder: (context) => ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32),
        topRight: Radius.circular(32),
      ),
      child: child,
    ),
  );
}
