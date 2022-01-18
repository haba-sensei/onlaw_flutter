// import 'package:empaquesparati/modules/user/infrastructure/login_controller.dart';
// import 'package:empaquesparati/core/utils/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class TituloPrincipalStatico extends StatelessWidget {
//   final String text;
//   final Color color;
//   final double size;
//   final Alignment alignment;

//   const TituloPrincipalStatico({
//     Key? key,
//     required this.text,
//     required this.color,
//     required this.size,
//     required this.alignment,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//         alignment: alignment,
//         child: Text(text,
//             style:
//                 TextStyle(color: color, fontSize: size)));
//   }
// }

// class TituloPrincipalDinamico extends StatelessWidget {
//   const TituloPrincipalDinamico({Key? key})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<LoginController>(
//         id: 'text',
//         builder: (_) => TituloPrincipalStatico(
//               text: 'Ingresa en tu cuenta',
//               alignment: Alignment.centerLeft,
//               color: MyColors.grisPastel,
//               size: 20,
//             ));
//   }
// }
