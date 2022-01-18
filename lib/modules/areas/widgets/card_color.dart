import 'package:flutter/material.dart';

class CardColor extends StatelessWidget {
  const CardColor({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.4,
      width: double.infinity,
      color: color,
    );
  }
}
