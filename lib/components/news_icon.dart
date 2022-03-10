import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsIcon extends StatelessWidget {
  final String imageUrl;
  final double imageHeight;
  final double imageWidth;

  NewsIcon(
      {Key? key,
      required this.imageUrl,
      this.imageHeight = 210,
      required this.imageWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        height: imageHeight,
        width: imageWidth,
        fit: BoxFit.fill,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
           Center(
            child: SizedBox(
                width: 50,
                height: 50,
                child:
                    CircularProgressIndicator(value: downloadProgress.progress)),
          ),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
      borderRadius: BorderRadius.circular(12),
    );
  }
}
