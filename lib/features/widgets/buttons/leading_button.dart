import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/main.dart';
import 'package:flutter/cupertino.dart';
import 'glass_icon_btn.dart';

class LeadingBtn extends StatelessWidget {
  const LeadingBtn({super.key, required this.icon, this.onTap});
  final IconData icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GlassIconBtn(
            icon: icon,
            needFake: true,
            onTap: onTap ?? appRouter.maybePop,
            data: context.glassButtonData.appbarData,
          ),
        ),
      ],
    );
  }
}
