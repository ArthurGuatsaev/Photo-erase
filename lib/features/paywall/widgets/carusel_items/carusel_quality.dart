import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../core/theme/text/texts.dart';
import '../../../widgets/buttons/switch_circle.dart';
import 'paywall_benefit_item.dart';

class QualityPhotoBox extends StatefulWidget {
  const QualityPhotoBox({super.key, required this.imagePath});
  final String imagePath;

  @override
  State<QualityPhotoBox> createState() => _QualityPhotoBoxState();
}

class _QualityPhotoBoxState extends State<QualityPhotoBox> {
  late final ValueNotifier<bool> value = ValueNotifier(true);
  @override
  void initState() {
    value.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CaruselPhotoSize(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: value.value ? 5.0 : 0,
              sigmaY: value.value ? 5.0 : 0,
            ),
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          ImageFiltered(
            imageFilter: ImageFilter.blur(
              sigmaX: value.value ? 5.0 : 0,
              sigmaY: value.value ? 5.0 : 0,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(top: 60),
                decoration: BoxDecoration(
                  color: value.value
                      ? Color.fromARGB(255, 106, 105, 105)
                      : const Color.fromARGB(255, 128, 128, 128),
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                CustomCircleSwitch(value: value),
                Text(
                  'HD',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: font(FontWeight.w700),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
