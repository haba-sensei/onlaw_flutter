import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/global/widgets/input_principal.dart';
import 'package:onlaw/modules/user/infrastructure/login_controller.dart';
import 'package:onlaw/routes/routes_names.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mediaQueryPaddingTop = Get.mediaQuery.padding.top + 80.0;
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (_) {
          return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Scaffold(
                extendBody: true,
                body: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: MyColors.blackBasico, image: const DecorationImage(image: AssetImage("assets/image/login-bg.jpg"), fit: BoxFit.cover)),
                    child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color.fromRGBO(0, 0, 0, 0.9), Color.fromRGBO(0, 0, 0, 0.5)],
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter)),
                        height: double.infinity,
                        width: double.infinity,
                        child: ListView(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: mediaQueryPaddingTop),
                                  child: Text(
                                    "Onlaw",
                                    style:
                                        TextStyle(fontFamily: "Lemon", color: MyColors.mainColorOrange, fontSize: 39.0, fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 100.0),
                                  child: InputPrincipal(
                                      widgetIcon: Icon(Icons.email, color: MyColors.mainColorOrange),
                                      controller: _.emailController,
                                      hint: 'Email',
                                      obscure: false,
                                      keyboardType: TextInputType.emailAddress,
                                      textAlign: TextAlign.start),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                                  child: InputPrincipal(
                                    widgetIcon: Icon(
                                      Icons.vpn_key,
                                      color: MyColors.mainColorOrange,
                                    ),
                                    controller: _.passwordController,
                                    hint: 'Password',
                                    obscure: true,
                                    keyboardType: TextInputType.emailAddress,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      _.login();
                                    },
                                    child: Container(
                                      height: 52.0,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                                        color: MyColors.mainColorOrange,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Login",
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20.0, letterSpacing: 1.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: const Text(
                                      "Perdi mi password?",
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 15.0,
                                      ),
                                    )),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.offNamed(Routes.register);
                                    },
                                    child: Container(
                                      height: 52.0,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                        border: Border.all(
                                          color: MyColors.mainColorOrange,
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Registro",
                                          style: TextStyle(
                                              color: MyColors.mainColorOrange, fontWeight: FontWeight.bold, fontSize: 18.0, letterSpacing: 1.2),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          ],
                        ))),
              ));
        });
  }
}
