part of 'settings_cubit.dart';

sealed class SettingsState extends Equatable {
  const SettingsState({required this.needBunner});
  final bool needBunner;
  @override
  List<Object> get props => [];
}

final class SettingsInitial extends SettingsState {
  const SettingsInitial({required super.needBunner});
}

final class SettingsLoading extends SettingsState {
  const SettingsLoading({required super.needBunner});
}
