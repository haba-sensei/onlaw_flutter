import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/global/widgets/botton_nav_bar.dart';
import 'package:onlaw/global/widgets/custom_app_bar.dart';
import 'package:onlaw/global/widgets/custom_drawer.dart';
import 'package:onlaw/modules/asesor/infrastructure/asesor_controller.dart';

class AsesorPage extends StatelessWidget {
  const AsesorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AsesorController>(
      init: AsesorController(),
      builder: (_) {
        return Scaffold(
            extendBody: true,
            backgroundColor: MyColors.blackBasico,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: const CustomAppBar(),
            ),
            drawer: const DrawerLayout(
              page: 'ASESOR',
            ),
            bottomNavigationBar: const CustomBottonNavBar(),
            body: SafeArea(
              child: Center(
                child: Container(
                  height: 350,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('assets/image/under_const.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
