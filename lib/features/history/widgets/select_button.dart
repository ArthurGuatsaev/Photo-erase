import 'package:erasica/features/main/blocs/photo/photo_bloc.dart';
import 'package:erasica/features/widgets/buttons/glass_text_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/history_bloc.dart';

class SelectButton extends StatelessWidget {
  const SelectButton({super.key});

  @override
  Widget build(BuildContext context) {
    final historyBloc = context.read<HistoryBloc>();

    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is HistoryInitial) {
          return GlassTextBtn(
            onTap: () => historyBloc.add(PressSelect()),
            title: 'select_btn',
          );
        }
        if (state is HistorySelecting) {
          if (state.selected.isEmpty) {
            final photos = context.watch<PhotoBloc>().state.photos;
            return GlassTextBtn(
              onTap: () => historyBloc.add(PressSelectAll(items: photos)),
              title: 'select_all_btn',
            );
          }
          return GlassTextBtn(
            onTap: () => historyBloc.add(PressDeselectAll()),
            title: 'deselect_all_btn',
          );
        }
        if (state is HistorySelectAll) {
          return GlassTextBtn(
            onTap: () => historyBloc.add(PressDeselectAll()),
            title: 'deselect_all_btn',
          );
        }
        return GlassTextBtn(onTap: () {}, title: 'select_btn');
      },
    );
  }
}
