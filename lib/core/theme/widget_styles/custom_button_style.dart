// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';

class CustomButtonStyle {
  final String image;
  final VoidCallback? onTap;
  final String title;
  final String subtitle;
  CustomButtonStyle({
    required this.image,
    this.onTap,
    required this.title,
    required this.subtitle,
  });
}

class CustomBtnIconStyle {
  final IconData icon;
  final VoidCallback? onTap;
  final String title;
  final String subtitle;
  CustomBtnIconStyle({
    required this.icon,
    this.onTap,
    required this.title,
    required this.subtitle,
  });
}
