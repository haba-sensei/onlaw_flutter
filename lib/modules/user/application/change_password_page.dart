// import 'package:empaquesparati/core/utils/colors.dart';
// import 'package:empaquesparati/core/utils/custom_surfix_icon.dart';
// import 'package:empaquesparati/global_widgets/custom_app_bar.dart';
// import 'package:empaquesparati/global_widgets/custom_bottom_nav_bar.dart';
// import 'package:empaquesparati/global_widgets/custom_btn.dart';
// import 'package:empaquesparati/modules/user/infrastructure/change_password_controller.dart';
// import 'package:empaquesparati/modules/user/widgets/input_principal_widget.dart';
// import 'package:empaquesparati/routes/routes_names.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class ChangePasswordPage extends StatelessWidget {
//   const ChangePasswordPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ChangePasswordController>(
//       init: ChangePasswordController(),
//       builder: (_) {
//         return Scaffold(
//           extendBody: true,
//           bottomNavigationBar: const CustomBottomNavBar(selectedMenu: Routes.profile),
//           backgroundColor: const Color(0xFFF5F6F9),
//           appBar: PreferredSize(
//             preferredSize: Size.fromHeight(AppBar().preferredSize.height),
//             child: const CustomAppBar(
//               title: 'Cambiar Password',
//             ),
//           ),
//           body: SafeArea(
//               child: SingleChildScrollView(
//             padding: const EdgeInsets.only(left: 30, right: 30),
//             physics: const BouncingScrollPhysics(),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: (50 / 812.0) * Get.mediaQuery.size.height),
//                 InputPrincipal(
//                   inputheight: 1,
//                   // controller: _.nameController,
//                   obscure: true,
//                   text: 'Cambiar Password',
//                   placeholder: 'Ingresa un Password',
//                   labelcolor: MyColors.grisPastel,
//                   enabledwidth: 1,
//                   enabledcolor: MyColors.grisPastel,
//                   focusedwidth: 2,
//                   focusedcolor: MyColors.mainColor,
//                   sufix: const CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
//                 ),
//                 SizedBox(height: (50 / 812.0) * Get.mediaQuery.size.height),
//                 Container(
//                   margin: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
//                   child: DefaultButton(
//                     text: "Guardar",
//                     press: () {},
//                   ),
//                 ),
//               ],
//             ),
//           )),
//         );
//       },
//     );
//   }
// }
