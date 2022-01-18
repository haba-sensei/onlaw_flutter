// import 'dart:convert';
// import 'package:empaquesparati/core/utils/shared_pref.dart';
// import 'package:empaquesparati/data/source/remote/env_remote.dart';
// import 'package:empaquesparati/modules/product/domain/categories_model.dart';
// import 'package:empaquesparati/modules/user/domain/user_model.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class CategoryProvider extends GetxController {
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

//   Future<List<CategoriesModel>> getCategories() async {
//     try {
//       Uri url = Uri.http(_url, '$_api$_prefix/categories');

//       var token = sessionUser.deviceToken;

//       Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

//       final res = await http.get(url, headers: headers);

//       if (res.statusCode == 401) {
//         SharedPref().logout();
//       }

//       final data = json.decode(res.body);

//       CategoriesModel category = CategoriesModel.fromJsonList(data);

//       return category.toList;
//     } catch (e) {
//       // ignore: avoid_print
//       print('Errors $e');
//       return [];
//     }
//   }

//   Future<List<CategoriesModel>> getCategoriesWithProds() async {
//     try {
//       Uri url = Uri.http(_url, '$_api$_prefix/catWithProd');

//       var token = sessionUser.deviceToken;

//       Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

//       final res = await http.get(url, headers: headers);

//       if (res.statusCode == 401) {
//         SharedPref().logout();
//       }

//       // ignore: avoid_print
//       print(res.body);

//       final data = json.decode(res.body);

//       CategoriesModel category = CategoriesModel.fromJsonList(data);

//       return category.toList;
//     } catch (e) {
//       // ignore: avoid_print
//       print('Errors $e');
//       return [];
//     }
//   }
// }
