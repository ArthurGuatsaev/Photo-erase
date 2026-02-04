import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppCachedImage extends StatelessWidget {
  const AppCachedImage({super.key, required this.path});

  final String path;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: path,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      placeholder: (context, url) => Center(
        child: SizedBox(
          child: CircularProgressIndicator(
            color: Colors.white.withValues(alpha: 0.95252),
          ),
        ),
      ),
      errorWidget: (context, error, stackTrace) => const IndexedStack(),
    );
  }
}
