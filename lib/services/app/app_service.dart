// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

abstract class AppService {
  late final Directory applicationDirectory;
  late final Directory tmpDirectory;
  late final int applicationOpenCount;
  late bool needRating;
  Future<void> init();
  Future<void> getApplicationDirectory();
  Future<void> getApplicationOpenCount();
  Future<String> saveAsFile(Uint8List bytes, {bool tmp = false});
  Future<String> saveAsFileFromPath(String path, {bool tmp = false});
  Future<String> changeFilePathByTmp(String path);
  Future<void> deleteFile(String path);
  Future<void> requestReview();
  Future<void> requestATT();
  Future<bool> getNeedAttRequest();
  Future<void> getNeedRating();
  Future<void> enableScreenshot();
  Future<void> disableScreenshot();
  Future<void> launch(String path);
  Future<void> shareApp(String path, RenderBox render);
  Future<void> openSettings();
}
