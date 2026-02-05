import 'dart:ui' as ui;
import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/widgets/wrapper/glass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import '../../widgets/pop_up_content/pop_up_context_menu.dart';

//TODO поправить высоту полета
class LongPressContextMenu extends StatefulWidget {
  final Widget child;
  final List<IOSContextMenuAction> actions;

  const LongPressContextMenu({
    super.key,
    required this.child,
    required this.actions,
  });

  @override
  State<LongPressContextMenu> createState() => _LongPressContextMenuState();
}

class _LongPressContextMenuState extends State<LongPressContextMenu>
    with SingleTickerProviderStateMixin {
  final GlobalKey _boundaryKey = GlobalKey();

  OverlayEntry? _entry;
  bool _overlayVisible = false;
  ui.Image? _currentImage;

  late final AnimationController _pressCtrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 110),
    reverseDuration: const Duration(milliseconds: 120),
  );

  late final Animation<double> _pressScale = Tween<double>(
    begin: 1.0,
    end: 0.96,
  ).animate(CurvedAnimation(parent: _pressCtrl, curve: Curves.easeOutCubic));

  @override
  void dispose() {
    _removeOverlay(immediately: true);
    _pressCtrl.dispose();
    _disposeImage();
    super.dispose();
  }

  void _disposeImage() {
    final img = _currentImage;
    _currentImage = null;
    img?.dispose();
  }

  Future<void> _onTap() async {
    if (_overlayVisible) return;
    if (_pressCtrl.status != AnimationStatus.completed) {
      await _pressCtrl.forward();
    }
    HapticFeedback.mediumImpact();
    final boundaryContext = _boundaryKey.currentContext;
    if (boundaryContext == null) {
      await _pressCtrl.reverse();
      return;
    }

    final ro = boundaryContext.findRenderObject();
    if (ro is! RenderRepaintBoundary) {
      await _pressCtrl.reverse();
      return;
    }
    await WidgetsBinding.instance.endOfFrame;
    ui.Image image;
    try {
      final pixelRatio = MediaQuery.devicePixelRatioOf(context);
      image = await ro.toImage(pixelRatio: pixelRatio);
    } catch (_) {
      await _pressCtrl.reverse();
      return;
    }
    final box = boundaryContext.findRenderObject() as RenderBox;
    final topLeft = box.localToGlobal(Offset.zero);
    final startRect = topLeft & box.size;

    if (!mounted) {
      image.dispose();
      return;
    }

    _disposeImage();
    _currentImage = image;
    _showOverlay(image: image, startRect: startRect);
    await _pressCtrl.reverse();
  }

  void _showOverlay({required ui.Image image, required Rect startRect}) {
    final overlay = Overlay.of(context, rootOverlay: true);
    final media = MediaQuery.of(context);
    final size = media.size;
    final padding = media.padding;
    final safeTop = padding.top + 12;
    final safeBottom = size.height - padding.bottom - 12;
    final previewW = startRect.width;
    final previewH = startRect.height;
    const itemH = 48.0;
    final menuH = widget.actions.length * itemH + 12.0;
    const gap = 12.0;
    final preferBelow = startRect.center.dy < size.height * 0.55;
    final targetLeft = ((size.width - previewW) / 2).clamp(
      12.0,
      size.width - previewW - 12.0,
    );

    double targetTop;
    if (preferBelow) {
      final maxTop = safeBottom - previewH - menuH - gap;
      targetTop = (safeTop + 64).clamp(safeTop, maxTop);
    } else {
      final minTop = safeTop + menuH + gap;
      targetTop = (safeBottom - previewH - 24).clamp(
        minTop,
        safeBottom - previewH,
      );
    }
    final endRect = Rect.fromLTWH(targetLeft, targetTop, previewW, previewH);
    _overlayVisible = true;
    setState(() {});
    _entry = OverlayEntry(
      builder: (_) => _IOSContextMenuOverlay(
        startRect: startRect,
        endRect: endRect,
        previewImage: image,
        previewBorderRadius: const BorderRadius.all(Radius.circular(14)),
        actions: widget.actions,
        preferMenuBelow: preferBelow,
        onDismiss: () => _removeOverlay(immediately: false),
      ),
    );

    overlay.insert(_entry!);
  }

  void _removeOverlay({required bool immediately}) {
    final entry = _entry;
    if (entry == null) return;
    entry.remove();
    _entry = null;
    _overlayVisible = false;
    if (mounted) setState(() {});
    _disposeImage();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onLongPress: _onTap,
      child: Opacity(
        opacity: _overlayVisible ? 0.0 : 1.0,
        child: RepaintBoundary(
          key: _boundaryKey,
          child: ScaleTransition(scale: _pressScale, child: widget.child),
        ),
      ),
    );
  }
}

