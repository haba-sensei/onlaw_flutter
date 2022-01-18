import 'package:flutter/material.dart';

class ImgLogo extends StatelessWidget {
  final double height;

  const ImgLogo({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image(
          height: height, image: const AssetImage('assets/images/micro.png')),
    );
  }
}
