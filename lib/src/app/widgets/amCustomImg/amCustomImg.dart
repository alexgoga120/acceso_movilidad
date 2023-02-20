import 'package:flutter/material.dart';

class AMCustomImg extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;

  const AMCustomImg({Key? key, required this.image, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // use a common controller assuming HomePageButton is always a child of Home
    return FadeInImage.assetNetwork(
      placeholder: 'assets/img/chems.gif',
      image: image,
      height: height,
      width: width,
    );
  }
}
