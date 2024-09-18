import 'package:flutter/material.dart';

import 'enum.dart';

class GlobalImageLoader extends StatelessWidget {
  const GlobalImageLoader(
      {Key? key,
      required this.imagePath,
      this.imageFor = ImageFor.asset,
      this.height,
      this.width,
      this.fit,
      this.color,
      this.errorBuilder})
      : super(key: key);
  final String imagePath;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final Color? color;
  final ImageErrorWidgetBuilder? errorBuilder;
  final ImageFor imageFor;

  @override
  Widget build(BuildContext context) {
    if (imageFor == ImageFor.network) {
      return Image.network(imagePath,
          height: height,
          width: width,
          fit: fit,
          color: color,
          errorBuilder: errorBuilder ??
              (context, exception, stackTrace) => Center(
                  child: Image.asset("assets/images/placeholder.png",
                      height: height, width: width, fit: BoxFit.fill)));
    } else {
      return Image.asset(imagePath,
          height: height,
          width: width,
          fit: fit,
          color: color,
          errorBuilder: errorBuilder ??
              (context, exception, stackTrace) => Center(
                  child: Image.asset("assets/images/placeholder.png",
                      height: height, width: width, fit: BoxFit.fill)));
    }
  }
}
