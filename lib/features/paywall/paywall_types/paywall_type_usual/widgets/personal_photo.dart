import 'package:erasica/features/widgets/wrapper/photo_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/const/assets_path.dart';
import '../../../../../entities/photo/photo.dart';
import '../../../../widgets/shapes/shadow_opacity_box.dart';
import '../../../widgets/erase_photo.dart';

class PersonalPhoto extends StatelessWidget {
  const PersonalPhoto({super.key, required this.photo});
  final Photo photo;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AssetsPath.starsPersonal, width: double.infinity),
        Padding(
          padding: EdgeInsets.only(top: 13, left: 50.w, right: 50.w),
          child: Stack(
            children: [
              PhotoBoxWrapper(child: ErasePhotoBox(photo: photo)),
              ShadowOpacityBox(),
            ],
          ),
        ),
      ],
    );
  }
}
