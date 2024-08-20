import 'package:flutter/material.dart';

class ImageMostrador extends StatelessWidget {
  final String imgPath;

  const ImageMostrador({super.key, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(imgPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
