import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../wrapper/glass.dart';

class AnchorMenu extends StatefulWidget {
  const AnchorMenu({
    super.key,
    required this.child,
    required this.menuBuilder,
    this.minEdgePadding = 8.0,
    this.maxWidth = 250.0,
    this.useLongPress = false,
    this.forceLeftAlign = false,
    this.triggerHapticOnOpen = true,
    this.onMenuOpen,
    this.onMenuClose,
  });

  final Widget child;

  /// Минимальный отступ от краёв экрана.
  /// Внутри оверлея дополнительно учитывается safe area (viewPadding).
  final double minEdgePadding;

  final double maxWidth;

  /// Если true — открываем меню по long press. Если false — по обычному tap.
  final bool useLongPress;

  /// Если true — меню будет стараться выравниваться по левому краю якоря.
  final bool forceLeftAlign;

  final bool triggerHapticOnOpen;

  /// Строим меню. close() обязателен: он закрывает диалог.
  final Widget Function(VoidCallback close) menuBuilder;

  final VoidCallback? onMenuOpen;
  final VoidCallback? onMenuClose;

  // =========================
  // Настройки поведения/анимаций (всё в одном месте)
  // =========================

  /// Длительность анимации реакции на нажатие у триггера.
  static const Duration pressAnimationDuration = Duration(milliseconds: 480);

  /// Через сколько после старта "нажатия" начинаем показывать меню.
  static const Duration menuShowDelay = Duration(milliseconds: 150);

  /// Длительность появления/скрытия меню.
  /// Сейчас не используется (по требованию: без анимации появления меню),
  /// оставлена как константа, чтобы не ломать твою конфигурацию.
  static const Duration menuTransitionDuration = Duration(milliseconds: 80);

  /// Минимальный масштаб триггера в фазе "нажатия".
  static const double pressScaleMin = 0.90;

  /// Небольшой "перелёт" масштаба для эффекта bounce.
  static const double pressScaleOvershoot = 1.15;

  /// Вертикальный сдвиг триггера во время анимации нажатия.
  static const double pressLiftUp = -2.0;
  static const double pressLiftDown = 1.0;

  /// Кривая для анимации нажатия.
  static const Curve pressCurve = Curves.easeOutCubic;

  @override
  State<AnchorMenu> createState() => _AnchorMenuState();
}

