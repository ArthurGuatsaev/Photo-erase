import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/main.dart';
import 'package:flutter/material.dart';

import '../../../core/const/assets_path.dart';
import '../../../core/theme/widget_styles/custom_button_style.dart';
import '../../../entities/photo/photo.dart';
import '../bloc/photo_bloc.dart';
import 'removing_button.dart';

class EraseButtonsBox extends StatelessWidget {
  const EraseButtonsBox({super.key, this.photo, required this.photoBloc});
  final Photo? photo;
  final PhotoBloc photoBloc;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.appWidget.data.pagePadding.copyWith(bottom: 30),
      child: Row(
        spacing: 15,
        children: [
          RemovingButton(
            customButtonStyle: CustomButtonStyle(
              image: AssetsPath.removingBtnPictureObj,
              title: 'removing_btn_title',
              subtitle: 'removing_btn_obj_name',
              onTap: () {
                appRouter.maybePop();
                photoBloc.add(PickEraseObject(photo: photo));
              },
            ),
          ),
          RemovingButton(
            customButtonStyle: CustomButtonStyle(
              image: AssetsPath.removingBtnPictureBg,
              title: 'removing_btn_title',
              subtitle: 'removing_btn_bg_name',
              onTap: () {
                appRouter.maybePop();
                photoBloc.add(PickEraseBg(photo: photo));
              },
            ),
          ),
        ],
      ),
    );
  }
}
