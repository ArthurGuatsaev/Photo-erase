import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/main_bloc.dart';
import 'main_history_list.dart';

class MainHistoryBox extends StatelessWidget {
  const MainHistoryBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is! MainWithHistory) {
          return const SliverToBoxAdapter(); //тут возможно будет показ загрузки
        }
        return MainHistoryList(photoList: state.photos);
      },
    );
  }
}
