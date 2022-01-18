import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/routes/routes_names.dart';

class CustomBottonNavBar extends StatelessWidget {
  const CustomBottonNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: MyColors.blackSecundario,
      activeColor: MyColors.mainColorOrange,
      style: TabStyle.fixedCircle,
      items: const [
        TabItem(
          icon: Icons.home,
          title: 'Inicio',
        ),
        TabItem(icon: Icons.notifications_active, title: 'Alertas'),
        TabItem(icon: Icons.support_agent_rounded, title: 'Chatbot'),
        TabItem(icon: Icons.monetization_on, title: 'Membresia'),
        TabItem(icon: Icons.people, title: 'Perfil'),
      ],
      onTap: (int i) {
        switch (i) {
          case 0:
            Get.offNamed(Routes.home);
            break;
          case 1:
            Get.offNamed(Routes.notification);
            break;
          case 2:
            Get.offNamed(Routes.chatbot);
            break;
          case 3:
            Get.offNamed(Routes.subscription);
            break;
          case 4:
            Get.offNamed(Routes.profile);
            break;
        }
      },
      initialActiveIndex: 2,
      //optional, default as 0
    );
  }
}
