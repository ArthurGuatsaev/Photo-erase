// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'photo_bloc.dart';

@immutable
sealed class PhotoEvent {}

class PressHistoryPhoto extends PhotoEvent {
  final Photo photo;

  PressHistoryPhoto({required this.photo});
}

class PickEraseObject extends PhotoEvent {
  final Photo? photo;
  PickEraseObject({this.photo});
}

class PickEraseBg extends PhotoEvent {
  final Photo? photo;
  PickEraseBg({this.photo});
}

class PressSharePhotos extends PhotoEvent {
  final List<Photo> photos;
  final RenderBox render;
  PressSharePhotos({required this.photos, required this.render});
}

class PressDeletePhoto extends PhotoEvent {
  final Photo photo;
  PressDeletePhoto({required this.photo});
}

class PressEditPhoto extends PhotoEvent {
  final Photo photo;
  PressEditPhoto({required this.photo});
}

class HandlePhotoState extends PhotoEvent {
  final List<Photo> photos;

  HandlePhotoState({required this.photos});
}
