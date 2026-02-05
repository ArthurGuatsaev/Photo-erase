import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../entities/photo/photo.dart';
import '../../widgets/shapes/selected_icon.dart';
import '../../widgets/shapes/unselected_icon.dart';
import '../bloc/history_bloc.dart';

class HistorySelectedIcon extends StatelessWidget {
  const HistorySelectedIcon({super.key, required this.photo});
  final Photo photo;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is HistoryInitial) {
          return const SizedBox();
        }
        if (state is HistorySelectAll) {
          return const SelectedIcon(needShadow: false, size: 28, padding: 4);
        }
        if (state is HistorySelecting) {
          if (state.selected.contains(photo)) {
            return const SelectedIcon(needShadow: false, size: 26, padding: 4);
          }
          return const UnselectedIcon(needShadow: true, size: 32);
        }
        return const SizedBox();
      },
    );
  }
}
