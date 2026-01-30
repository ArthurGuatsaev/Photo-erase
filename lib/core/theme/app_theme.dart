import 'package:erasica/core/theme/color/colors.dart';
import 'package:erasica/core/theme/widget_styles/item_data.dart';
import 'package:erasica/core/theme/widget_styles/list_items_data.dart';
import 'package:erasica/core/theme/widget_styles/app_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'gradient/gradients.dart';
import 'text/texts.dart';
import 'widget_styles/glass_button_data.dart';
import 'widget_styles/longpress_size.dart';

ThemeData createLightTheme() {
  final colorExtention = AppColorsThemeColors.light;
  return ThemeData(
    extensions: <ThemeExtension<dynamic>>[
      colorExtention,
      AppTextStyleThemeText.light,
      AppGradientsThemeGradients.light,
      LongPressExtension(
        historyPhotoData: LongpressSize(width: 220, height: 320),
      ),
      ItemDataExtension(
        historyPhotoItemData: ItemData(borderRadius: 18),
        galleryPhotoItemData: ItemData(borderRadius: 8),
        mainPhotoItemData: ItemData(borderRadius: 12),
      ),

      //вынес сюда чтобы можно было переключать с
      //горизонтальной на вертикальную и так далее в
      //разных темах
      ListItemsExtension(
        historyPhotoItemsData: ListItemsData(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        galleryPhotoItemsData: ListItemsData(
          scrollDirrection: Axis.horizontal,
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          horizontalBoxAspect: 343 / 176,
        ),
        mainPhotoItemsData: ListItemsData(
          scrollDirrection: Axis.horizontal,
          crossAxisCount: 1,
          childAspectRatio: 1,
          crossAxisSpacing: 6,
          mainAxisSpacing: 6,
          horizontalBoxAspect: 350 / 100,
        ),
      ),
      GlassButtonExtension(
        data: GlassButtonData(
          size: Size(56, 56),
          lightIntensity: 0.5,
          paddingValue: 16,
        ),
        appbarData: GlassButtonData(
          size: Size(44, 44),
          lightIntensity: 0.5,
          paddingValue: 10,
        ),
      ),
      PaddingDataExtension(
        data: AppWidgetData(
          pagePadding: EdgeInsets.symmetric(horizontal: 16),
          curve: Curves.bounceOut,
          bottomOffset: 42.h,
          animationDuration: const Duration(milliseconds: 250),
        ),
      ),
    ],
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      leadingWidth: 60,
      actionsPadding: EdgeInsets.only(right: 16),
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    textTheme: TextTheme(
      bodyMedium: AppTextStyle.btnTitle,
      bodySmall: AppTextStyle.popupSubtitle,
      bodyLarge: AppTextStyle.appbarTitle,
    ),
  );
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
  LongPressExtension get longPress =>
      Theme.of(this).extension<LongPressExtension>()!;
  ItemDataExtension get item => Theme.of(this).extension<ItemDataExtension>()!;
}
