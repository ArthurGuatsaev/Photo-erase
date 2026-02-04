// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bg_cubit.dart';

class BgState {
  final Object activeBg;
  final List<LinearGradient> gradientList;
  final bool loading;

  BgState({
    required this.activeBg,
    this.loading = false,
    this.gradientList = BackgroundGradients.gradientList,
  });

  BgState copyWith({
    Object? activeBg,
    List<LinearGradient>? gradientList,
    bool? loading,
  }) {
    return BgState(
      activeBg: activeBg ?? this.activeBg,
      gradientList: gradientList ?? this.gradientList,
      loading: loading ?? this.loading,
    );
  }
}