class _AnchorMenuState extends State<AnchorMenu> with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  final GlobalKey _anchorKey = GlobalKey();

  bool _menuIsOpen = false;

  /// Токен нужен, чтобы отменять "отложенное открытие", если пользователь
  /// успел повторно взаимодействовать до окончания задержки menuShowDelay.
  int _openAttemptToken = 0;

  late final AnimationController _pressController = AnimationController(
    vsync: this,
    duration: AnchorMenu.pressAnimationDuration,
  );

  late final Animation<double> _pressScale = TweenSequence<double>([
    TweenSequenceItem(
      tween: Tween<double>(
        begin: 1.0,
        end: AnchorMenu.pressScaleMin,
      ).chain(CurveTween(curve: AnchorMenu.pressCurve)),
      weight: 45,
    ),
    TweenSequenceItem(
      tween: Tween<double>(
        begin: AnchorMenu.pressScaleMin,
        end: AnchorMenu.pressScaleOvershoot,
      ).chain(CurveTween(curve: AnchorMenu.pressCurve)),
      weight: 35,
    ),
    TweenSequenceItem(
      tween: Tween<double>(
        begin: AnchorMenu.pressScaleOvershoot,
        end: 1.0,
      ).chain(CurveTween(curve: AnchorMenu.pressCurve)),
      weight: 20,
    ),
  ]).animate(_pressController);

  late final Animation<Offset> _pressOffset = TweenSequence<Offset>([
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: Offset.zero,
        end: const Offset(0, AnchorMenu.pressLiftUp),
      ).chain(CurveTween(curve: AnchorMenu.pressCurve)),
      weight: 45,
    ),
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: const Offset(0, AnchorMenu.pressLiftUp),
        end: const Offset(0, AnchorMenu.pressLiftDown),
      ).chain(CurveTween(curve: AnchorMenu.pressCurve)),
      weight: 35,
    ),
    TweenSequenceItem(
      tween: Tween<Offset>(
        begin: const Offset(0, AnchorMenu.pressLiftDown),
        end: Offset.zero,
      ).chain(CurveTween(curve: AnchorMenu.pressCurve)),
      weight: 20,
    ),
  ]).animate(_pressController);

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  Future<void> _closeMenuIfOpen() async {
    if (!_menuIsOpen) return;

    final navigator = Navigator.of(context);
    if (navigator.canPop()) navigator.pop();
  }

  Future<void> _showMenuDialog() async {
    _menuIsOpen = true;
    widget.onMenuOpen?.call();

    try {
      /// useRootNavigator=false важно для Provider/Bloc:
      /// диалог открывается в текущем Navigator/Route, поэтому menuBuilder
      /// видит тот же scope провайдеров, что и экран.
      await showGeneralDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(
          context,
        ).modalBarrierDismissLabel,
        barrierColor: Colors.transparent,
        transitionDuration: Duration.zero,
        pageBuilder: (dialogContext, _, _) {
          return _AnchorMenuOverlay(
            anchorLink: _layerLink,
            anchorKey: _anchorKey,
            minEdgePadding: widget.minEdgePadding,
            maxWidth: widget.maxWidth,
            forceLeftAlign: widget.forceLeftAlign,
            overlayAnchorOnOpen: !widget.useLongPress,
            menu: widget.menuBuilder(() {
              Navigator.of(dialogContext).pop();
            }),
          );
        },
      );
    } finally {
      _menuIsOpen = false;
      widget.onMenuClose?.call();
    }
  }

  Future<void> _handleOpen() async {
    if (_menuIsOpen) {
      await _closeMenuIfOpen();
      return;
    }

    final int myToken = ++_openAttemptToken;

    _pressController.forward(from: 0).whenComplete(() {
      if (mounted) _pressController.value = 0;
    });

    Future.delayed(AnchorMenu.menuShowDelay, () async {
      if (!mounted) return;
      if (myToken != _openAttemptToken) return;
      if (_menuIsOpen) return;

      if (widget.triggerHapticOnOpen) {
        HapticFeedback.selectionClick();
      }

      await _showMenuDialog();
    });
  }

  @override
  Widget build(BuildContext context) {
    final animatedAnchorChild = AnimatedBuilder(
      animation: _pressController,
      builder: (context, child) {
        return Transform.translate(
          offset: _pressOffset.value,
          child: Transform.scale(
            scale: _pressScale.value,
            alignment: Alignment.center,
            child: child,
          ),
        );
      },
      child: widget.child,
    );

    return CompositedTransformTarget(
      link: _layerLink,
      child: KeyedSubtree(
        key: _anchorKey,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: widget.useLongPress ? null : _handleOpen,
          onLongPress: widget.useLongPress ? _handleOpen : null,
          child: animatedAnchorChild,
        ),
      ),
    );
  }
}

class _AnchorMenuOverlay extends StatefulWidget {
  const _AnchorMenuOverlay({
    required this.anchorLink,
    required this.anchorKey,
    required this.minEdgePadding,
    required this.maxWidth,
    required this.menu,
    required this.forceLeftAlign,
    required this.overlayAnchorOnOpen,
  });

  final LayerLink anchorLink;
  final GlobalKey anchorKey;

  final double minEdgePadding;
  final double maxWidth;

  final Widget menu;

  final bool forceLeftAlign;

  /// tap: меню перекрывает триггер (накрывает элемент).
  /// long press: меню примыкает без перекрытия.
  final bool overlayAnchorOnOpen;

  @override
  State<_AnchorMenuOverlay> createState() => _AnchorMenuOverlayState();
}

