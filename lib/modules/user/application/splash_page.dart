import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/modules/user/infrastructure/splash_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        dispose: (_) {
          // print('dispose splash');
          // CircularProgressIndicator()
        },
        builder: (_) {
          return GetBuilder<SplashController>(
              init: SplashController(),
              builder: (_) {
                return Scaffold(
                  backgroundColor: MyColors.blackSecundario,
                  body: SafeArea(
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: ExactAssetImage('assets/image/splash.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        // 220
                        Positioned(
                            bottom: 100,
                            left: Get.mediaQuery.size.width / 2.2,
                            child: CircularProgressIndicator(
                              color: MyColors.mainColorOrange,
                            )),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
