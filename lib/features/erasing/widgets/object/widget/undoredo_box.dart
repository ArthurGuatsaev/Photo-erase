import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../widgets/buttons/glass_icon_btn.dart';
import '../mask_cubit/mask_cubit.dart';

class UndoRedoBox extends StatelessWidget {
  const UndoRedoBox({super.key});

  @override
  Widget build(BuildContext context) {
    final maskCubit = context.read<MaskCubit>();
    final glassBtnData = context.glassButtonData.data;
    return BlocBuilder<MaskCubit, MaskState>(
      builder: (context, state) {
        return Row(
          spacing: 12,
          children: [
            GlassIconBtn(
              icon: CupertinoIcons.arrow_uturn_left,
              onTap: state.canUndo ? maskCubit.undo : null,
              data: glassBtnData,
            ),
            GlassIconBtn(
              icon: CupertinoIcons.arrow_uturn_right,
              onTap: state.canRedo ? maskCubit.redo : null,
              data: glassBtnData,
            ),
            const Spacer(),
            if (state.hasStrokes)
              GlassIconBtn(
                icon: CupertinoIcons.refresh_bold,
                onTap: maskCubit.clear,
                data: glassBtnData,
              ),
          ],
        );
      },
    );
  }
}
