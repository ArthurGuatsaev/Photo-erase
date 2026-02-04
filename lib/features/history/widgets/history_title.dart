import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/text/text_row.dart';
import '../bloc/history_bloc.dart';

class HistoryTitle extends StatelessWidget {
  const HistoryTitle({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        final selected = state.selected.length;
        if (state is HistoryInitial) {
          return TextRow(
            style: context.text.appbarTitle.copyWith(
              color: context.color.textBase,
            ),
            text: 'history_title'.plural(0),
          );
        }
        if (state is HistorySelecting) {
          return TextRow(
            style: context.text.appbarTitle.copyWith(
              color: context.color.textBase,
            ),
            text: 'select_items_count'.plural(selected),
          );
        }
        if (state is HistorySelectAll) {
          return TextRow(
            style: context.text.appbarTitle.copyWith(
              color: context.color.textBase,
            ),
            text: 'select_items_count'.plural(selected),
          );
        }
        return TextRow(
          style: context.text.appbarTitle.copyWith(
            color: context.color.textBase,
          ),
          text: 'history_title',
        );
      },
    );
  }
}
