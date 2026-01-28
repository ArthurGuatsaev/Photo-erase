import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/erasing/blocs/erase/erase_bloc.dart';
import 'package:erasica/features/erasing/widgets/bg/bg_cubit/bg_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/const/assets_path.dart';
import '../../../../widgets/buttons/glass_icon_btn.dart';

class BgResetBtn extends StatelessWidget {
  const BgResetBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GlassIconBtn(
          icon: AssetsPath.iconReset,
          onTap: () {
            context.read<BgCubit>().onPressClear();
            context.read<EraseBloc>().add(PressEraseBg());
          },
          data: context.glassButtonData.data,
        ),
        SizedBox(width: 16),
      ],
    );
  }
}
