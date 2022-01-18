import 'package:flutter/material.dart';
import 'package:onlaw/core/utils/colors.dart';

class InputPrincipal extends StatelessWidget {
  const InputPrincipal(
      {Key? key,
      required this.hint,
      this.controller,
      required this.keyboardType,
      required this.obscure,
      required this.textAlign,
      required this.widgetIcon})
      : super(key: key);

  final String hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscure;
  final TextAlign textAlign;
  final Widget widgetIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 58.0,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: const BorderRadius.all(Radius.circular(6.0)),
            border: Border.all(
              color: MyColors.mainColorOrange,
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
            child: Theme(
              data: ThemeData(hintColor: Colors.transparent),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  textAlign: textAlign,
                  obscureText: obscure,
                  controller: controller,
                  keyboardType: keyboardType,
                  autocorrect: false,
                  autofocus: false,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: widgetIcon,
                      ),
                      contentPadding: const EdgeInsets.all(0.0),
                      filled: true,
                      fillColor: Colors.transparent,
                      labelText: hint,
                      hintStyle: const TextStyle(color: Colors.white),
                      labelStyle: const TextStyle(
                        color: Colors.white70,
                      )),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
