import 'package:erasica/features/main/bloc/photo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../entities/photo/photo.dart';
import '../../widgets/items/photo_item.dart';
import '../../widgets/pop_up_content/sheet_result.dart';

class MainPhotoItem extends StatelessWidget {
  const MainPhotoItem({super.key, required this.photo});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => SheetResult.show(photo, context.read<PhotoBloc>()),
      child: PhotoItem(path: photo.photoPath),
    );
  }
}
