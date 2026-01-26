import 'package:auto_route/auto_route.dart';
import 'package:erasica/core/const/assets_path.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import '../widgets/buttons/leading_button.dart';
import '../../core/theme/widget_styles/custom_button_style.dart';
import '../widgets/text/text_row.dart';
import '../widgets/wrapper/background.dart';
import 'widgets/premium_button.dart';
import 'widgets/respect_description.dart';
import 'widgets/settings_item.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWrapper(
      isDefault: true,
      child: Scaffold(
        appBar: AppBar(
          leading: LeadingBtn(icon: AssetsPath.iconBack),
          title: TextRow(
            style: context.text.appbarTitle.copyWith(
              color: context.color.textBase,
            ),
            text: 'settings_title',
          ),
        ),
        body: Padding(
          padding: context.pagePadding.data.pagePadding,
          child: CustomScrollView(
            slivers: [
              PremiumButton(),
              SettingsItem(
                contents: [
                  CustomButtonStyle(
                    title: 'settings_share_title',
                    image: AssetsPath.iconShareApp,
                    subtitle: '',
                    onTap: () {},
                  ),
                  CustomButtonStyle(
                    title: 'settings_support_title',
                    image: AssetsPath.iconSupport,
                    subtitle: 'settings_support_subtitle',
                    onTap: () {},
                  ),
                ],
              ),
              SettingsItem(
                contents: [
                  CustomButtonStyle(
                    title: 'settings_restore_title',
                    image: AssetsPath.iconRestore,
                    subtitle: '',
                    onTap: () {},
                  ),
                ],
              ),

              SettingsItem(
                contents: [
                  CustomButtonStyle(
                    title: 'settings_privacy_title',
                    image: AssetsPath.iconPrivacy,
                    subtitle: '',
                    onTap: () {},
                  ),
                  CustomButtonStyle(
                    title: 'settings_terms_title',
                    image: AssetsPath.iconTerms,
                    subtitle: '',
                    onTap: () {},
                  ),
                ],
              ),
              RespectDescription(),
            ],
          ),
        ),
      ),
    );
  }
}
