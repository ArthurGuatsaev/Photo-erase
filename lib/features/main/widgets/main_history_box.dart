import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/photo/photo_bloc.dart';
import 'main_history_list.dart';

class MainHistoryBox extends StatelessWidget {
  const MainHistoryBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoBloc, PhotoState>(
      builder: (context, state) {
        if (state is! PhotoWithHistory) {
          return const SliverToBoxAdapter(); //тут возможно будет показ загрузки
        }
        imageCache.clear();
        imageCache.clearLiveImages();
        return MainHistoryList(photoList: state.photos);
      },
    );
  }
}
