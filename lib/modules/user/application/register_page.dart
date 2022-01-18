// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/global/widgets/dropdown_principal.dart';
import 'package:onlaw/global/widgets/input_principal.dart';
import 'package:onlaw/modules/user/infrastructure/register_controller.dart';
import 'package:onlaw/routes/routes_names.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = ['RUC', 'CEDULA']; 

    double mediaQueryPaddingTop = Get.mediaQuery.padding.top + 20.0;
    return GetBuilder<RegisterController>(
        init: RegisterController(),
        builder: (_) { 
          return GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Scaffold(
                extendBody: true,
                body: 
                Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: MyColors.blackBasico,
                        image: const DecorationImage(
                            image: AssetImage("assets/image/login-bg.jpg"),
                            fit: BoxFit.cover)),
                    child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                              Color.fromRGBO(0, 0, 0, 0.9),
                              Color.fromRGBO(0, 0, 0, 0.5)
                            ],
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter)),
                        height: double.infinity,
                        width: double.infinity,
                        child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: mediaQueryPaddingTop),
                                  child: Text(
                                    "Onlaw",
                                    style: TextStyle(
                                        fontFamily: "Lemon",
                                        color: MyColors.mainColorOrange,
                                        fontSize: 39.0,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0, top: 20.0),
                                  child: DropDownPrincipal(
                                    value: _.documentController,
                                    icon: Icon(Icons.web_stories,
                                        color: MyColors.mainColorOrange),
                                    items: items.toList(),
                                    onChanged: (value) {
                                      _.documentController = value;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0, top: 20.0),
                                  child: InputPrincipal(
                                      widgetIcon: Icon(
                                          Icons.featured_play_list_sharp,
                                          color: MyColors.mainColorOrange),
                                      controller: _.numDocumentController,
                                      hint: 'Nro. Documento',
                                      obscure: false,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.start),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0, top: 20.0),
                                  child: InputPrincipal(
                                      widgetIcon: Icon(Icons.person_pin_rounded,
                                          color: MyColors.mainColorOrange),
                                      controller: _.fullnameController,
                                      hint: 'Nombre Completo',
                                      obscure: false,
                                      keyboardType: TextInputType.text,
                                      textAlign: TextAlign.start),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0, top: 20.0),
                                  child: InputPrincipal(
                                      widgetIcon: Icon(Icons.web_rounded,
                                          color: MyColors.mainColorOrange),
                                      controller: _.dniPasaporteController,
                                      hint: 'Dni / Pasaporte',
                                      obscure: false,
                                      keyboardType: TextInputType.number,
                                      textAlign: TextAlign.start),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0, top: 20.0),
                                  child: InputPrincipal(
                                      widgetIcon: Icon(Icons.email,
                                          color: MyColors.mainColorOrange),
                                      controller: _.emailController,
                                      hint: 'Email',
                                      obscure: false,
                                      keyboardType: TextInputType.emailAddress,
                                      textAlign: TextAlign.start),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0, top: 20.0),
                                  child: InputPrincipal(
                                      widgetIcon: Icon(Icons.phone,
                                          color: MyColors.mainColorOrange),
                                      controller: _.telefonoController,
                                      hint: 'Telefono / Celular',
                                      obscure: false,
                                      keyboardType: TextInputType.phone,
                                      textAlign: TextAlign.start),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0, top: 20.0),
                                  child: InputPrincipal(
                                      widgetIcon: Icon(Icons.directions_rounded,
                                          color: MyColors.mainColorOrange),
                                      controller: _.direccionController,
                                      hint: 'Dirección',
                                      obscure: false,
                                      keyboardType: TextInputType.text,
                                      textAlign: TextAlign.start),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0, top: 20.0),
                                  child: InputPrincipal(
                                      widgetIcon: Icon(Icons.vpn_key,
                                          color: MyColors.mainColorOrange),
                                      controller: _.passwordController,
                                      hint: 'Password',
                                      obscure: true,
                                      keyboardType: TextInputType.text,
                                      textAlign: TextAlign.start),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0, top: 20.0),
                                  child: InputPrincipal(
                                    widgetIcon: Icon(
                                      Icons.vpn_key,
                                      color: MyColors.mainColorOrange,
                                    ),
                                    controller: _.confirmarPassController,
                                    hint: 'Confirmar',
                                    obscure: true,
                                    keyboardType: TextInputType.text,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0, top: 40.0),
                                  child: GestureDetector(
                                    onTap: () => _.register(),
                                    child: Container(
                                      height: 52.0,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(0.0)),
                                        color: MyColors.mainColorOrange,
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Registrate",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 20.0,
                                              letterSpacing: 1.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.offNamed(Routes.login);
                                    },
                                    child: Container(
                                      height: 52.0,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                        border: Border.all(
                                          color: MyColors.mainColorOrange,
                                          width: 1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Login",
                                          style: TextStyle(
                                              color: MyColors.mainColorOrange,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                              letterSpacing: 1.2),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 40.0,
                                ),
                              ],
                            )))),
              ));
        });
  }
}
