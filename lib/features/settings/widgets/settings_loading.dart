import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/loading/loading_universal.dart';
import '../settings_cubit.dart';

class SettingsLoadingBox extends StatelessWidget {
  const SettingsLoadingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoading) {
          return const LoadingUniversal();
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
