// import 'package:empaquesparati/core/utils/colors.dart';
// import 'package:empaquesparati/core/utils/shared_pref.dart';
// import 'package:empaquesparati/modules/user/domain/direction_model.dart';
// import 'package:empaquesparati/modules/user/domain/user_model.dart';
// import 'package:get/get.dart';
// import 'package:flutter/material.dart';

// class MyDirectionController extends GetxController {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();

//   TextEditingController ciudadController = TextEditingController();
//   TextEditingController postalController = TextEditingController();
//   TextEditingController directionController = TextEditingController();

//   final SharedPref _sharedPref = SharedPref();
//   UserModel? user;
//   DirectionModel? myDirection;

//   @override
//   Future<void> onInit() async {
//     DirectionModel myDirection = DirectionModel.fromJson(await _sharedPref.read('myDirection') ?? {});

//     ciudadController.text = myDirection.ciudad != null ? myDirection.ciudad.toString().trim() : 'Debe Agregar una Ciudad';
//     postalController.text =  myDirection.postal != null ? myDirection.postal.toString().trim(): 'Debe Agregar un Codigo Postal';
//     directionController.text =  myDirection.direction != null ? myDirection.direction.toString().trim(): 'Debe Agregar una Dirección';

//     super.onInit();
//   }

//   saveDirection() async {
//     String ciudad = ciudadController.text.trim();
//     String postal = postalController.text.trim();
//     String direction = directionController.text.trim();
//     if (ciudad.isEmpty || postal.isEmpty || direction.isEmpty) {
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

//     DirectionModel myDirection = DirectionModel(ciudad: ciudad, postal: postal, direction: direction);

//     _sharedPref.save('myDirection', myDirection.toJson());

//     Get.snackbar('Detalles del mensaje: ', 'Actualizado con exito',
//         backgroundColor: MyColors.verdeFull,
//         colorText: Colors.white,
//         snackStyle: SnackStyle.FLOATING,
//         isDismissible: true,
//         icon: const Icon(
//           Icons.add_reaction_outlined,
//           size: 37,
//           color: Colors.white,
//         ),
//         onTap: (_) => Get.back(),
//         duration: const Duration(seconds: 3),
//         shouldIconPulse: true,
//         snackPosition: SnackPosition.TOP);
//     update();
//   }
// }
