import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

import '../../../../../core/const/assets_path.dart';
import '../../../../widgets/wrapper/glass.dart';
import '../mask_cubit/mask_cubit.dart';

class ThicknessBox extends StatelessWidget {
  const ThicknessBox({super.key});

  @override
  Widget build(BuildContext context) {
    final trackbarBorderRadius = BorderRadius.circular(3);
    final trackbarHeight = 6.h;
    return GlassWrapper(
      data: context.glass.mainButton,
      borderRadius: 38,
      child: Container(
        padding: const EdgeInsets.only(left: 25, right: 20),
        decoration: BoxDecoration(),
        child: Row(
          spacing: 10,
          children: [
            Image.asset(AssetsPath.iconThick, width: 17.w),
            Expanded(
              child: BlocBuilder<MaskCubit, MaskState>(
                builder: (context, state) {
                  return FlutterSlider(
                    onDragging: (handlerIndex, lowerValue, upperValue) {
                      context.read<MaskCubit>().onUpdateBrushSize(lowerValue);
                    },
                    values: [state.lineSize],
                    min: 0,
                    max: 100,
                    tooltip: FlutterSliderTooltip(disabled: true),
                    trackBar: FlutterSliderTrackBar(
                      activeTrackBarHeight: trackbarHeight,
                      activeTrackBar: BoxDecoration(
                        borderRadius: trackbarBorderRadius,
                        gradient: context.gradient.thickness,
                      ),

                      inactiveTrackBarHeight: trackbarHeight,
                      inactiveTrackBar: BoxDecoration(
                        borderRadius: trackbarBorderRadius,
                        color: Color.fromRGBO(120, 120, 120, 0.3),
                      ),
                    ),
                    handler: FlutterSliderHandler(
                      decoration: BoxDecoration(),
                      child: Material(
                        borderRadius: BorderRadius.circular(100),

                        type: MaterialType.canvas,
                        color: Colors.white,
                        elevation: 3,
                        child: SizedBox(width: 38.w, height: 24.h),
                      ),
                    ),
                  );
                },
              ),
            ),
            Image.asset(AssetsPath.iconThick, width: 24.w),
          ],
        ),
      ),
    );
  }
}
