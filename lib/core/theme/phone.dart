import 'package:flutter/material.dart';

import 'color/colors.dart';
import 'gradient/gradients.dart';
import 'text/texts.dart';
import 'widget_styles/app_data.dart';
import 'widget_styles/glass_button_data.dart';
import 'widget_styles/glass_data.dart';
import 'widget_styles/item_data.dart';
import 'widget_styles/list_items_data.dart';
import 'widget_styles/longpress_size.dart';

ThemeData phoneLightTheme() {
  return ThemeData(
    extensions: <ThemeExtension<dynamic>>[
      AppColorsThemeColors.light,
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
      GlassDataExtension(
        mainButton: GlassData(
          lightIntensity: 0.1,
          lightAngle: 4,
          bcgOpacity: 0.03,
        ),
        box: GlassData(lightIntensity: 0.1, lightAngle: 4, bcgOpacity: 0.05),
        circle: GlassData(lightIntensity: 0.5, lightAngle: 0.8, isCircle: true),
        darkBox: GlassData(bcgOpacity: 0.015, lightIntensity: 0.1),
      ),

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
        data: GlassButtonData(size: Size(56, 56), paddingValue: 16),
        appbarData: GlassButtonData(size: Size(44, 44), paddingValue: 10),
      ),
      PaddingDataExtension(
        data: AppWidgetData(
          pagePadding: EdgeInsets.symmetric(horizontal: 16),
          curve: Curves.bounceOut,
          bottomOffset: 42,
          buttonMaxWidth: 450,
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
