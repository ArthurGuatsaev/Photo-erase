import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotoBoxWrapper extends StatelessWidget {
  const PhotoBoxWrapper({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.1), width: 6),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: child,
    );
  }
}
