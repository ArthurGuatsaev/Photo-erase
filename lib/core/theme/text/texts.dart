import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:theme_code_gen_annotations/theme_code_gen_annotations.dart';
part 'texts.g.dart';

String? font(FontWeight w) => GoogleFonts.inter(fontWeight: w).fontFamily;

@textAnnotation
abstract class AppTextStyle {
  static TextStyle title = TextStyle(
    fontSize: 19,
    fontFamily: font(FontWeight.w700),
    height: 1.30,
    color: Colors.white,
  );
  static TextStyle subtitle = TextStyle(
    fontSize: 15,
    fontFamily: font(FontWeight.w400),
    height: 1.20,
    color: Colors.white.withValues(alpha: 0.6),
  );
  static TextStyle appbarTitle = TextStyle(
    fontSize: 20,
    fontFamily: font(FontWeight.w700),
    height: 1.20,
    color: Colors.white,
  );

  static TextStyle btnTitle = TextStyle(
    fontSize: 16,
    fontFamily: font(FontWeight.w600),
    height: 1.20,
    color: Colors.white,
  );
  static TextStyle popupTitle = TextStyle(
    fontSize: 18,
    fontFamily: font(FontWeight.w700),
    height: 1.20,
  );
  static TextStyle popupSubtitle = TextStyle(
    fontSize: 13,
    fontFamily: font(FontWeight.w400),
    height: 1.20,
    color: Colors.white,
  );
  static TextStyle boxTitle = TextStyle(
    fontSize: 14,
    fontFamily: font(FontWeight.w500),
    height: 1.20,
    color: Colors.white,
  );
}
