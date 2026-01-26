import 'package:erasica/core/const/assets_path.dart';
import 'package:erasica/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BackgroundWrapper extends StatelessWidget {
  const BackgroundWrapper({
    super.key,
    required this.child,
    this.isDefault,
    this.isMainPage,
    this.isModalSheet,
    this.isErase,
    this.loading,
  });
  final Widget child;
  final Widget? loading;
  final bool? isDefault;
  final bool? isMainPage;
  final bool? isModalSheet;
  final bool? isErase;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        if (isModalSheet != true)
          AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark,
            ),
            child: Scaffold(backgroundColor: context.color.background),
          ),
        if (isMainPage == true)
          Positioned(
            top: 0,
            child: Image.asset(
              AssetsPath.pageBGTopBlur,
              fit: BoxFit.cover,
              width: width,
            ),
          ),
        if (isDefault == true)
          Positioned(
            top: 0,
            child: Image.asset(
              AssetsPath.pageBGTopBlue,
              fit: BoxFit.cover,
              width: width,
            ),
          ),
        if (isMainPage == true)
          Positioned(
            bottom: 0,
            child: Image.asset(
              AssetsPath.pageBGBottomBlur,
              fit: BoxFit.cover,
              width: width,
            ),
          ),
        if (isErase == true)
          Positioned(
            bottom: 0,
            child: Image.asset(
              AssetsPath.pageBGBottomErase,

              fit: BoxFit.cover,
              width: width,
            ),
          ),
        if (isMainPage == true)
          Positioned(
            top: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Image.asset(
                AssetsPath.pageBGZErase,
                fit: BoxFit.cover,
                width: 280,
              ),
            ),
          ),
        child,
        if (loading != null) loading!,
      ],
    );
  }
}
