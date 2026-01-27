// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'erase_bloc.dart';

sealed class EraseEvent extends Equatable {
  const EraseEvent();

  @override
  List<Object> get props => [];
}

class PressEraseBg extends EraseEvent {}

class PressChangeBg extends EraseEvent {}

class PressEraseObj extends EraseEvent {
  final Uint8List mask;
  const PressEraseObj({required this.mask});
}

class PressFinish extends EraseEvent {}

class SetActiveBg extends EraseEvent {
  final Object bg;
  const SetActiveBg({required this.bg});
}
