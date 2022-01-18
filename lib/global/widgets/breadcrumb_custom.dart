import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';

class BreadcrumbCustom extends StatelessWidget {
  const BreadcrumbCustom({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      padding: const EdgeInsets.only(left: 20, right: 25),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          color: MyColors.grisMain,
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: BreadCrumb(
        items: <BreadCrumbItem>[
          BreadCrumbItem(
              onTap: () {
                Get.back();
              },
              content: Row(
                children: const [
                  Text(
                    'Regresar',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              )),
          BreadCrumbItem(
              onTap: () {},
              content: Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              )),
        ],
        divider: Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Icon(
            Icons.chevron_right,
            color: MyColors.mainColorOrange,
            size: 30,
          ),
        ),
        overflow: ScrollableOverflow(
            physics: const BouncingScrollPhysics(),
            keepLastDivider: false,
            reverse: false,
            direction: Axis.horizontal),
      ),
    );
  }
}
