import 'package:easy_localization/easy_localization.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/text/texts.dart';

class TotalRow extends StatelessWidget {
  const TotalRow({super.key, required this.localizedPrice});

  final String localizedPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6.w,
      children: [
        Expanded(
          child: Text(
            'total'.tr(),
            style: TextStyle(
              fontSize: 15.sp,
              fontFamily: font(FontWeight.w500),
              color: context.color.subtitle.withValues(alpha: 0.5),
            ),
          ),
        ),
        Text(
          localizedPrice,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 15.sp,
            fontFamily: font(FontWeight.w600),
            color: Color.fromRGBO(56, 99, 232, 1),
          ),
        ),
      ],
    );
  }
}
