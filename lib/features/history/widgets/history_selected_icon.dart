import 'package:erasica/features/widgets/shapes/selected_icon.dart';
import 'package:erasica/features/widgets/shapes/unselected_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/history_bloc.dart';

class HistorySelectedIcon extends StatelessWidget {
  const HistorySelectedIcon({super.key, required this.id});
  final String id;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is HistoryInitial) {
          return const SizedBox();
        }
        if (state is HistorySelectAll) {
          return SelectedIcon(needShadow: false);
        }
        if (state is HistorySelecting) {
          if (state.selected.contains(id)) {
            return SelectedIcon(needShadow: false);
          }
          return UnselectedIcon(needShadow: true);
        }
        return const SizedBox();
      },
    );
  }
}
