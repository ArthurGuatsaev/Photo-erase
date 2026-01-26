import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:theme_code_gen_annotations/theme_code_gen_annotations.dart';
part 'texts.g.dart';

String? font(FontWeight w) => GoogleFonts.inter(fontWeight: w).fontFamily;

@textAnnotation
abstract class AppTextStyle {
  static TextStyle title = TextStyle(
    fontSize: 19.sp,
    fontFamily: font(FontWeight.w700),
    height: 1.30,
    color: Colors.white,
  );
  static TextStyle subtitle = TextStyle(
    fontSize: 15.sp,
    fontFamily: font(FontWeight.w400),
    height: 1.20,
    color: Colors.white.withValues(alpha: 0.6),
  );
  static TextStyle appbarTitle = TextStyle(
    fontSize: 20.sp,
    fontFamily: font(FontWeight.w700),
    height: 1.20,
    color: Colors.white,
  );

  static TextStyle btnTitle = TextStyle(
    fontSize: 16.sp,
    fontFamily: font(FontWeight.w600),
    height: 1.20,
    color: Colors.white,
  );
  static TextStyle popupTitle = TextStyle(
    fontSize: 18.sp,
    fontFamily: font(FontWeight.w700),
    height: 1.20,
  );
  static TextStyle allowingBtnSubtitle = TextStyle(
    fontSize: 13.sp,
    fontFamily: font(FontWeight.w400),
    height: 1.20,
    color: Colors.white,
  );

  //TODO
  static TextStyle settingsRespectBold = TextStyle(
    fontSize: 13.sp,
    fontFamily: font(FontWeight.w700),
    height: 1.50,
  );
  static TextStyle settingsRespectEasy = TextStyle(
    fontSize: 13.sp,
    fontFamily: font(FontWeight.w500),
    height: 1.50,
  );
  static TextStyle galleryBoxTitle = TextStyle(
    fontSize: 14.sp,
    fontFamily: font(FontWeight.w500),
    height: 1.10,
  );
  static TextStyle allowingBtnTitle = TextStyle(
    fontSize: 15.sp,
    fontFamily: font(FontWeight.w700),
    height: 1.10,
  );
  static TextStyle removingBtnTitle = TextStyle(
    fontSize: 16.sp,
    fontFamily: font(FontWeight.w600),
    height: 1.20,
  );
  static TextStyle removingBtnSubtitle = TextStyle(
    fontSize: 13.sp,
    fontFamily: font(FontWeight.w500),
    height: 1.20,
  );
  static TextStyle logoAppName = TextStyle(
    fontSize: 28.sp,
    fontFamily: font(FontWeight.w800),
    height: 1.20,
  );
  static TextStyle logoAppSlogan = TextStyle(
    fontSize: 14.sp,
    fontFamily: font(FontWeight.w400),
    height: 1.30,
  );
  static TextStyle settingsBtnTitle = TextStyle(
    fontSize: 16.sp,
    fontFamily: font(FontWeight.w700),
    height: 1.20,
  );
  static TextStyle settingsBtnSubtitle = TextStyle(
    fontSize: 14.sp,
    fontFamily: font(FontWeight.w400),
    height: 1.40,
  );
  static TextStyle settingsItemsTitle = TextStyle(
    fontSize: 15.sp,
    fontFamily: font(FontWeight.w400),
    height: 1.20,
  );
  static TextStyle settingsItemsSubtitle = TextStyle(
    fontSize: 12.sp,
    fontFamily: font(FontWeight.w400),
    height: 1.20,
  );
}
