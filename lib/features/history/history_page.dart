import 'package:erasica/core/di/di.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/services/photo/photo_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/history_title.dart';
import 'package:flutter/material.dart';
import '../widgets/wrapper/background.dart';
import 'bloc/history_bloc.dart';
import 'widgets/history_leading.dart';
import 'widgets/photo_list.dart';
import 'widgets/select_button.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final paddingData = context.appWidget.data;
    return BackgroundWrapper(
      isDefault: true,
      child: BlocProvider(
        create: (context) => HistoryBloc(photoService: getIt<PhotoService>()),
        child: Builder(
          builder: (context) {
            return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                leading: HistoryLeading(),
                title: HistoryTitle(),
                actions: [SelectButton()],
              ),
              body: Padding(
                padding: paddingData.pagePadding,
                child: CustomScrollView(
                  slivers: [
                    BlocBuilder<HistoryBloc, HistoryState>(
                      builder: (context, state) {
                        return PhotoList(photos: state.photos);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
