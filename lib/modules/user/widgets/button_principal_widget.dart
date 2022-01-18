import 'package:flutter/material.dart';

class ButtonPrincipal extends StatelessWidget {
  final double padding;
  final double height;
  final Color color;
  final String text;
  final Color textcolor;
  final double fontsize;
  final double fontspacing;
  final Function onTap;

  const ButtonPrincipal({
    Key? key,
    required this.padding,
    required this.height,
    required this.color,
    required this.text,
    required this.textcolor,
    required this.fontsize,
    required this.fontspacing,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20.0)),
          child: Center(
              child: Text(text,
                  style: TextStyle(
                    color: textcolor,
                    fontSize: fontsize,
                    letterSpacing: fontspacing,
                  ))),
        ),
      ),
    );
  }
}
