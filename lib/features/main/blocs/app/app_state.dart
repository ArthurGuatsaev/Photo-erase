// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({required this.needRequest});

  final bool needRequest;

  @override
  List<Object> get props => [needRequest];

  AppState copyWith({bool? needRequest}) {
    return AppState(needRequest: needRequest ?? this.needRequest);
  }
}
