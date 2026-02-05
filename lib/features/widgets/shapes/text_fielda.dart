import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/theme/app_theme.dart';
import '../buttons/leading_button.dart';
import '../wrapper/glass.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({super.key, required this.hint, required this.onChanged});
  final ValueChanged<String> onChanged;
  final String hint;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final textController = TextEditingController();
  @override
  void initState() {
    textController.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final borderR = 296.0;
    final border = OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(borderR),
    );
    final isEmpty = textController.text.isEmpty;
    return Row(
      children: [
        Expanded(
          child: GlassWrapper(
            data: context.glass.box.copyWith(fake: true),
            borderRadius: borderR,
            child: TextField(
              controller: textController,
              style: context.text.btnTitle.copyWith(color: context.color.title),
              onChanged: widget.onChanged,
              cursorColor: context.color.title,
              decoration: InputDecoration(
                hintStyle: context.text.btnTitle.copyWith(
                  color: const Color.fromRGBO(255, 255, 255, 0.3),
                ),
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: Color.fromRGBO(255, 255, 255, isEmpty ? 0.3 : 1),
                ),
                hintText: widget.hint,
                focusedBorder: border,
                enabledBorder: border,
              ),
            ),
          ),
        ),
        if (!isEmpty)
          LeadingBtn(
            icon: CupertinoIcons.clear,
            onTap: () {
              textController.clear();
              widget.onChanged('');
              SystemChannels.textInput.invokeMethod('TextInput.hide');
            },
          ),
      ],
    );
  }
}
