import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/const/assets_path.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../entities/photo/photo.dart';
import '../../../../widgets/buttons/glass_icon_btn.dart';
import '../../../../widgets/pop_up_content/sheet_result.dart';
import '../../../blocs/erase/erase_bloc.dart';

class BgActionBtn extends StatelessWidget {
  const BgActionBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EraseBloc, EraseState>(
      builder: (context, state) {
        final onTap = switch (state) {
          EraseWithBg() => () {
            eraseDialog(Photo photo) => SheetResult.show(context, photo);
            context.read<EraseBloc>().add(
              PressFinishWithChangeBg(showDialog: eraseDialog),
            );
          },
          EraseWithMask() => () => context.read<EraseBloc>().add(
            PressFinish(
              showDialog: (Photo photo) => SheetResult.show(context, photo),
            ),
          ),
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
