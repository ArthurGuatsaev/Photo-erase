import 'package:flutter/material.dart';
import 'package:erasica/core/theme/app_theme.dart';

class AppSheetHandle<T> {
  Route<dynamic>? _route;
  NavigatorState? _nav;
  bool _attached = false;
  bool _closed = false;

  bool _pendingClose = false;
  T? _pendingResult;

  late final Future<T?> closed;

  void _attachFrom(BuildContext sheetContext) {
    if (_attached) return;
    _attached = true;

    final r = ModalRoute.of(sheetContext);
    if (r != null) {
      _route = r;
      _nav = r.navigator;
    }

    if (_pendingClose) {
      final res = _pendingResult;
      _pendingClose = false;
      _pendingResult = null;
      close(res);
    }
  }

  void close([T? result]) {
    if (_closed) return;

    final nav = _nav;
    final route = _route;

    if (nav == null || route == null) {
      _pendingClose = true;
      _pendingResult = result;
      return;
    }

    _closed = true;
    if (route.isCurrent) {
      if (nav.canPop()) nav.pop(result);
      return;
    }

    if (route.isActive) {
      nav.removeRoute(route);
    }
  }
}

AppSheetHandle<T> showAppSheetHandle<T>(
  BuildContext context,
  Widget child, {
  bool isDismissible = true,
  String? name,
  bool useRootNavigator = true,
}) {
  final handle = AppSheetHandle<T>();

  final future = showModalBottomSheet<T>(
    routeSettings: RouteSettings(name: name),
    isDismissible: isDismissible,
    enableDrag: isDismissible,
    backgroundColor: context.color.background,
    isScrollControlled: true,
    useRootNavigator: useRootNavigator,
    context: context,
    builder: (sheetCtx) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        handle._attachFrom(sheetCtx);
      });

      return ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        child: child,
      );
    },
  );

  handle.closed = future;
  return handle;
}
