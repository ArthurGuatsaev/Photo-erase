// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bg_cubit.dart';

class BgState {
  final Object activeBg;
  final List<LinearGradient> gradientList;
  BgState({
    required this.activeBg,
    this.gradientList = BackgroundGradients.gradientList,
  });

  BgState copyWith({Object? activeBg}) {
    return BgState(activeBg: activeBg ?? this.activeBg);
  }
}
