import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/theme/text/texts.dart';
import '../../../../widgets/formatted_text.dart';

class TunnelToastContent extends StatelessWidget {
  const TunnelToastContent({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return FormattedText(
      text,
      style: TextStyle(
        fontSize: 15.sp,
        fontFamily: font(FontWeight.w600),
        height: 1.50,
      ),
      color: Colors.orange,
    );
  }
}
