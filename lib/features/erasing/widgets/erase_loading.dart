import 'package:erasica/features/widgets/wrapper/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/pop_up_content/loading.dart';
import '../blocs/erase/erase_bloc.dart';

class EraseLoadingBox extends StatelessWidget {
  const EraseLoadingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EraseBloc, EraseState>(
      builder: (context, state) {
        if (state is EraseBgLoading) {
          return LoadingWrapper(
            content: LoadingSheet(
              subtitle: 'loading_bg_subtitle',
              title: 'loading_bg_title',
            ),
          );
        }
        if (state is EraseObjLoading) {
          return LoadingWrapper(
            content: LoadingSheet(
              subtitle: 'loading_obj_subtitle',
              title: 'loading_obj_title',
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
