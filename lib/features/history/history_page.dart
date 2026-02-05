import 'package:auto_route/auto_route.dart';
import 'package:erasica/core/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theme/app_theme.dart';
import '../main/blocs/photo/photo_bloc.dart';
import '../main/widgets/main_loading_box.dart';
import 'widgets/history_bottom_row.dart';
import 'widgets/history_title.dart';
import 'package:flutter/material.dart';
import '../widgets/wrapper/background.dart';
import 'bloc/history_bloc.dart';
import 'widgets/history_leading.dart';
import 'widgets/history_photo_list.dart';
import 'widgets/select_button.dart';

@RoutePage()
class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final paddingData = context.appWidget.data;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HistoryBloc()),
        BlocProvider(create: (context) => getIt<PhotoBloc>()),
      ],
      child: BackgroundWrapper(
        loading: const MainLoadingBox(),
        isDefault: true,
        bottomRow: const HistoryBottomRow(),
        child: Scaffold(
          appBar: AppBar(
            leading: const HistoryLeading(),
            title: const HistoryTitle(),
            actions: [const SelectButton()],
          ),
          body: Padding(
            padding: paddingData.pagePadding.copyWith(top: 10),
            child: CustomScrollView(
              slivers: [
                BlocBuilder<PhotoBloc, PhotoState>(
                  builder: (context, state) {
                    return HistoryPhotoList(photos: state.photos);
                  },
                ),
                const SliverPadding(padding: EdgeInsets.only(bottom: 100)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
