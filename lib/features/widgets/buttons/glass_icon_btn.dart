import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/core/theme/widget_styles/glass_button_data.dart';
import 'package:flutter/material.dart';
import '../wrapper/glass.dart';

class GlassIconBtn extends StatelessWidget {
  const GlassIconBtn({
    super.key,
    required this.data,
    required this.icon,
    this.onTap,
  });
  final GlassButtonData data;
  final String icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GlassWrapper(
      data: context.glass.circle,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: Opacity(
            opacity: onTap == null ? 0.35 : 1,
            child: Container(
              height: data.size.height,
              width: data.size.width,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Padding(
                padding: EdgeInsets.all(data.paddingValue),
                child: Image.asset(icon),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
