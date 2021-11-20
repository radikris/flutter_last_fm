import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CommonNetworkImage extends StatelessWidget {
  const CommonNetworkImage({Key? key, this.width, this.height, required this.url}) : super(key: key);

  final double? width;
  final double? height;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return (url == null || url!.trim().isEmpty)
        ? Image.memory(kTransparentImage)
        : FadeInImage.memoryNetwork(
            width: width,
            height: height,
            placeholder: kTransparentImage,
            image: url!,
            fit: BoxFit.cover,
          );
  }
}
