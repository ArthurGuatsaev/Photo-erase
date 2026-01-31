import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/shapes/shadow_opacity_box.dart';
import '../../../widgets/wrapper/photo_box.dart';

class MultyPhotoBox extends StatelessWidget {
  const MultyPhotoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Stack(
        children: [
          CustomMultiChildLayout(
            delegate: _AppMultiChildLayoutDelegate(),
            children: [
              for (var i = 1; i <= 6; i++)
                LayoutId(
                  id: i,
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: PhotoBoxWrapper(
                      borderRadius: i.borderRFromInt,
                      padding: i.paddingFromInt,
                      child: Image.asset(
                        'assets/images/paywall/unlimited_$i.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          ShadowOpacityBox(),
        ],
      ),
    );
  }
}

extension on int {
  BorderRadius? get borderRFromInt {
    return switch (this) {
      1 => BorderRadius.only(
        bottomRight: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
      2 => BorderRadius.only(
        bottomRight: Radius.circular(20.r),
        topRight: Radius.circular(20.r),
      ),
      5 => BorderRadius.only(
        topLeft: Radius.circular(20.r),
        bottomLeft: Radius.circular(20.r),
      ),
      6 => BorderRadius.only(
        topLeft: Radius.circular(20.r),
        bottomLeft: Radius.circular(20.r),
      ),
      _ => null,
    };
  }

  EdgeInsets? get paddingFromInt {
    return switch (this) {
      1 => EdgeInsets.only(top: 6, right: 6, bottom: 6),
      2 => EdgeInsets.only(top: 6, right: 6, bottom: 6),
      5 => EdgeInsets.only(top: 6, bottom: 6, left: 6),
      6 => EdgeInsets.only(top: 6, bottom: 6, left: 6),
      _ => null,
    };
  }
}

class _AppMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    final widthSide = size.width * 0.25;
    final widthCenter = size.width - widthSide * 2;
    final heightTop = size.height * 0.35;
    final heightBottom = size.height * 0.60;
    layoutChild(1, BoxConstraints.expand(height: heightTop, width: widthSide));
    positionChild(1, const Offset(0, 0));

    layoutChild(
      2,
      BoxConstraints.expand(height: size.height * 0.6, width: widthSide),
    );
    positionChild(2, Offset(0, heightTop));

    layoutChild(
      3,
      BoxConstraints.expand(height: size.height * 0.7, width: widthCenter),
    );
    positionChild(3, Offset(widthSide, 0));

    layoutChild(
      4,
      BoxConstraints.expand(height: size.height * 0.25, width: widthCenter),
    );
    positionChild(4, Offset(widthSide, size.height * 0.7));

    layoutChild(
      6,
      BoxConstraints.expand(height: heightBottom, width: widthSide),
    );
    positionChild(6, Offset(widthSide + widthCenter, heightTop));

    layoutChild(5, BoxConstraints.expand(height: heightTop, width: widthSide));
    positionChild(5, Offset(widthSide + widthCenter, 0));
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}
