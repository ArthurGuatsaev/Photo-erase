part of 'photo_bloc.dart';

@immutable
sealed class PhotoState {
  final List<Photo> photos;
  const PhotoState({this.photos = const []});
}

final class PhotoInitial extends PhotoState {}

final class PhotoWithHistory extends PhotoState {
  const PhotoWithHistory({required super.photos});
}

final class PhotoLoading extends PhotoState {
  const PhotoLoading({required this.loading, required super.photos});

  final LoadType loading;
  bool get isErasing => LoadType.erasing == loading;
  bool get isUniversal => LoadType.base == loading;
}

enum LoadType { base, erasing, none }
