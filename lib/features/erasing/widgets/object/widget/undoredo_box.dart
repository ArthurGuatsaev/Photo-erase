import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/erasing/widgets/object/mask_cubit/mask_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/const/assets_path.dart';
import '../../../../widgets/buttons/glass_icon_btn.dart';

class UndoRedoBox extends StatelessWidget {
  const UndoRedoBox({super.key});

  @override
  Widget build(BuildContext context) {
    final maskCubit = context.read<MaskCubit>();
    final glassBtnData = context.glassButtonData.data;
    return Row(
      spacing: 12.w,
      children: [
        GlassIconBtn(
          icon: AssetsPath.iconUndo,
          onTap: maskCubit.undo,
          data: glassBtnData,
        ),
        GlassIconBtn(
          icon: AssetsPath.iconRedo,
          onTap: maskCubit.redo,
          data: glassBtnData,
        ),
        const Spacer(),
        GlassIconBtn(
          icon: AssetsPath.iconReset,
          onTap: maskCubit.clear,
          data: glassBtnData,
        ),
      ],
    );
  }
}
