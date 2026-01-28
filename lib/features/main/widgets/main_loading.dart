import 'package:erasica/features/widgets/pop_up_content/sheet_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/wrapper/loading.dart';
import '../bloc/main_bloc.dart';

class MainLoading extends StatelessWidget {
  const MainLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        if (state.isLoading) {
          final loading = state is MainLoadingBg
              ? 'loading_bg_'
              : 'loading_obj_';
          return LoadingWrapper(
            content: SheetLoading(
              subtitle: '${loading}title',
              title: '${loading}subtitle',
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
