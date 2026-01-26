import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../widgets/shapes/selected_icon.dart';
import '../bg_cubit/bg_cubit.dart';

class BgItem extends StatelessWidget {
  const BgItem({super.key, required this.object, this.onTap});
  final Object object;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final gradient = object is LinearGradient ? object as LinearGradient : null;
    final color = object is Color ? object as Color : null;
    final file = object is XFile ? object as XFile : null;
    final assetsImage = object is String ? object as String : null;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          gradient: gradient,
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Builder(
              builder: (context) {
                if (file != null) {
                  return Image.file(File(file.path), fit: BoxFit.cover);
                }
                if (assetsImage != null) {
                  return Image.asset(assetsImage, fit: BoxFit.cover);
                }
                return SizedBox();
              },
            ),
            BlocBuilder<BgCubit, BgState>(
              builder: (context, state) {
                if (state.activeBg == object && object is! String) {
                  return SelectedIcon();
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
