import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../main/bloc/photo_bloc.dart';
import '../../widgets/text/text_row.dart';
import '../bloc/history_bloc.dart';

class HistoryTitle extends StatelessWidget {
  const HistoryTitle({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryBloc, HistoryState>(
      builder: (context, state) {
        if (state is HistoryInitial) {
          return TextRow(
            style: context.text.appbarTitle.copyWith(
              color: context.color.textBase,
            ),
            text: 'history_title',
          );
        }
        if (state is HistorySelecting) {
          return TextRow(
            style: context.text.appbarTitle.copyWith(
              color: context.color.textBase,
            ),
            text: 'select_items_count'.tr(
              args: [state.selected.length.toString()],
            ),
          );
        }
        if (state is HistorySelectAll) {
          final photos = context.watch<PhotoBloc>().state.photos;
          return TextRow(
            style: context.text.appbarTitle.copyWith(
              color: context.color.textBase,
            ),
            text: 'select_items_count'.tr(args: [photos.length.toString()]),
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
