part of 'erase_bloc.dart';

sealed class EraseState {
  final String image;
  const EraseState({required this.image});
}

final class EraseInitial extends EraseState {
  const EraseInitial({required super.image});
}

final class EraseBgLoading extends EraseState {
  const EraseBgLoading({required super.image});
}

final class EraseObjLoading extends EraseState {
  const EraseObjLoading({required super.image});
}

final class EraseWithBg extends EraseState {
  final Object bg;
  const EraseWithBg({required super.image, required this.bg});
}

final class EraseWithMask extends EraseState {
  const EraseWithMask({required super.image});
}
