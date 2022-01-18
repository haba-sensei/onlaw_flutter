// // ignore_for_file: avoid_print

// import 'dart:convert';
// import 'package:empaquesparati/core/utils/shared_pref.dart';
// import 'package:empaquesparati/data/source/remote/env_remote.dart';
// import 'package:empaquesparati/data/source/response_api.dart';
// import 'package:empaquesparati/modules/product/domain/categories_model.dart';
// import 'package:empaquesparati/modules/product/domain/products_model.dart';
// import 'package:empaquesparati/modules/shopping/domain/cupon_model.dart';
// import 'package:empaquesparati/modules/user/domain/user_model.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class ProductProvider extends GetxController {
//   final String _url = Environment.apiConexion;
//   final String _api = '/api';
//   final String _prefix = '/general';
//   UserModel sessionUser = UserModel();
//   final SharedPref _sharedPref = SharedPref();

//   @override
//   void onInit() async {
//     sessionUser = UserModel.fromJson(await _sharedPref.read('user') ?? {});
//     super.onInit();
//   }

//   Future<List<ProductModel>> getProducts() async {
//     try {
//       Uri url = Uri.http(_url, '$_api$_prefix/productShuffle');

//       var token = sessionUser.deviceToken;

//       Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

//       final res = await http.get(url, headers: headers);

//       if (res.statusCode == 401) {
//         SharedPref().logout();
//       }

//       final data = json.decode(res.body);

//       ProductModel product = ProductModel.fromJsonList(data);

//       return product.toList;
//     } catch (e) {
//       // ignore: avoid_print
//       print('Errors $e');
//       return [];
//     }
//   }

//   Future<ResponseApi?> getCupon(String code) async {
//     try {
//       Uri url = Uri.http(_url, '$_api/trans/checkcupon/$code');

//       var token = sessionUser.deviceToken;

//       Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

//       final res = await http.get(url, headers: headers);

//       if (res.statusCode == 401) {
//         SharedPref().logout();
//       }
//       print(res.body);
//       final data = json.decode(res.body);

//       ResponseApi responseApi = ResponseApi.fromJson(data);

//       return responseApi;
//     } catch (e) {
//       print('Errors $e');
//       return null;
//     }
//   }
// }
