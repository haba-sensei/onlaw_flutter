import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/shared_pref.dart';
import 'package:onlaw/core/utils/text_style.dart';
import 'package:onlaw/global/widgets/item_drawer.dart';
import 'package:onlaw/routes/routes_names.dart';

class DrawerLayout extends StatelessWidget {
  const DrawerLayout({Key? key, required this.page}) : super(key: key);
  final String page;

  @override
  Widget build(BuildContext context) {
    final SharedPref _sharedPref = SharedPref();
    return Drawer(
        child: Container(
      color: const Color(0xFF29303C),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 200.0,
                width: 200.0,
                decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/image/round.png"))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 20.0),
                child: Text(
                  page,
                  style: MytxtStyle.titleAppbar.copyWith(color: Colors.white, fontSize: 25.0),
                ),
              ),
            ],
          ),
          Flexible(
            child: ListView(
              children: <Widget>[
                InkWell(
                    onTap: () {
                      Get.offNamed(Routes.home);
                    },
                    child: const ItemDrawer(icon: Icons.home_filled, txt: "HOME")),
                InkWell(
                    onTap: () {
                      Get.offNamed(Routes.profile);
                    },
                    child: const ItemDrawer(icon: Icons.person_pin_rounded, txt: "MI PERFIL")),
                InkWell(
                    onTap: () {
                      Get.offNamed(Routes.asesor);
                    },
                    child: const ItemDrawer(icon: Icons.chat_rounded, txt: "ASESOR LEGAL")),
                InkWell(
                    onTap: () {
                      Get.offNamed(Routes.notification);
                    },
                    child: const ItemDrawer(icon: Icons.notifications_active, txt: "NOTIFICACIÓNES")),
                InkWell(
                    onTap: () {
                      Get.offNamed(Routes.subscription);
                    },
                    child: const ItemDrawer(icon: Icons.paid_rounded, txt: "MI SUSCRIPCIÓN")),
                InkWell(
                    onTap: () {
                      _sharedPref.logout();
                    },
                    child: const ItemDrawer(icon: Icons.remove_circle, txt: "CERRAR SESSION")),
                const SizedBox(
                  height: 3.0,
                )
              ],
            ),
          ),
//
        ],
      ),
    ));
  }
}
