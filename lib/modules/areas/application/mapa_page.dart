import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/global/widgets/botton_nav_bar.dart';
import 'package:onlaw/global/widgets/breadcrumb_custom.dart';
import 'package:onlaw/global/widgets/custom_app_bar.dart';
import 'package:onlaw/global/widgets/custom_drawer.dart';
import 'package:onlaw/modules/areas/infrastructure/mapa_controller.dart';
import 'package:onlaw/modules/areas/widgets/main_contenido.dart';
import 'package:onlaw/routes/routes_names.dart';

class MapaPage extends StatelessWidget {
  const MapaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapaController>(
        init: MapaController(),
        builder: (_) {
          return Scaffold(
            extendBody: true,
            backgroundColor: MyColors.blackBasico,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: const CustomAppBar(),
            ),
            drawer: const DrawerLayout(
              page: 'MAPA \nCONTENIDO',
            ),
            bottomNavigationBar: const CustomBottonNavBar(),
            body: SafeArea(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              BreadcrumbCustom(
                ruta: 'back',
                text: Get.arguments.nombre.toString(),
              ),
              const SizedBox(height: 15),
              MainContenido(ruta: Routes.mapa, lista: _.mapa)
            ])),
          );
        });
  }
}
