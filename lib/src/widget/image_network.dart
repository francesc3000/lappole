import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageNetwork extends StatelessWidget {
  final String? imageUrl;

  const ImageNetwork({super.key, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: 30,
      height: 30,
      imageUrl: imageUrl!,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.yellow,
        child: const Text(
          'Shimmer',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
