import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../entities/photo/photo.dart';
import '../../widgets/items/photo_item.dart';
import '../blocs/photo/photo_bloc.dart';

class MainPhotoItem extends StatelessWidget {
  const MainPhotoItem({super.key, required this.photo});

  final Photo photo;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<PhotoBloc>().add(PressPhoto(photo: photo)),
      child: PhotoItem(key: ValueKey(photo.date), path: photo.photoPath),
    );
  }
}
