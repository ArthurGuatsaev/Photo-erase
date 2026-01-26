import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/const/assets_path.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../widgets/buttons/glass_icon_btn.dart';
import '../../../blocs/erase/erase_bloc.dart';

class BgActionBtn extends StatelessWidget {
  const BgActionBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EraseBloc, EraseState>(
      builder: (context, state) {
        final onTap = switch (state) {
          EraseWithBg() => () => context.read<EraseBloc>().add(PressChangeBg()),
          EraseWithMask() => () => context.read<EraseBloc>().add(PressFinish()),
          _ => null,
        };
        return GlassIconBtn(
          icon: AssetsPath.iconShare,
          onTap: onTap,
          data: context.glassButtonData.appbarData,
        );
      },
    );
  }
}
