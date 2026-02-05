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

class PressPhoto extends PhotoEvent {
  final Photo photo;
  PressPhoto({required this.photo});
}

class PressSharePhotos extends PhotoEvent {
  final List<Photo> photos;
  final RenderBox render;
  PressSharePhotos({required this.photos, required this.render});
}

class DeletePhotos extends PhotoEvent {
  final List<String> ids;
  DeletePhotos({required this.ids});
}

class PressDeletePhotos extends PhotoEvent {
  final List<Photo> photos;
  final VoidCallback backCallback;
  PressDeletePhotos({required this.photos, required this.backCallback});
}

class PressEditPhoto extends PhotoEvent {
  final Photo photo;
  PressEditPhoto({required this.photo});
}

class HandleStateEvent extends PhotoEvent {
  final List<Photo> photos;
  final bool needLoading;

  HandleStateEvent({required this.photos, this.needLoading = false});
}
