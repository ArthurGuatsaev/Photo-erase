import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/features/main/bloc/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/const/assets_path.dart';
import '../../../core/theme/widget_styles/custom_button_style.dart';
import 'removing_button.dart';

class RemovingButtonsBox extends StatelessWidget {
  const RemovingButtonsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.pagePadding.data.pagePadding.copyWith(bottom: 30),
      child: Row(
        spacing: 15,
        children: [
          RemovingButton(
            customButtonStyle: CustomButtonStyle(
              image: AssetsPath.removingBtnPictureObj,
              title: 'removing_btn_title',
              subtitle: 'removing_btn_obj_name',
              onTap: () {
                context.read<MainBloc>().add(PressEraseObject());
              },
            ),
          ),
          RemovingButton(
            customButtonStyle: CustomButtonStyle(
              image: AssetsPath.removingBtnPictureBg,
              title: 'removing_btn_title',
              subtitle: 'removing_btn_bg_name',
              onTap: () {
                context.read<MainBloc>().add(PressEraseBg());
              },
            ),
          ),
        ],
      ),
    );
  }
}
