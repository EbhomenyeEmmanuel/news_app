import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsIcon extends StatelessWidget {
  final String imageUrl;
  final double imageHeight;

  NewsIcon({Key? key, required this.imageUrl, this.imageHeight = 210}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ClipRRect(child: CachedNetworkImage(
          imageUrl: imageUrl,
          height: imageHeight,
          fit: BoxFit.fill,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => Icon(Icons.error),),
          borderRadius: BorderRadius.circular(12),
        ));
  }
}