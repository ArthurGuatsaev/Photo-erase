// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({required this.needAtt, required this.needRequest});

  final bool needAtt;
  final bool needRequest;

  @override
  List<Object> get props => [needAtt, needRequest];

  AppState copyWith({bool? needAtt, bool? needRequest}) {
    return AppState(
      needAtt: needAtt ?? this.needAtt,
      needRequest: needRequest ?? this.needRequest,
    );
  }
}
