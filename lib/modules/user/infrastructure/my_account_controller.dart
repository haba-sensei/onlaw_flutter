// import 'package:empaquesparati/core/utils/colors.dart';
// import 'package:empaquesparati/core/utils/shared_pref.dart';
// import 'package:empaquesparati/data/provider/users_provider.dart';
// import 'package:empaquesparati/data/source/response_api.dart';
// import 'package:empaquesparati/modules/user/domain/direction_model.dart';
// import 'package:empaquesparati/modules/user/domain/user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MyAccountController extends GetxController {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();

//   UsersProvider usersProvider = UsersProvider();
//   final SharedPref _sharedPref = SharedPref();
//   UserModel? user;
//   DirectionModel? myDirection;

//   @override
//   Future<void> onInit() async {
//     UserModel user = UserModel.fromJson(await _sharedPref.read('user') ?? {});

//     nameController.text = user.name.toString().trim();
//     emailController.text = user.email.toString().trim();

//     usersProvider.onInit();
//     super.onInit();
//   }

//   updateAccount() async {
//     String name = nameController.text.trim();
//     String email = emailController.text.trim();

//     if (name.isEmpty || email.isEmpty) {
//       Get.snackbar('Detalle del error: ', 'Campos Vacios',
//           backgroundColor: MyColors.rojoPastel,
//           colorText: Colors.white,
//           snackStyle: SnackStyle.FLOATING,
//           isDismissible: true,
//           icon: const Icon(
//             Icons.error_outlined,
//             size: 37,
//             color: Colors.white,
//           ),
//           onTap: (_) => Get.back(),
//           duration: const Duration(seconds: 3),
//           shouldIconPulse: true,
//           snackPosition: SnackPosition.TOP);

//       return;
//     }

//     UserModel updateUser = UserModel(name: name, email: email, deviceToken: user?.deviceToken);

//     ResponseApi? responseApi = await usersProvider.updateUser(updateUser);

//     if (responseApi!.success) {
//       UserModel user = UserModel.fromJson(responseApi.data);
//       _sharedPref.save('user', user.toJson());

//       Get.snackbar('Detalles del mensaje: ', 'Actualizado con exito',
//           backgroundColor: MyColors.verdeFull,
//           colorText: Colors.white,
//           snackStyle: SnackStyle.FLOATING,
//           isDismissible: true,
//           icon: const Icon(
//             Icons.add_reaction_outlined,
//             size: 37,
//             color: Colors.white,
//           ),
//           onTap: (_) => Get.back(),
//           duration: const Duration(seconds: 3),
//           shouldIconPulse: true,
//           snackPosition: SnackPosition.TOP);
//     } else {
//       Get.snackbar('Detalles del mensaje: ', responseApi.message,
//           backgroundColor: MyColors.rojoPastel,
//           colorText: Colors.white,
//           snackStyle: SnackStyle.FLOATING,
//           isDismissible: true,
//           icon: const Icon(
//             Icons.add_reaction_outlined,
//             size: 37,
//             color: Colors.white,
//           ),
//           onTap: (_) => Get.back(),
//           duration: const Duration(seconds: 3),
//           shouldIconPulse: true,
//           snackPosition: SnackPosition.TOP);
//     }
//     update();
//   }
// }
