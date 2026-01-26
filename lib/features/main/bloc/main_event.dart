// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}

class PressHistoryPhoto extends MainEvent {
  final Photo photo;

  PressHistoryPhoto({required this.photo});
}

class PressEraseObject extends MainEvent {}

class PressEraseBg extends MainEvent {}

class HandleMainState extends MainEvent {
  final List<Photo> photos;

  HandleMainState({required this.photos});
}
