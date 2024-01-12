import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageProviderWidget extends StatelessWidget {
  final String image;
  final BoxFit boxFit;
  const CustomImageProviderWidget({
    super.key,
    required this.image,
    this.boxFit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: boxFit,
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: Transform.scale(
          scale: .5,
          child: CircularProgressIndicator(
            value: downloadProgress.progress,
          ),
        ),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Icon(Icons.error_rounded),
      ),
    );
  }
}
