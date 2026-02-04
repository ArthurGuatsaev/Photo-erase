import 'package:erasica/core/theme/color/colors.dart';
import 'package:erasica/core/theme/widget_styles/item_data.dart';
import 'package:erasica/core/theme/widget_styles/list_items_data.dart';
import 'package:erasica/core/theme/widget_styles/app_data.dart';
import 'package:flutter/material.dart';

import 'gradient/gradients.dart';
import 'ipad.dart';
import 'phone.dart';
import 'text/texts.dart';
import 'widget_styles/glass_button_data.dart';
import 'widget_styles/glass_data.dart';
import 'widget_styles/longpress_size.dart';

ThemeData createLightTheme(double windowWidth) {
  if (windowWidth > 450) {
    return ipadLightTheme();
  } else {
    return phoneLightTheme();
  }
}

extension BuildContextExt on BuildContext {
  AppColorsThemeColors get color =>
      Theme.of(this).extension<AppColorsThemeColors>()!;
  AppTextStyleThemeText get text =>
      Theme.of(this).extension<AppTextStyleThemeText>()!;
  AppGradientsThemeGradients get gradient =>
      Theme.of(this).extension<AppGradientsThemeGradients>()!;
  GlassButtonExtension get glassButtonData =>
      Theme.of(this).extension<GlassButtonExtension>()!;
  PaddingDataExtension get appWidget =>
      Theme.of(this).extension<PaddingDataExtension>()!;
  ListItemsExtension get itemsList =>
      Theme.of(this).extension<ListItemsExtension>()!;
  GlassDataExtension get glass =>
      Theme.of(this).extension<GlassDataExtension>()!;
  LongPressExtension get longPress =>
      Theme.of(this).extension<LongPressExtension>()!;
  ItemDataExtension get item => Theme.of(this).extension<ItemDataExtension>()!;
}
