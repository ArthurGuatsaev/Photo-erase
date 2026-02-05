import 'package:flutter/cupertino.dart';

import '../../../../../../core/const/assets_path.dart';
import '../../../../widgets/offer_line.dart';
import 'tunnel_step_wrapper.dart';

class TunnelStep0 extends StatelessWidget {
  const TunnelStep0({super.key});

  @override
  Widget build(BuildContext context) {
    return TunnelStepWrapper(
      linesRotate: 0,
      icon: CupertinoIcons.star_fill,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Image.asset(
            AssetsPath.starsCirclesBg,
            fit: BoxFit.contain,
            width: double.infinity,
          ),
          Positioned(
            bottom: 90,
            child: Image.asset(
              AssetsPath.paywallErase,
              fit: BoxFit.contain,
              width: 350,
            ),
          ),
          const Align(alignment: Alignment.bottomCenter, child: OfferLine()),
        ],
      ),
    );
  }
}
