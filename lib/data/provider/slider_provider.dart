// // ignore_for_file: avoid_print

// import 'dart:convert';
// import 'package:empaquesparati/core/utils/shared_pref.dart';
// import 'package:empaquesparati/data/source/remote/env_remote.dart';
// import 'package:empaquesparati/modules/home/domain/slider_model.dart';
// import 'package:empaquesparati/modules/user/domain/user_model.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class SliderProvider extends GetxController {
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

//   Future<List<SliderModel>> getSliders() async {
//     try {
//       Uri url = Uri.http(_url, '$_api$_prefix/slider');

//       var token = sessionUser.deviceToken;

//       Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

//       final res = await http.get(url, headers: headers);

//       if (res.statusCode == 401) {
//         SharedPref().logout();
//       }

//       final data = json.decode(res.body);

//       SliderModel slider = SliderModel.fromJsonList(data);

//       return slider.toList;
//     } catch (e) {
//       print('Errors $e');
//       return [];
//     }
//   }
// }
