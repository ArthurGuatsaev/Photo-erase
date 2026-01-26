import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/text/texts.dart';
import '../../../../widgets/buttons/switch.dart';
import '../../../widgets/formatted_text.dart';

class SwitchRow extends StatelessWidget {
  const SwitchRow({super.key, required this.value, required this.onChanged});

  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6.w,
      children: [
        Expanded(
          child: FormattedText(
            'paywall_enable_free_trial'.tr(),
            style: TextStyle(
              fontSize: 15.sp,
              fontFamily: font(FontWeight.w500),
            ),
            color: Colors.orange,
          ),
        ),
        CustomSwitch(value: value, onChanged: onChanged),
      ],
    );
  }
}
