import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/di.dart';
import '../../core/theme/app_theme.dart';
import '../widgets/buttons/leading_button.dart';
import '../../core/theme/widget_styles/custom_button_style.dart';
import '../widgets/text/text_row.dart';
import '../widgets/wrapper/background.dart';
import 'settings_cubit.dart';
import 'widgets/premium_button.dart';
import 'widgets/respect_description.dart';
import 'widgets/settings_item.dart';
import 'widgets/settings_loading.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final setCubit = getIt<SettingsCubit>();
    return BlocProvider(
      create: (context) => setCubit,
      child: BackgroundWrapper(
        isDefault: true,
        loading: const SettingsLoadingBox(),
        child: Scaffold(
          appBar: AppBar(
            leading: const LeadingBtn(icon: CupertinoIcons.chevron_back),
            title: TextRow(
              style: context.text.appbarTitle.copyWith(
                color: context.color.textBase,
              ),
              text: 'settings_title',
            ),
          ),
          body: Padding(
            padding: context.appWidget.data.pagePadding,
            child: BlocBuilder<SettingsCubit, SettingsState>(
              builder: (context, state) {
                return CustomScrollView(
                  slivers: [
                    if (state.needBunner) const PremiumButton(),
                    SettingsItem(
                      contents: [
                        CustomBtnIconStyle(
                          title: 'settings_share_title',
                          icon: CupertinoIcons.share,
                          subtitle: '',
                          onTap: () {
                            final render =
                                context.findRenderObject() as RenderBox;
                            setCubit.pressShareApp(render);
                          },
                        ),
                        CustomBtnIconStyle(
                          title: 'settings_support_title',
                          icon: CupertinoIcons.envelope,

                          subtitle: 'settings_support_subtitle',
                          onTap: () {
                            setCubit.pressSupportApp();
                          },
                        ),
                      ],
                    ),
                    if (state.needBunner)
                      SettingsItem(
                        contents: [
                          CustomBtnIconStyle(
                            title: 'settings_restore_title',
                            icon: CupertinoIcons.refresh_thick,
                            subtitle: '',
                            onTap: () {
                              setCubit.pressRestoreApp();
                            },
                          ),
                        ],
                      ),

                    SettingsItem(
                      contents: [
                        CustomBtnIconStyle(
                          title: 'settings_privacy_title',
                          icon: CupertinoIcons.lock_shield,
                          subtitle: '',
                          onTap: () {
                            setCubit.pressPrivacyApp();
                          },
                        ),
                        CustomBtnIconStyle(
                          title: 'settings_terms_title',
                          icon: CupertinoIcons.doc_text,
                          subtitle: '',
                          onTap: () {
                            setCubit.pressTermsApp();
                          },
                        ),
                      ],
                    ),
                    const RespectDescription(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
