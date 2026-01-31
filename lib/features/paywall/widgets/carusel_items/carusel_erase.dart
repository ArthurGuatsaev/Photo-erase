import 'package:flutter/material.dart';
import '../../../../entities/photo/photo.dart';
import '../erase_photo.dart';
import 'paywall_benefit_item.dart';

class CaruselErasePhotoBox extends StatelessWidget {
  const CaruselErasePhotoBox({super.key, this.photo});
  final Photo? photo;
  @override
  Widget build(BuildContext context) {
    return CaruselPhotoSize(child: ErasePhotoBox(photo: photo));
  }
}
