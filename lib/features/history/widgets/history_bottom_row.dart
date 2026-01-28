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
    final btnData = context.glassButtonData.data;
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GlassIconBtn(
            data: btnData,
            icon: AssetsPath.iconRedo,
            onTap: () => context.read<HistoryBloc>().add(PressDeletes()),
          ),
          GlassIconBtn(data: btnData, icon: AssetsPath.iconRedo),
        ],
      ),
    );
  }
}
