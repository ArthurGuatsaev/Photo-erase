import 'package:erasica/core/const/assets_path.dart';
import 'package:erasica/features/widgets/buttons/leading_button.dart';
import 'package:erasica/main.dart';
import '/features/main/widgets/removing_button_box.dart';
import '/features/widgets/wrapper/background.dart';
import 'package:flutter/material.dart';

class SheetRemovingButtons extends StatelessWidget {
  const SheetRemovingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      isModalSheet: true,
      isDefault: true,
      child: SafeArea(
        top: false,
        child: Column(
          spacing: 20,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              leading: LeadingBtn(
                icon: AssetsPath.iconClose,
                onTap: appRouter.maybePop,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 20,
                bottom: 32,
              ),
              child: RemovingButtonsBox(),
            ),
          ],
        ),
      ),
    );
  }
}
