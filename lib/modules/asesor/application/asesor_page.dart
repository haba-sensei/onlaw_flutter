import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/global/widgets/botton_nav_bar.dart';
import 'package:onlaw/global/widgets/custom_app_bar.dart';
import 'package:onlaw/global/widgets/custom_drawer.dart';
import 'package:onlaw/modules/asesor/domain/solicitud_model.dart';
import 'package:onlaw/modules/asesor/infrastructure/asesor_controller.dart';
import 'package:onlaw/routes/routes_names.dart';
import 'package:onlaw/shared/domain/menu_content_model.dart';

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
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          const Center(
                            child: Text(
                              'Elige un Area de Contenido',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: _.area.length,
                              itemBuilder: (context, index) {
                                return listasArea(_.area[index]);
                              }),
                        ],
                      )),
                );
              },
              backgroundColor: MyColors.blackSecundario,
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Icon(
                  Icons.add_comment_rounded,
                  color: MyColors.mainColorOrange,
                  size: 35,
                ),
              ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: MyColors.mainColorOrange,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: const Center(
                      child: Text(
                        'Mis Chats Activos',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: _.solicitudes.length,
                      itemBuilder: (context, index) {
                        return listasChat(_.solicitudes[index]);
                      })
                ],
              ),
            ));
      },
    );
  }
}

Widget listasChat(SolicitudModel solicitud) {
  return BounceInUp(
    child: GestureDetector(
      onTap: () {
        solicitud.abogado != null
            ? Get.toNamed(Routes.chat, arguments: solicitud)
            : Get.defaultDialog(
                title: "\n SOLICITUD NO ASIGNADA",
                titleStyle: const TextStyle(color: Colors.white, fontSize: 16),
                backgroundColor: MyColors.blackSecundario,
                barrierDismissible: true,
                radius: 20.0,
                content: Container(),
                onConfirm: () {
                  Get.back();
                  Get.find<AsesorController>().listMyChats();
                },
                textConfirm: 'Aceptar',
                confirmTextColor: Colors.white,
              );
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: MyColors.grisMain,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: CircleAvatar(
                backgroundColor: solicitud.abogado != null ? Colors.green : Colors.red,
                radius: 30,
                child: Icon(
                  solicitud.abogado != null ? Icons.mark_chat_read_outlined : Icons.access_time,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            SizedBox(
              width: Get.mediaQuery.size.width * 0.6,
              child: Text(
                solicitud.nombre.toString(),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget listasArea(MenuContentModel area) {
  return GetBuilder<AsesorController>(
      init: AsesorController(),
      builder: (_) {
        return GestureDetector(
          onTap: () {
            Get.back();
            Get.defaultDialog(
              title: "CONFIRMAR SOLICITUD \n DE ASESORIA",
              titleStyle: const TextStyle(color: Colors.white, fontSize: 16),
              backgroundColor: MyColors.blackSecundario,
              barrierDismissible: true,
              radius: 20.0,
              content: Container(),
              onCancel: () {},
              textCancel: 'CANCELAR',
              onConfirm: () {
                _.solicitar(area.id.toString());
                Get.back();
              },
              textConfirm: 'CONFIRMAR',
              confirmTextColor: Colors.white,
            );
          },
          child: Container(
            margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: MyColors.grisMain,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Text(
              area.nombre.toString(),
              style: TextStyle(color: MyColors.blancoPastel, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        );
      });
}
