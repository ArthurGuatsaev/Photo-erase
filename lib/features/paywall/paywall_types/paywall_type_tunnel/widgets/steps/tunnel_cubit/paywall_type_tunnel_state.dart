part of 'paywall_type_tunnel_cubit.dart';

class PaywallTypeTunnelState extends Equatable {
  const PaywallTypeTunnelState({
    required this.currentPageIndex,
    required this.onlyTimeline,
  });

  final int currentPageIndex;
  final bool onlyTimeline;

  /// Тк последний index не имеет текстов, то вводим ограничение
  int get currentPageTextIndex =>
      currentPageIndex.clamp(0, PaywallTypeTunnelCubit.lastStepIndex - 1);
  bool get isLast => currentPageIndex == PaywallTypeTunnelCubit.lastStepIndex;
  @override
  List<Object> get props => [currentPageIndex, onlyTimeline];

  PaywallTypeTunnelState copyWith({int? currentPageIndex, bool? onlyTimeline}) {
    return PaywallTypeTunnelState(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
      onlyTimeline: onlyTimeline ?? this.onlyTimeline,
    );
  }
}
