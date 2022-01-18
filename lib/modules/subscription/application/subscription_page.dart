// ignore_for_file: avoid_print

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/global/widgets/botton_nav_bar.dart';
import 'package:onlaw/global/widgets/custom_app_bar.dart';
import 'package:onlaw/global/widgets/custom_drawer.dart';
import 'package:onlaw/modules/subscription/infrastructure/subscription_controller.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubscriptionController>(
        init: SubscriptionController(),
        builder: (_) {
          final Color _colorText = MyColors.grisMain;
          final Color _color = MyColors.mainColorOrange;
          return Scaffold(
            extendBody: true,
            backgroundColor: MyColors.blackBasico,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: const CustomAppBar(),
            ),
            drawer: const DrawerLayout(
              page: 'MEMBRESIA',
            ),
            bottomNavigationBar: const CustomBottonNavBar(),
            body: Stack(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 32.0,
                    ),
                    SizedBox(
                        height: 250.0,
                        child: BounceInUp(
                          child: Row(
                            children: <Widget>[
                              Flexible(
                                flex: 1,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 16.0, right: 8.0, top: 64.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Flexible(
                                        flex: 6,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "3",
                                              style: TextStyle(color: _colorText, fontSize: 40.0, fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Meses",
                                              style: TextStyle(color: _colorText, fontSize: 20.0, fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              "\$10.00",
                                              style: TextStyle(color: _colorText, fontSize: 20.0, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 2.0,
                                        color: _color,
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: GestureDetector(
                                          onTap: () {
                                            _.primerPlan();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.orange[400],
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(8.0),
                                                bottomRight: Radius.circular(8.0),
                                              ),
                                            ),
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: const <Widget>[
                                                Text(
                                                  "Elegir Plan",
                                                  style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                      top: 8.0,
                                      right: 8.0,
                                      left: 8.0,
                                      bottom: 12.0,
                                      child: Container(
                                        height: 250.0,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8.0),
                                          color: _color,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 1.0, right: 1.0, top: 5.0),
                                          child: Column(
                                            children: <Widget>[
                                              SizedBox(
                                                height: 20.0,
                                                child: Center(
                                                  child: Text(
                                                    "PUPULAR".toUpperCase(),
                                                    style: const TextStyle(color: Colors.white, fontSize: 12.0, fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 4.0,
                                              ),
                                              Flexible(
                                                flex: 6,
                                                child: Container(
                                                  color: Colors.white,
                                                  child: Center(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: <Widget>[
                                                        Text(
                                                          "12",
                                                          style: TextStyle(color: _colorText, fontSize: 40.0, fontWeight: FontWeight.bold),
                                                        ),
                                                        Text(
                                                          "Meses",
                                                          style: TextStyle(color: _colorText, fontSize: 20.0, fontWeight: FontWeight.bold),
                                                        ),
                                                        const SizedBox(
                                                          height: 8.0,
                                                        ),
                                                        Text(
                                                          "\$30.00",
                                                          style: TextStyle(color: _colorText, fontSize: 20.0, fontWeight: FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                height: 2.0,
                                                color: _color,
                                              ),
                                              Flexible(
                                                flex: 3,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    print('ahsdasd');
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.orange[400],
                                                      borderRadius: const BorderRadius.only(
                                                        bottomLeft: Radius.circular(8.0),
                                                        bottomRight: Radius.circular(8.0),
                                                      ),
                                                    ),
                                                    width: double.infinity,
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: const <Widget>[
                                                        Text(
                                                          "Elegir Plan",
                                                          style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Icon(
                                        Icons.check_circle,
                                        size: 28.0,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 8.0, right: 16.0, top: 64.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Flexible(
                                        flex: 6,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              "6",
                                              style: TextStyle(color: _colorText, fontSize: 40.0, fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "Meses",
                                              style: TextStyle(color: _colorText, fontSize: 20.0, fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 8.0,
                                            ),
                                            Text(
                                              "\$20.00",
                                              style: TextStyle(color: _colorText, fontSize: 20.0, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 2.0,
                                        color: _color,
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: GestureDetector(
                                          onTap: () {
                                            print('ahsdasd');
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.orange[400],
                                              borderRadius: const BorderRadius.only(
                                                bottomLeft: Radius.circular(8.0),
                                                bottomRight: Radius.circular(8.0),
                                              ),
                                            ),
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: const <Widget>[
                                                Text(
                                                  "Elegir Plan",
                                                  style: TextStyle(color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      height: 32.0,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 18, bottom: 20),
                      child: const Text(
                        'Mi Membresia',
                        style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.w800, color: Color(0xFFFAA420), letterSpacing: 1.5),
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      child: ListView(
                        children: [opciones()],
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }
}

Widget opciones() {
  return BounceInUp(
    child: Container(
      margin: const EdgeInsets.only(left: 18, right: 18, bottom: 15),
      width: double.infinity,
      decoration: BoxDecoration(
          color: MyColors.blackSecundario,
          borderRadius:
              const BorderRadius.only(bottomRight: Radius.circular(30.0), bottomLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Get.mediaQuery.size.width * 0.65,
              child: const Text(
                ' Membresia Activa por 30 dias',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.justify,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GestureDetector(
                onTap: () {
                  // Get.defaultDialog(
                  //   title: "ELIGE UNA OPCIÓN",
                  //   titleStyle: const TextStyle(color: Colors.white, fontSize: 16),
                  //   backgroundColor: MyColors.blackSecundario,
                  //   content: DialogOpciones(item: item),
                  //   barrierDismissible: true,
                  //   radius: 20.0,
                  // );
                },
                child: CircleAvatar(
                    backgroundColor: Colors.transparent, child: Icon(Icons.access_time_filled_sharp, color: MyColors.mainColorOrange, size: 30))),
          ],
        ),
      ),
    ),
  );
}
