// import 'package:empaquesparati/core/utils/config_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomSurffixIcon extends StatelessWidget {
  const CustomSurffixIcon({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        (20 / 375.0) * Get.mediaQuery.size.width,
        (20 / 375.0) * Get.mediaQuery.size.width,
        (20 / 375.0) * Get.mediaQuery.size.width,
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: (18 / 375.0) * Get.mediaQuery.size.width,
      ),
    );
  }
}
