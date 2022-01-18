import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/global/widgets/botton_nav_bar.dart';
import 'package:onlaw/global/widgets/custom_app_bar.dart';
import 'package:onlaw/global/widgets/custom_drawer.dart';
import 'package:onlaw/modules/areas/widgets/main_contenido.dart';
import 'package:onlaw/modules/home/infrastructure/home_controller.dart'; 
import 'package:onlaw/routes/routes_names.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          extendBody: true,
          backgroundColor: MyColors.blackBasico,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: const CustomAppBar(),
          ),
          drawer: const DrawerLayout(
            page: 'HOME',
          ),
          bottomNavigationBar: const CustomBottonNavBar(), 
          body: SafeArea(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 15),
            MainContenido(ruta: Routes.contenidoArea, lista: _.area),
            const SizedBox(height: 25),
          ])),
        );
      },
    );
  }
}
