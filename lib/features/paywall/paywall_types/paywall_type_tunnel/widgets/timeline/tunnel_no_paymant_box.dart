import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../../core/theme/app_theme.dart';
import '../../../../../../core/theme/text/texts.dart';
import '../../../../../widgets/wrapper/glass.dart';
import '../../../../model/product_option.dart';
import '../../../../widgets/no_paymant_box.dart';

class TunnelNoPaymantBox extends StatelessWidget {
  const TunnelNoPaymantBox({super.key, required this.year});
  final ProductOption year;
  @override
  Widget build(BuildContext context) {
    final borderRadius = 24.0;
    return GlassWrapper(
      data: context.glass.darkBox,
      borderRadius: borderRadius,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: context.appWidget.data.buttonMaxWidth,
        ),
        child: Container(
          padding: EdgeInsets.all(13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: NoPaymantBox(
            alignment: MainAxisAlignment.start,
            iconSize: 32,
            title: "no_payment_trial",

            subtitle: AutoSizeText(
              "paywall_tunnel_pay_zero_text".tr(),
              style: TextStyle(
                fontSize: 14,
                fontFamily: font(FontWeight.w400),
                color: context.color.subtitle,
              ),
              textAlign: TextAlign.left,
              maxLines: 1,
            ),
          ),
        ),
      ),
    );
  }
}
