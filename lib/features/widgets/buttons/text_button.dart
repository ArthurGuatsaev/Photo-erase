import 'package:flutter/cupertino.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({super.key, required this.child, required this.onTap});
  final Widget child;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: child,
    );
  }
}