class _IOSContextMenuOverlay extends StatefulWidget {
  final Rect startRect;
  final Rect endRect;
  final ui.Image previewImage;
  final BorderRadius previewBorderRadius;
  final List<IOSContextMenuAction> actions;
  final bool preferMenuBelow;
  final VoidCallback onDismiss;

  const _IOSContextMenuOverlay({
    required this.startRect,
    required this.endRect,
    required this.previewImage,
    required this.previewBorderRadius,
    required this.actions,
    required this.preferMenuBelow,
    required this.onDismiss,
  });

  @override
  State<_IOSContextMenuOverlay> createState() => _IOSContextMenuOverlayState();
}

class _IOSContextMenuOverlayState extends State<_IOSContextMenuOverlay>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 260),
    reverseDuration: const Duration(milliseconds: 200),
  );

  // late final Animation<double> _backdrop = CurvedAnimation(
  //   parent: _ctrl,
  //   curve: Curves.easeOut,
  // );

  late final Animation<Rect?> _rect = RectTween(
    begin: widget.startRect,
    end: widget.endRect,
  ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

  late final Animation<double> _scale = Tween<double>(
    begin: 0.8,
    end: 1.05,
  ).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));

  late final Animation<double> _menuOpacity = CurvedAnimation(
    parent: _ctrl,
    curve: const Interval(0.22, 1.0, curve: Curves.easeOut),
  );

  late final Animation<double> _menuSlide = Tween<double>(begin: 8, end: 0)
      .animate(
        CurvedAnimation(
          parent: _ctrl,
          curve: const Interval(0.22, 1.0, curve: Curves.easeOutCubic),
        ),
      );

  bool _closing = false;

  @override
  void initState() {
    super.initState();
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Future<void> _close() async {
    if (_closing) return;
    _closing = true;
    await _ctrl.reverse();
    if (mounted) widget.onDismiss();
  }

  double _menuHeight() => widget.actions.length * 48.0 + 12.0;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final size = media.size;
    final padding = media.padding;

    return Material(
      type: MaterialType.transparency,
      child: AnimatedBuilder(
        animation: _ctrl,
        builder: (context, _) {
          final rect = _rect.value ?? widget.endRect;
          final menuW = (size.width - 32).clamp(220.0, 250.0);
          final menuH = _menuHeight();
          final safeTop = padding.top + 60;
          final safeBottom = size.height - padding.bottom - 12;
          bool showBelow = widget.preferMenuBelow;
          final belowTop = rect.bottom + 12;
          final aboveTop = rect.top - 12 - menuH;
          if (showBelow && (belowTop + menuH > safeBottom)) showBelow = false;
          if (!showBelow && (aboveTop < safeTop)) showBelow = true;
          final menuTop = showBelow ? belowTop : aboveTop;
          final menuLeft = ((size.width - menuW) / 2).clamp(
            16.0,
            size.width - menuW - 16.0,
          );

          return Stack(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _close,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.1),
                      ),
                    ),
                    const SizedBox.expand(),
                  ],
                ),
              ),

              Positioned.fromRect(
                rect: rect,
                child: Transform.scale(
                  scale: _scale.value,
                  child: _PreviewCard(
                    image: widget.previewImage,
                    borderRadius: widget.previewBorderRadius,
                  ),
                ),
              ),

              Positioned(
                left: menuLeft,
                top: menuTop + _menuSlide.value,
                width: menuW,
                child: GlassWrapper(
                  borderRadius: 30,
                  data: context.glass.box.copyWith(
                    bcgOpacity: 0.3,
                    lightIntensity: 0.5,
                  ),
                  child: Opacity(
                    opacity: _menuOpacity.value,
                    child: ContextMenuBox(
                      actions: widget.actions,
                      onActionTap: (action) async {
                        await _close();
                        action.onPressed();
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _PreviewCard extends StatelessWidget {
  final ui.Image image;
  final BorderRadius borderRadius;

  const _PreviewCard({required this.image, required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 18,
      borderRadius: borderRadius,
      clipBehavior: Clip.antiAlias,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: RawImage(image: image, fit: BoxFit.fill),
      ),
    );
  }
}
