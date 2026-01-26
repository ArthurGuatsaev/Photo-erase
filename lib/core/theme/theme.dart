// import 'package:erasica/core/theme/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';

// String? font(FontWeight w) => GoogleFonts.inter(fontWeight: w).fontFamily;

// abstract class BaseTheme {
//   double get horizontalPadding;

//   ThemeData get data {
//     return ThemeData(
//       useMaterial3: true,
//       brightness: Brightness.light,
//       scaffoldBackgroundColor: AppColors.white,
//       // Проверить необходимость вообще внедрерий
//       // colorScheme: ThemeData.light().colorScheme.copyWith(
//       //   surface: AppColors.white,
//       //   onSurface: AppColors.darkGray,
//       //   onSurfaceVariant: AppColors.darkGray2,
//       // ),
//       textTheme: TextTheme(
//         displayLarge: TextStyle(
//           fontSize: 26.sp,
//           fontFamily: font(FontWeight.w800),
//           height: 1.20,
//         ),
//         displayMedium: TextStyle(
//           fontSize: 22.sp,
//           fontFamily: font(FontWeight.w700),
//           height: 1.20,
//         ),
//         displaySmall: TextStyle(
//           fontSize: 19.sp,
//           fontFamily: font(FontWeight.w700),
//           height: 1.30,
//           color: AppColors.darkGray,
//         ),
//         headlineMedium: TextStyle(
//           fontSize: 20.sp,
//           fontFamily: font(FontWeight.w600),
//           height: 1.20,
//         ),
//         headlineSmall: TextStyle(
//           fontSize: 17.sp,
//           fontFamily: font(FontWeight.w600),
//           height: 1.20,
//         ),

//         titleLarge: TextStyle(
//           fontSize: 18.sp,
//           fontFamily: font(FontWeight.w700),
//           height: 1.20,
//         ),
//         titleMedium: TextStyle(
//           fontSize: 16.sp,
//           fontFamily: font(FontWeight.w600),
//           height: 1.20,
//         ),
//         titleSmall: TextStyle(
//           fontSize: 14.sp,
//           fontFamily: font(FontWeight.w600),
//           height: 1.20,
//         ),

//         bodyLarge: TextStyle(
//           fontSize: 16.sp,
//           fontFamily: font(FontWeight.w500),
//           height: 1.20,
//         ),
//         bodyMedium: TextStyle(
//           fontSize: 15.sp,
//           fontFamily: font(FontWeight.w400),
//           height: 1.40,
//         ),
//         bodySmall: TextStyle(
//           fontSize: 12.sp,
//           fontFamily: font(FontWeight.w400),
//           height: 1.4,
//         ),

//         labelLarge: TextStyle(
//           fontSize: 16.sp,
//           fontFamily: font(FontWeight.w600),
//           height: 1.20,
//         ),
//         labelMedium: TextStyle(
//           fontSize: 14.sp,
//           fontFamily: font(FontWeight.w600),
//           height: 1.20,
//         ),
//         labelSmall: TextStyle(
//           fontSize: 11.sp,
//           fontFamily: font(FontWeight.w400),
//           height: 1.20,
//         ),
//       ),
//       textButtonTheme: TextButtonThemeData(
//         style: TextButton.styleFrom(
//           // backgroundColor: AppColors.buttonGray,
//           foregroundColor: AppColors.darkGray,
//           textStyle: TextStyle(
//             fontSize: 16.sp,
//             fontFamily: font(FontWeight.w600),
//             height: 1.20,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(100.r),
//           ),
//           minimumSize: Size(0, 48.h),
//           padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 13.h),
//         ),
//       ),

//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           // backgroundColor: AppColors.gradientStart,
//           foregroundColor: AppColors.darkGray,
//           textStyle: TextStyle(
//             fontSize: 16.sp,
//             fontFamily: font(FontWeight.w600),
//             height: 1.20,
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(100.r),
//           ),
//           minimumSize: Size(double.infinity, 48.h),
//           padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 13.h),
//           elevation: 0,
//         ),
//       ),

//       textSelectionTheme: TextSelectionThemeData(
//         // selectionColor: AppColors.blue.withValues(alpha: 0.25),
//       ),
//     );
//   }

