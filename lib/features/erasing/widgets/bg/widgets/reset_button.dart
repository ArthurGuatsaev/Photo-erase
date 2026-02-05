import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widgets/buttons/glass_icon_btn.dart';
import '../../../blocs/erase/erase_bloc.dart';
import '../bg_cubit/bg_cubit.dart';

class BgResetBtn extends StatelessWidget {
  const BgResetBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GlassIconBtn(
          icon: CupertinoIcons.refresh_bold,
          onTap: () {
            context.read<BgCubit>().onPressClear();
            context.read<EraseBloc>().add(PressEraseBg());
          },
          data: context.glassButtonData.data,
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
