import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../main/blocs/photo/photo_bloc.dart';
import '../../widgets/loading/loading_universal.dart';
import '../../widgets/loading/loading_with_sheet.dart';
import '../../widgets/pop_up_content/sheet_loading.dart';
import '../blocs/erase/erase_bloc.dart';

class EraseLoadingBox extends StatelessWidget {
  const EraseLoadingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EraseBloc, EraseState>(
      builder: (context, state) {
        if (state is EraseBgLoading) {
          return const LoadingWithSheet(
            content: SheetLoading(
              subtitle: 'loading_prepare_subtitle',
              title: 'loading_prepare_title',
            ),
          );
        }
        if (state is EraseObjLoading) {
          return const LoadingWithSheet(
            content: SheetLoading(
              subtitle: 'loading_obj_subtitle',
              title: 'loading_obj_title',
            ),
          );
        }
        return BlocBuilder<PhotoBloc, PhotoState>(
          builder: (context, state) {
            if (state case final PhotoLoading loadingState) {
              if (loadingState.isUniversal) {
                return const LoadingUniversal();
              }
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}