//   CustomTextStyles get customTextStyles;
// }

// class CustomTextStyles {
//   final TextStyle removingBtnTitle;
//   final TextStyle removingBtnSubtitle;
//   final TextStyle allowingBtnTitle;
//   final TextStyle allowingBtnSubtitle;
//   final TextStyle galleryBoxTitle;
//   //todo
//   final TextStyle listItemTitle;
//   final TextStyle gridItemTitle;
//   final TextStyle documentItemSubtitle;
//   final TextStyle dialogTitle;
//   final TextStyle dialogBody;
//   final TextStyle onDarkLabel;
//   final TextStyle buttonText;

//   final TextStyle settingsButtonText;
//   final TextStyle hintText;
//   final TextStyle signatureHintText;
//   final TextStyle secondaryButtonText;
//   final TextStyle toastText;
//   final TextStyle searchInputText;
//   final TextStyle searchHintText;
//   final TextStyle bottomSheetTitle;
//   final TextStyle signatureTextInput;
//   final TextStyle pageIndicatorText;
//   final TextStyle appBarTitle;
//   final TextStyle renameInputText;
//   final TextStyle dateFormatText;
//   final TextStyle languageNameText;
//   final TextStyle hintText2;
//   final TextStyle settingsItemTitle;
//   final TextStyle documentMenuItemText;
//   final TextStyle menuItemText;
//   final TextStyle segmentedControlText;
//   final TextStyle paywallText;
//   final TextStyle paywallGreenText;
//   final TextStyle paywallYearButtonText;
//   final TextStyle paywallWeekButtonText;
//   final TextStyle paywallDescriptionText;
//   final TextStyle paywallTunnelText;
//   final TextStyle paywallTunnelBoldText;
//   final TextStyle paywallTunnelSmallText;
//   final TextStyle paywallTunnelAccessText;
//   final TextStyle paywallTotalPriceText;
//   final TextStyle paywallSpecialPriceText;

//   const CustomTextStyles({
//     required this.removingBtnTitle,
//     required this.removingBtnSubtitle,
//     required this.allowingBtnTitle,
//     required this.allowingBtnSubtitle,
//     required this.galleryBoxTitle,
//     //todo
//     required this.listItemTitle,
//     required this.gridItemTitle,
//     required this.documentItemSubtitle,
//     required this.dialogTitle,
//     required this.dialogBody,
//     required this.onDarkLabel,
//     required this.buttonText,

//     required this.settingsButtonText,
//     required this.hintText,
//     required this.signatureHintText,
//     required this.secondaryButtonText,
//     required this.toastText,
//     required this.searchInputText,
//     required this.searchHintText,
//     required this.bottomSheetTitle,
//     required this.signatureTextInput,
//     required this.pageIndicatorText,
//     required this.appBarTitle,
//     required this.renameInputText,
//     required this.dateFormatText,
//     required this.languageNameText,
//     required this.hintText2,
//     required this.settingsItemTitle,
//     required this.documentMenuItemText,
//     required this.menuItemText,
//     required this.segmentedControlText,
//     required this.paywallText,
//     required this.paywallGreenText,
//     required this.paywallYearButtonText,
//     required this.paywallWeekButtonText,
//     required this.paywallDescriptionText,
//     required this.paywallTunnelText,
//     required this.paywallTunnelBoldText,
//     required this.paywallTunnelSmallText,
//     required this.paywallTunnelAccessText,
//     required this.paywallTotalPriceText,
//     required this.paywallSpecialPriceText,
//   });
// }

