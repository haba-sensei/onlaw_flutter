import 'package:flutter/material.dart';
import 'package:onlaw/core/utils/colors.dart';

class DetalleSheet extends StatelessWidget {
  const DetalleSheet({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.blackBasico,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              text,
              style: const TextStyle( 
                color: Colors.white70,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
