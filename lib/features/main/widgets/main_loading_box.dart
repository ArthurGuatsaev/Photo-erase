import 'package:erasica/features/widgets/loading/loading_universal.dart';
import 'package:erasica/features/widgets/pop_up_content/sheet_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/loading/loading_with_sheet.dart';
import '../blocs/photo/photo_bloc.dart';

class MainLoadingBox extends StatelessWidget {
  const MainLoadingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      buildWhen: (prev, curr) => prev is PhotoLoading || curr is PhotoLoading,
      builder: (context, state) {
        if (state case final PhotoLoading loadingState) {
          if (loadingState.isErasing) {
            return const LoadingWithSheet(
              content: SheetLoading(
                subtitle: 'loading_bg_subtitle',
                title: 'loading_bg_title',
              ),
            );
          }
          if (loadingState.isUniversal) {
            return const LoadingUniversal();
          }
        }
        return const SizedBox();
      },
    );
  }
}
