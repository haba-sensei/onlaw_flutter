// import 'package:empaquesparati/core/utils/colors.dart';
// import 'package:empaquesparati/modules/product/domain/products_model.dart';
// import 'package:empaquesparati/routes/routes_names.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AddToCartVM extends GetxController {
//   List<ProductModel> lst = <ProductModel>[];
//   var sumatoria = 0.0;
//   var totalSum = 0.0;

//   bool _isItemAlreadyAdded(ProductModel product) => lst.where((item) => item.id == product.id).isNotEmpty;

//   add(product) {
//     if (_isItemAlreadyAdded(product)) {
//       Get.snackbar('Revisa el carrito: ', product.name.toString() + ' Ya esta agregado',
//           backgroundColor: MyColors.rojoPastel,
//           colorText: Colors.white,
//           snackStyle: SnackStyle.FLOATING,
//           isDismissible: true,
//           icon: const Icon(
//             Icons.info,
//             size: 37,
//             color: Colors.white,
//           ),
//           onTap: (_) => Get.back(),
//           duration: const Duration(seconds: 3),
//           shouldIconPulse: true,
//           snackPosition: SnackPosition.TOP);
//       update();
//     } else {
//       lst.add(ProductModel(
//           id: product.id,
//           name: product.name,
//           slug: product.slug,
//           extract: product.extract,
//           body: product.body,
//           stock: product.stock,
//           amount: product.amount,
//           status: product.status,
//           url: product.url,
//           gallery: product.gallery,
//           count: 1));

//       totalSum = 0.0;
//       for (var i = 0; i < lst.length; i++) {
//         totalSum += double.parse(lst[i].amount.toString()) * lst[i].count!.toInt();
//       }

//       sumatoria = totalSum;
//       Get.snackbar('Agregado con exito: ', product.name.toString() + ' Revisa el carrito',
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
//       update();
//     }
//   }

//   addCount(ProductModel product) {
//     int index = lst.indexOf(product);

//     lst[index].count.toString() != lst[index].stock.toString()
//         ? lst[index].count = product.count!.toInt() + 1
//         : Get.snackbar('Stock Exedido: ', lst[index].name.toString() + ' Stock: ' + lst[index].stock.toString(),
//             backgroundColor: MyColors.rojoPastel,
//             colorText: Colors.white,
//             snackStyle: SnackStyle.FLOATING,
//             isDismissible: true,
//             icon: const Icon(
//               Icons.info,
//               size: 37,
//               color: Colors.white,
//             ),
//             onTap: (_) => Get.back(),
//             duration: const Duration(seconds: 3),
//             shouldIconPulse: true,
//             snackPosition: SnackPosition.TOP);

//     totalSum = 0.0;
//     for (var i = 0; i < lst.length; i++) {
//       totalSum += double.parse(lst[i].amount.toString()) * lst[i].count!.toInt();
//     }
//     sumatoria = totalSum;
//     update();
//   }

//   removeCount(ProductModel product) {
//     int index = lst.indexOf(product);
//     product.count == 1 ? 1 : lst[index].count = product.count!.toInt() - 1;
//     totalSum = 0.0;
//     for (var i = 0; i < lst.length; i++) {
//       totalSum += double.parse(lst[i].amount.toString()) * lst[i].count!.toInt();
//     }
//     sumatoria = totalSum;
//     update();
//   }

//   removeItem(ProductModel product) {
//     lst.remove(product);
//     totalSum = 0.0;
//     for (var i = 0; i < lst.length; i++) {
//       totalSum += double.parse(lst[i].amount.toString()) * lst[i].count!.toInt();
//     }
//     sumatoria = totalSum;
//     update();
//   }

//   checkout() {
//     Get.offNamed(Routes.checkout);
//     // Get.toNamed(Routes.checkout);
//   }
// }
