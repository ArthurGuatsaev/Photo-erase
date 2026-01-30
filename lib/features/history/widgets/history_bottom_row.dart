import 'package:erasica/core/const/assets_path.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/history/bloc/history_bloc.dart';
import 'package:erasica/features/widgets/buttons/glass_icon_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryBottomRow extends StatelessWidget {
  const HistoryBottomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        child: Padding(
          padding: context.appWidget.data.pagePadding,
          child: BlocBuilder<HistoryBloc, HistoryState>(
            builder: (context, state) {
              if (state is HistoryInitial) {
                return const SizedBox();
              }
              if (state is HistorySelecting && state.selected.isEmpty) {
                return _SelectedActionsBtn(onDelete: null, onShare: null);
              }
              return _SelectedActionsBtn(
                onDelete: () => context.read<HistoryBloc>().add(PressDeletes()),
                onShare: () {},
              );
            },
          ),
        ),
      ),
    );
  }
}

class _SelectedActionsBtn extends StatelessWidget {
  const _SelectedActionsBtn({this.onDelete, this.onShare});

  final VoidCallback? onDelete;
  final VoidCallback? onShare;

  @override
  Widget build(BuildContext context) {
    final btnData = context.glassButtonData.data;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GlassIconBtn(
          data: btnData,
          icon: AssetsPath.iconDelete,
          onTap: onDelete,
        ),
        GlassIconBtn(data: btnData, icon: AssetsPath.iconShare, onTap: onShare),
      ],
    );
  }
}
