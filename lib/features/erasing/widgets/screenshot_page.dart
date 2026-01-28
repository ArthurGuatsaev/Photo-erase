import 'dart:async';

import 'package:erasica/core/theme/app_theme.dart';
import 'package:erasica/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/text/text_row.dart';
import '../../widgets/wrapper/background.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ScreenshotPage extends StatefulWidget {
  const ScreenshotPage({super.key});

  @override
  State<ScreenshotPage> createState() => _ScreenshotPageState();
}

class _ScreenshotPageState extends State<ScreenshotPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) appRouter.maybePop();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      child: Scaffold(
        body: Center(
          child: Row(
            children: [
              Icon(
                CupertinoIcons.stop_circle,
                color: context.color.paywallPrimary,
              ),
              TextRow(
                style: context.text.title.copyWith(color: context.color.title),
                text: 'screenshot_title',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
