import 'package:erasica/features/widgets/shapes/selected_icon.dart';
import 'package:erasica/features/widgets/shapes/unselected_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/history_bloc.dart';

class HistorySelectedIcon extends StatelessWidget {
  const HistorySelectedIcon({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is HistoryInitial) {
          return const SizedBox();
        }
        if (state is HistorySelectAll) {
          return SelectedIcon(needShadow: true);
        }
        if (state is HistorySelecting) {
          if (state.selected.contains(currentIndex)) {
            return SelectedIcon(needShadow: true);
          }
          return UnselectedIcon(needShadow: true);
        }
        return const SizedBox();
      },
    );
  }
}
