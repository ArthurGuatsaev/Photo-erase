import 'dart:io';

import 'package:erasica/features/erasing/widgets/object/mask_cubit/mask_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DegugMaskImage extends StatefulWidget {
  const DegugMaskImage({super.key});

  @override
  State<DegugMaskImage> createState() => _DegugMaskImageState();
}

class _DegugMaskImageState extends State<DegugMaskImage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaskCubit, MaskState>(
      builder: (context, state) {
        if (state.maskImage == null) return const SizedBox();
        imageCache.clear();
        imageCache.clearLiveImages();
        return GestureDetector(
          onTap: context.read<MaskCubit>().clearMaskImageDebug,
          child: Positioned.fill(
            child: Opacity(
              opacity: 0.5,
              child: Image.file(
                key: UniqueKey(),
                File(state.maskImage!),
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }
}
