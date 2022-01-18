import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/global/controllers/general_controller.dart';
import 'package:onlaw/global/widgets/botton_nav_bar.dart';
import 'package:onlaw/global/widgets/breadcrumb_custom.dart';
import 'package:onlaw/global/widgets/custom_app_bar.dart';
import 'package:onlaw/global/widgets/custom_drawer.dart';
import 'package:onlaw/global/widgets/search_contenido.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GeneralController>(
        init: GeneralController(),
        builder: (_) {
          return Scaffold(
            extendBody: true,
            backgroundColor: MyColors.blackBasico,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: const CustomAppBar(),
            ),
            drawer: const DrawerLayout(
              page: 'BUSQUEDA',
            ),
            bottomNavigationBar: const CustomBottonNavBar(),
            body: SafeArea(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              BreadcrumbCustom(
                text: Get.arguments.nombre.toString(),
              ),
              const SizedBox(height: 15),
              SearchContenido(ruta: _.manejadorRuta(Get.arguments.nivel.toString()), lista: Get.arguments)
            ])),
          );
        });
  }
}
