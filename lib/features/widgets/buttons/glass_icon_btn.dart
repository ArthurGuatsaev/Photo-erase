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
    this.color = Colors.white,
    this.needFake = false,
  });
  final GlassButtonData data;
  final IconData icon;
  final VoidCallback? onTap;
  final Color color;
  final bool? needFake;
  @override
  Widget build(BuildContext context) {
    return GlassWrapper(
      data: context.glass.circle.copyWith(fake: needFake),
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
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Padding(
                padding: EdgeInsets.all(data.paddingValue),
                child: Icon(icon, color: color),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
