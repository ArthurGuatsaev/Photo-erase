import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/const/assets_path.dart';
import '../../../core/theme/text/texts.dart';
import '../../../core/theme/widget_styles/custom_button_style.dart';
import '../../widgets/text/text_row.dart';

class RemovingButton extends StatelessWidget {
  const RemovingButton({super.key, required this.customButtonStyle});
  final CustomButtonStyle customButtonStyle;
  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(20);
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: customButtonStyle.onTap,
                borderRadius: borderRadius,
                child: Ink(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: Image.asset(AssetsPath.removingBtnBG).image,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: borderRadius,
                  ),
                  child: ClipRRect(
                    borderRadius: borderRadius,
                    child: Stack(
                      children: [
                        Positioned(
                          left: -constraints.maxWidth * 0.1,
                          top: -constraints.maxWidth * 0.1,
                          child: Image.asset(
                            customButtonStyle.image,
                            width: constraints.maxWidth / 1.3,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: constraints.maxWidth * 0.2,
                            height: constraints.maxWidth * 0.2,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                              ),
                            ),
                            child: Icon(
                              CupertinoIcons.arrow_up_right,
                              weight: 2.5,
                              color: Color.fromRGBO(31, 80, 208, 1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          child: Center(
                            child: Column(
                              spacing: 4,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextRow(
                                  text: customButtonStyle.title,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontFamily: font(FontWeight.w500),
                                    color: context.color.subtitleLight,
                                  ),
                                ),
                                TextRow(
                                  text: customButtonStyle.subtitle,
                                  style: context.text.btnTitle.copyWith(
                                    color: context.color.title,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
