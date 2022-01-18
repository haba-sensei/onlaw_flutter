import 'package:flutter/material.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/data/delegate/search_delegate.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: MyColors.blackBasico,
      title: Text(
        "ONLAW",
        style: TextStyle(fontFamily: "Lemon", color: MyColors.mainColorOrange),
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      actionsIconTheme: const IconThemeData(color: Colors.white),
      actions: <Widget>[
        InkWell(
            onTap: () {
              showSearch(context: context, delegate: MenuSearchDelegate());
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 23.0),
              child: Icon(
                Icons.search_rounded,
                color: Colors.white,
                size: 25,
              ),
            ))
      ],
    );
  }
}
