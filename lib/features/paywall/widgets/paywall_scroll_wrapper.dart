import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaywallScrollWrapper extends StatelessWidget {
  const PaywallScrollWrapper({
    super.key,
    required this.widgets,
    this.bottomChild,
  });

  final List<Widget> widgets;
  final Widget? bottomChild;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height:
                MediaQuery.sizeOf(context).height -
                MediaQuery.of(context).padding.bottom -
                44.h,
            child: SafeArea(bottom: false, child: Column(children: widgets)),
          ),
          if (bottomChild != null) ...[
            SizedBox(height: 20.h),
            bottomChild!,
            SizedBox(height: 11.h + MediaQuery.of(context).padding.bottom),
          ],
        ],
      ),
    );
  }
}