// class UsualTheme extends BaseTheme {
//   @override
//   CustomTextStyles get customTextStyles => CustomTextStyles(
//     galleryBoxTitle: TextStyle(
//       fontSize: 14.sp,
//       fontFamily: font(FontWeight.w500),
//       height: 1.10,
//       color: AppColors.white,
//     ),
//     allowingBtnTitle: TextStyle(
//       fontSize: 15.sp,
//       fontFamily: font(FontWeight.w700),
//       height: 1.10,
//       color: AppColors.white,
//     ),
//     allowingBtnSubtitle: TextStyle(
//       fontSize: 13.sp,
//       fontFamily: font(FontWeight.w400),
//       height: 1.20,
//       color: AppColors.white.withValues(alpha: 0.4),
//     ),
//     removingBtnTitle: TextStyle(
//       fontSize: 16.sp,
//       fontFamily: font(FontWeight.w600),
//       height: 1.20,
//       color: AppColors.white,
//     ),
//     removingBtnSubtitle: TextStyle(
//       fontSize: 13.sp,
//       fontFamily: font(FontWeight.w500),
//       height: 1.20,
//       color: AppColors.white,
//     ),

//     //todo
//     listItemTitle: TextStyle(
//       fontSize: 15.sp,
//       fontFamily: font(FontWeight.w700),
//       height: 1.20,
//       color: AppColors.white,
//     ),
//     gridItemTitle: TextStyle(
//       fontSize: 14.sp,
//       fontFamily: font(FontWeight.w700),
//       height: 1.20,
//       color: AppColors.white,
//     ),
//     documentItemSubtitle: TextStyle(
//       fontSize: 11.sp,
//       fontFamily: font(FontWeight.w400),
//       height: 1.20,
//       color: AppColors.white,
//     ),
//     dialogTitle: TextStyle(
//       fontSize: 17.sp,
//       fontFamily: font(FontWeight.w700),
//       height: 1.18,
//       color: AppColors.white,
//     ),
//     dialogBody: TextStyle(
//       fontSize: 14.sp,
//       fontFamily: font(FontWeight.w400),
//       height: 1.40,
//       color: AppColors.white,
//     ),
//     onDarkLabel: TextStyle(
//       fontSize: 14.sp,
//       fontFamily: font(FontWeight.w600),
//       height: 1.20,
//       color: AppColors.white,
//     ),
//     buttonText: TextStyle(
//       fontSize: 15.sp,
//       fontFamily: font(FontWeight.w700),
//       color: AppColors.darkGray,
//     ),
//     settingsButtonText: TextStyle(
//       fontSize: 15.sp,
//       fontFamily: font(FontWeight.w500),
//       height: 1.33,
//       color: AppColors.darkGray,
//     ),
//     hintText: TextStyle(
//       fontSize: 14.sp,
//       fontFamily: font(FontWeight.w400),
//       height: 1.30,
//       color: AppColors.darkGray,
//     ),
//     signatureHintText: TextStyle(
//       fontSize: 13.sp,
//       fontFamily: font(FontWeight.w500),
//       height: 1.50,
//       color: AppColors.darkGray,
//     ),
//     secondaryButtonText: TextStyle(
//       fontSize: 15.sp,
//       fontFamily: font(FontWeight.w500),
//       height: 1.40,
//       color: AppColors.darkGray.withValues(alpha: 0.3),
//     ),
//     toastText: TextStyle(
//       fontSize: 15.sp,
//       fontFamily: font(FontWeight.w700),
//       height: 1.50,
//       color: AppColors.darkGray,
//     ),
//     searchInputText: TextStyle(
//       fontSize: 17.sp,
//       fontFamily: font(FontWeight.w700),
//       color: AppColors.white,
//     ),
//     searchHintText: TextStyle(
//       fontSize: 17.sp,
//       fontFamily: font(FontWeight.w600),
//       color: AppColors.white,
//     ),
//     bottomSheetTitle: TextStyle(
//       fontSize: 17.sp,
//       fontFamily: font(FontWeight.w700),
//       height: 1.18,
//       color: AppColors.darkGray,
//     ),
//     signatureTextInput: TextStyle(
//       fontSize: 16.sp,
//       fontFamily: font(FontWeight.w400),
//       height: 1.40,
//       letterSpacing: 0.26,
//       color: AppColors.darkGray,
//     ),
//     pageIndicatorText: TextStyle(
//       fontSize: 13.sp,
//       fontFamily: font(FontWeight.w700),
//       height: 1.20,
//       color: AppColors.darkGray,
//     ),
//     appBarTitle: TextStyle(
//       fontSize: 16.sp,
//       fontFamily: font(FontWeight.w700),
//       height: 1.20,
//       color: AppColors.darkGray,
//     ),
//     renameInputText: TextStyle(
//       fontSize: 15.sp,
//       fontFamily: font(FontWeight.w700),
//       height: 1.40,
//       color: AppColors.darkGray,
//     ),
//     dateFormatText: TextStyle(
//       fontSize: 14.sp,
//       fontFamily: font(FontWeight.w500),
//       height: 1.43,
//       color: AppColors.darkGray,
//     ),
//     languageNameText: TextStyle(
//       fontSize: 14.sp,
//       fontFamily: font(FontWeight.w500),
//       height: 1.43,
//       color: AppColors.darkGray,
//     ),
//     hintText2: TextStyle(
//       fontSize: 13.sp,
//       fontFamily: font(FontWeight.w400),
//       height: 1.40,
//       color: AppColors.white.withValues(alpha: 0.60),
//     ),
//     settingsItemTitle: TextStyle(
//       fontSize: 16.sp,
//       fontFamily: font(FontWeight.w700),
//       height: 1.20,
//       color: AppColors.darkGray,
//     ),
//     documentMenuItemText: TextStyle(
//       fontSize: 12.sp,
//       fontFamily: font(FontWeight.w600),
//       height: 1.50,
//       color: AppColors.darkGray,
//     ),
//     menuItemText: TextStyle(
//       fontSize: 17.sp,
//       fontFamily: font(FontWeight.w400),
//       height: 1.18,
//       letterSpacing: -0.43,
//       color: AppColors.darkGray,
//     ),
//     segmentedControlText: TextStyle(
//       fontSize: 14.sp,
//       fontFamily: font(FontWeight.w700),
//       height: 1.29,
//       letterSpacing: -0.08,
//       color: AppColors.darkGray,
//     ),
//     paywallText: TextStyle(
//       fontSize: 16.sp,
//       fontFamily: font(FontWeight.w500),
//       height: 1.20,
//       color: AppColors.darkGray,
//     ),
//     paywallGreenText: TextStyle(
//       fontSize: 14.sp,
//       fontFamily: font(FontWeight.w500),
//       height: 1.20,
//       color: AppColors.white,
//     ),
//     paywallYearButtonText: TextStyle(
//       fontSize: 16.sp,
//       fontFamily: font(FontWeight.w700),
//       height: 1.20,
//       color: AppColors.darkGray,
//     ),
//     paywallWeekButtonText: TextStyle(
//       fontSize: 15.sp,
//       fontFamily: font(FontWeight.w700),
//       height: 1.40,
//       color: AppColors.darkGray,
//     ),
//     paywallDescriptionText: TextStyle(
//       fontSize: 14.sp,
//       fontFamily: font(FontWeight.w400),
//       height: 0.93,
//       color: AppColors.darkGray,
//     ),
//     paywallTunnelText: TextStyle(
//       fontSize: 16.sp,
//       fontFamily: font(FontWeight.w500),
//       height: 1.40,
//       color: AppColors.darkGray,
//     ),
//     paywallTunnelBoldText: TextStyle(
//       fontSize: 15.sp,
//       fontFamily: font(FontWeight.w700),
//       height: 1.50,
//       color: AppColors.darkGray,
//     ),
//     paywallTunnelSmallText: TextStyle(
//       fontSize: 13.sp,
//       fontFamily: font(FontWeight.w400),
//       height: 1.40,
//       color: AppColors.white,
//     ),
//     paywallTunnelAccessText: TextStyle(
//       fontSize: 16.sp,
//       fontFamily: font(FontWeight.w700),
//       height: 1.20,
//       color: AppColors.darkGray,
//     ),
//     paywallTotalPriceText: TextStyle(
//       fontSize: 16.sp,
//       fontFamily: font(FontWeight.w700),
//       height: 1.20,
//       color: AppColors.white,
//     ),
//     paywallSpecialPriceText: TextStyle(
//       fontSize: 14.sp,
//       fontFamily: font(FontWeight.w500),
//       height: 1.40,
//       color: AppColors.white,
//     ),
//   );

//   @override
//   double get horizontalPadding => 16;
// }

// final appTheme = UsualTheme();
