// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

abstract class AppService {
  late final Directory applicationDirectory;
  late final Directory tmpDirectory;
  late final int applicationOpenCount;

  Future<void> getApplicationDirectory();
  Future<void> getApplicationOpenCount();
  Future<String> saveAsFile(Uint8List bytes, {bool tmp = false});
  Future<String> saveAsFileFromPath(String path, {bool tmp = false});
  Future<void> requestReview();
  Future<void> requestATT();
  Future<void> enableScreenshot();
  Future<void> disableScreenshot();
  Future<void> launch(String path);
  Future<void> shareApp(String path, RenderBox render);
}
