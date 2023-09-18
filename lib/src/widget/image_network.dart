import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageNetwork {
  Widget build(String? imageUrl) {
    return CachedNetworkImage(
      width: 10,
      height: 10,
      imageUrl: imageUrl!,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.yellow,
        child: Text(
          'Shimmer',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
