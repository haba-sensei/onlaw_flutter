import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlaw/core/utils/colors.dart';
import 'package:onlaw/global/widgets/botton_nav_bar.dart';
import 'package:onlaw/global/widgets/custom_app_bar.dart';
import 'package:onlaw/global/widgets/custom_drawer.dart';
// import 'package:onlaw/global/widgets/dropdown_principal.dart';
// import 'package:onlaw/global/widgets/input_principal.dart';
import 'package:onlaw/modules/user/infrastructure/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (_) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            extendBody: true,
            backgroundColor: MyColors.blackBasico,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(AppBar().preferredSize.height),
              child: const CustomAppBar(),
            ),
            drawer: const DrawerLayout(
              page: 'PERFIL',
            ),
            bottomNavigationBar: const CustomBottonNavBar(),
            body: SafeArea(
              child: Center(
                child: Container(
                  height: 350,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('assets/image/under_const.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              //  SingleChildScrollView(
              //     physics: const BouncingScrollPhysics(),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: <Widget>[
              //         Padding(
              //           padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              //           child: DropDownPrincipal(
              //             value: 'RUC',
              //             // value: _.documentController,
              //             icon: Icon(Icons.web_stories, color: MyColors.mainColorOrange),
              //             items: _.items.toList(),
              //             onChanged: (value) {
              //               // _.documentController = value;
              //             },
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              //           child: InputPrincipal(
              //               widgetIcon: Icon(Icons.featured_play_list_sharp, color: MyColors.mainColorOrange),
              //               controller: _.numDocumentController,
              //               hint: 'Nro. Documento',
              //               obscure: false,
              //               keyboardType: TextInputType.number,
              //               textAlign: TextAlign.start),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              //           child: InputPrincipal(
              //               widgetIcon: Icon(Icons.person_pin_rounded, color: MyColors.mainColorOrange),
              //               // controller: _.fullnameController,
              //               hint: 'Nombre Completo',
              //               obscure: false,
              //               keyboardType: TextInputType.text,
              //               textAlign: TextAlign.start),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              //           child: InputPrincipal(
              //               widgetIcon: Icon(Icons.web_rounded, color: MyColors.mainColorOrange),
              //               // controller: _.dniPasaporteController,
              //               hint: 'Dni / Pasaporte',
              //               obscure: false,
              //               keyboardType: TextInputType.number,
              //               textAlign: TextAlign.start),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              //           child: InputPrincipal(
              //               widgetIcon: Icon(Icons.email, color: MyColors.mainColorOrange),
              //               // controller: _.emailController,
              //               hint: 'Email',
              //               obscure: false,
              //               keyboardType: TextInputType.emailAddress,
              //               textAlign: TextAlign.start),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              //           child: InputPrincipal(
              //               widgetIcon: Icon(Icons.phone, color: MyColors.mainColorOrange),
              //               // controller: _.telefonoController,
              //               hint: 'Telefono / Celular',
              //               obscure: false,
              //               keyboardType: TextInputType.phone,
              //               textAlign: TextAlign.start),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              //           child: InputPrincipal(
              //               widgetIcon: Icon(Icons.directions_rounded, color: MyColors.mainColorOrange),
              //               // controller: _.direccionController,
              //               hint: 'Dirección',
              //               obscure: false,
              //               keyboardType: TextInputType.text,
              //               textAlign: TextAlign.start),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              //           child: InputPrincipal(
              //               widgetIcon: Icon(Icons.vpn_key, color: MyColors.mainColorOrange),
              //               // controller: _.passwordController,
              //               hint: 'Password',
              //               obscure: true,
              //               keyboardType: TextInputType.text,
              //               textAlign: TextAlign.start),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              //           child: InputPrincipal(
              //             widgetIcon: Icon(
              //               Icons.vpn_key,
              //               color: MyColors.mainColorOrange,
              //             ),
              //             // controller: _.confirmarPassController,
              //             hint: 'Confirmar',
              //             obscure: true,
              //             keyboardType: TextInputType.text,
              //             textAlign: TextAlign.start,
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
              //           child: GestureDetector(
              //             // onTap: () => _.register(),
              //             onTap: () => {},
              //             child: Container(
              //               height: 52.0,
              //               width: double.infinity,
              //               decoration: BoxDecoration(
              //                 borderRadius: const BorderRadius.all(Radius.circular(0.0)),
              //                 color: MyColors.mainColorOrange,
              //               ),
              //               child: const Center(
              //                 child: Text(
              //                   "Actualizar",
              //                   style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20.0, letterSpacing: 1.0),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),

              //         const SizedBox(
              //           height: 40.0,
              //         ),
              //       ],
              //     )),
            ),
          ),
        );
      },
    );
  }
}
