import 'dart:convert'; 
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:onlaw/core/utils/shared_pref.dart';
import 'package:onlaw/data/source/remote/env_remote.dart';
import 'package:onlaw/modules/user/domain/user_model.dart';
import 'package:onlaw/shared/domain/menu_content_model.dart';

class ChatbotProvider extends GetxController {
  final String _url = Environment.apiConexion;
  final String _api = '/api';
  final String _prefix = '/chatbot';
  UserModel sessionUser = UserModel();
  final SharedPref _sharedPref = SharedPref();

  @override
  void onInit() async {
    sessionUser = UserModel.fromJson(await _sharedPref.read('user') ?? {});
    super.onInit();
  }


   //? primer nivel
  Future<List<MenuContentModel>> getContentChatbot(String message, nivel, zonaId) async {
    try {
      Uri url = Uri.http(_url, '$_api$_prefix');

      var token = sessionUser.deviceToken;

      Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};
      
      String bodyParams = json.encode({'message': message, 'nivel': nivel, 'zona_id' : zonaId});
      
      final res = await http.post(url, headers: headers, body: bodyParams);

      if (res.statusCode == 401) {
        SharedPref().logout();
      }

      final data = json.decode(res.body);

      MenuContentModel contentChat = MenuContentModel.fromJsonList(data);

      return contentChat.toList;
    } catch (e) {
      // print('Errors $e');
      return [];
    }
  }



}
