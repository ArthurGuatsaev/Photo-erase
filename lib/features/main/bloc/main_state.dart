part of 'main_bloc.dart';

@immutable
sealed class MainState {
  final bool isLoading;
  final List<Photo> photos;
  const MainState({this.isLoading = false, this.photos = const []});
}

final class MainInitial extends MainState {}

final class MainLoadingBg extends MainState {
  const MainLoadingBg({super.isLoading = true, required super.photos});
}

final class MainLoadingObj extends MainState {
  const MainLoadingObj({super.isLoading = true, required super.photos});
}

final class MainWithHistory extends MainState {
  const MainWithHistory({required super.photos});
}
