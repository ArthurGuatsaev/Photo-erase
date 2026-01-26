import 'package:flutter/material.dart';

/// TODO. сделать перенос dialog в сервис (у тебя просто в UI лежит все в перемешку)
abstract class UIMessageService {
  Future<void> showToast({
    String? text,
    Widget? content,
    Widget? icon,
    IconData? iconData,
  });

  Future<void> hideToast();
}