class _AnchorMenuOverlayState extends State<_AnchorMenuOverlay>
    with WidgetsBindingObserver {
  final ValueNotifier<_MenuPlacement> _placement =
      ValueNotifier<_MenuPlacement>(_MenuPlacement.initial);

  /// Ключ для измерения реального размера уже отрисованного меню.
  final GlobalKey _menuKey = GlobalKey();

  bool _isReadyToShow = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Ждём один кадр, чтобы меню смонтировалось (пусть и невидимое),
    // после чего можно измерить его размер и рассчитать точное положение.
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureAndPlace());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _placement.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _measureAndPlace());
  }

  void _measureAndPlace() {
    if (!mounted) return;

    final RenderBox? anchorBox =
        widget.anchorKey.currentContext?.findRenderObject() as RenderBox?;
    final RenderBox? menuBox =
        _menuKey.currentContext?.findRenderObject() as RenderBox?;

    if (anchorBox == null || menuBox == null) {
      // Если ещё не успели смонтироваться — попробуем на следующем кадре.
      WidgetsBinding.instance.addPostFrameCallback((_) => _measureAndPlace());
      return;
    }

    final Size menuSize = menuBox.size;
    if (menuSize.isEmpty) {
      // Если меню пока имеет нулевой размер (обычно из-за layout внутри),
      // пробуем повторить на следующем кадре.
      WidgetsBinding.instance.addPostFrameCallback((_) => _measureAndPlace());
      return;
    }

    final Rect anchorRect =
        anchorBox.localToGlobal(Offset.zero) & anchorBox.size;

    final mediaQuery = MediaQuery.of(context);
    final safeArea = mediaQuery.viewPadding;

    // Меню не должно заходить под safe area и не должно прилипать к краям экрана.
    final EdgeInsets edgePadding = EdgeInsets.fromLTRB(
      safeArea.left + widget.minEdgePadding,
      safeArea.top + widget.minEdgePadding,
      safeArea.right + widget.minEdgePadding,
      safeArea.bottom + widget.minEdgePadding,
    );

    final nextPlacement = _AnchorMenuPlacementService.compute(
      anchorRect: anchorRect,
      menuSize: menuSize,
      screenSize: mediaQuery.size,
      edgePadding: edgePadding,
      forceLeftAlign: widget.forceLeftAlign,
      overlayAnchorOnOpen: widget.overlayAnchorOnOpen,
    );

    // Важно: показываем меню только после того, как рассчитали placement.
    // Так мы избегаем "прыжков" из initial placement в корректный.
    if (_placement.value != nextPlacement || !_isReadyToShow) {
      setState(() {
        _placement.value = nextPlacement;
        _isReadyToShow = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void close() => Navigator.of(context).pop();

    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: close,
              child: const SizedBox.expand(),
            ),
          ),

          ValueListenableBuilder<_MenuPlacement>(
            valueListenable: _placement,
            builder: (context, placement, _) {
              return CompositedTransformFollower(
                link: widget.anchorLink,
                showWhenUnlinked: false,
                targetAnchor: placement.targetAnchor,
                followerAnchor: placement.followerAnchor,
                offset: Offset(placement.offsetX, placement.offsetY),
                // До измерения меню держим невидимым, но смонтированным,
                // чтобы можно было получить корректный size в _measureAndPlace().
                child: Opacity(
                  opacity: _isReadyToShow ? 1.0 : 0.0,
                  child: _MenuSurface(
                    maxWidth: widget.maxWidth,
                    child: _MenuConstraints(
                      maxWidth: widget.maxWidth,
                      child: KeyedSubtree(key: _menuKey, child: widget.menu),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

@immutable
class _MenuPlacement {
  const _MenuPlacement({
    required this.showAbove,
    required this.alignRight,
    required this.offsetX,
    required this.offsetY,
    required this.targetAnchor,
    required this.followerAnchor,
  });

  final bool showAbove;
  final bool alignRight;

  final double offsetX;
  final double offsetY;

  final Alignment targetAnchor;
  final Alignment followerAnchor;

  static const _MenuPlacement initial = _MenuPlacement(
    showAbove: false,
    alignRight: true,
    offsetX: 0.0,
    offsetY: 0.0,
    targetAnchor: Alignment.bottomRight,
    followerAnchor: Alignment.topRight,
  );

  @override
  bool operator ==(Object other) {
    return other is _MenuPlacement &&
        other.showAbove == showAbove &&
        other.alignRight == alignRight &&
        other.offsetX == offsetX &&
        other.offsetY == offsetY &&
        other.targetAnchor == targetAnchor &&
        other.followerAnchor == followerAnchor;
  }

  @override
  int get hashCode => Object.hash(
    showAbove,
    alignRight,
    offsetX,
    offsetY,
    targetAnchor,
    followerAnchor,
  );
}

class _AnchorMenuPlacementService {
  const _AnchorMenuPlacementService._();

  static _MenuPlacement compute({
    required Rect anchorRect,
    required Size menuSize,
    required Size screenSize,
    required EdgeInsets edgePadding,
    required bool forceLeftAlign,
    required bool overlayAnchorOnOpen,
  }) {
    final double menuWidth = menuSize.width;
    final double menuHeight = menuSize.height;

    final double minLeft = edgePadding.left;
    final double minTop = edgePadding.top;
    final double maxRight = screenSize.width - edgePadding.right;
    final double maxBottom = screenSize.height - edgePadding.bottom;

    // Автоматический "gap" через перекрытие якоря:
    // - long press: меню примыкает (перекрытие 0)
    // - tap: меню перекрывает якорь по высоте:
    //   * снизу: верх меню = верх якоря
    //   * сверху: низ меню = низ якоря
    final double overlapShiftBelow = overlayAnchorOnOpen
        ? -anchorRect.height
        : 0.0;
    final double overlapShiftAbove = overlayAnchorOnOpen
        ? anchorRect.height
        : 0.0;

    final double baseTopIfBelow = anchorRect.bottom;
    final double baseTopIfAbove = anchorRect.top - menuHeight;

    final double desiredTopIfBelow = baseTopIfBelow + overlapShiftBelow;
    final double desiredTopIfAbove = baseTopIfAbove + overlapShiftAbove;

    final bool fitsBelow = desiredTopIfBelow + menuHeight <= maxBottom;
    final bool fitsAbove = desiredTopIfAbove >= minTop;

    final bool showAbove = _chooseShowAbove(
      fitsBelow: fitsBelow,
      fitsAbove: fitsAbove,
      desiredTopIfBelow: desiredTopIfBelow,
      desiredTopIfAbove: desiredTopIfAbove,
      minTop: minTop,
      maxBottom: maxBottom,
      menuHeight: menuHeight,
    );

    final double desiredTop = showAbove ? desiredTopIfAbove : desiredTopIfBelow;
    final double clampedTop = desiredTop.clamp(minTop, maxBottom - menuHeight);
    final double yCorrection = clampedTop - desiredTop;

    final double baseOffsetY = showAbove
        ? overlapShiftAbove
        : overlapShiftBelow;
    final double finalOffsetY = baseOffsetY + yCorrection;

    final double leftIfRightAligned = anchorRect.right - menuWidth;
    final double leftIfLeftAligned = anchorRect.left;

    final bool alignRight = forceLeftAlign
        ? false
        : _chooseAlignRight(
            leftIfRightAligned: leftIfRightAligned,
            leftIfLeftAligned: leftIfLeftAligned,
            menuWidth: menuWidth,
            minLeft: minLeft,
            maxRight: maxRight,
          );

    final double desiredLeft = alignRight
        ? leftIfRightAligned
        : leftIfLeftAligned;
    final double clampedLeft = desiredLeft.clamp(minLeft, maxRight - menuWidth);
    final double xCorrection = clampedLeft - desiredLeft;

    return _MenuPlacement(
      showAbove: showAbove,
      alignRight: alignRight,
      offsetX: xCorrection,
      offsetY: finalOffsetY,
      targetAnchor: _targetAnchor(showAbove: showAbove, alignRight: alignRight),
      followerAnchor: _followerAnchor(
        showAbove: showAbove,
        alignRight: alignRight,
      ),
    );
  }

  static bool _chooseShowAbove({
    required bool fitsBelow,
    required bool fitsAbove,
    required double desiredTopIfBelow,
    required double desiredTopIfAbove,
    required double minTop,
    required double maxBottom,
    required double menuHeight,
  }) {
    if (fitsBelow) return false;
    if (fitsAbove) return true;

    final double visibleSpaceBelow = maxBottom - desiredTopIfBelow;
    final double visibleSpaceAbove = (desiredTopIfAbove + menuHeight) - minTop;

    return visibleSpaceAbove > visibleSpaceBelow;
  }

  static bool _chooseAlignRight({
    required double leftIfRightAligned,
    required double leftIfLeftAligned,
    required double menuWidth,
    required double minLeft,
    required double maxRight,
  }) {
    final bool fitsRightAligned = leftIfRightAligned >= minLeft;
    final bool fitsLeftAligned = leftIfLeftAligned + menuWidth <= maxRight;

    if (fitsRightAligned) return true;
    if (fitsLeftAligned) return false;

    final double overflowIfRightAligned = leftIfRightAligned < minLeft
        ? (minLeft - leftIfRightAligned)
        : 0.0;

    final double overflowIfLeftAligned =
        (leftIfLeftAligned + menuWidth) > maxRight
        ? (leftIfLeftAligned + menuWidth - maxRight)
        : 0.0;

    return overflowIfRightAligned <= overflowIfLeftAligned;
  }

  static Alignment _targetAnchor({
    required bool showAbove,
    required bool alignRight,
  }) {
    if (showAbove) {
      return alignRight ? Alignment.topRight : Alignment.topLeft;
    }
    return alignRight ? Alignment.bottomRight : Alignment.bottomLeft;
  }

  static Alignment _followerAnchor({
    required bool showAbove,
    required bool alignRight,
  }) {
    if (showAbove) {
      return alignRight ? Alignment.bottomRight : Alignment.bottomLeft;
    }
    return alignRight ? Alignment.topRight : Alignment.topLeft;
  }
}

class _MenuConstraints extends StatelessWidget {
  const _MenuConstraints({required this.maxWidth, required this.child});

  final double maxWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}

class _MenuSurface extends StatelessWidget {
  const _MenuSurface({required this.maxWidth, required this.child});

  final double maxWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(35)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(34),
        child: GlassWrapper(
          borderRadius: 26,
          data: context.glass.box.copyWith(bcgOpacity: 0.2),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: child,
          ),
        ),
      ),
    );
  }
}
