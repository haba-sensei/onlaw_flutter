import 'package:flutter/material.dart';
import 'package:onlaw/core/utils/colors.dart';

class ItemDrawer extends StatelessWidget {
  const ItemDrawer({Key? key, required this.icon, required this.txt})
      : super(key: key);

  final IconData icon;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35.0, left: 20.0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 25.0,
            color: MyColors.mainColorOrange,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  txt,
                  style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 15.5,
                      fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 2.0),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
