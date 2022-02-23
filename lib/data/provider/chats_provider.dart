import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:onlaw/core/utils/shared_pref.dart';
import 'package:onlaw/data/source/remote/env_remote.dart';
import 'package:onlaw/modules/asesor/domain/message_model.dart';
import 'package:onlaw/modules/asesor/domain/solicitud_model.dart';
import 'package:onlaw/modules/user/domain/user_model.dart';

class ChatsProvider extends GetxController {
  final String _url = Environment.apiConexion;
  final String _api = '/api';
  final String _prefix = '/chat';
  UserModel sessionUser = UserModel();
  final SharedPref _sharedPref = SharedPref();

  @override
  void onInit() async {
    sessionUser = UserModel.fromJson(await _sharedPref.read('user') ?? {});
    super.onInit();
  }

  Future<List<SolicitudModel>> getChats() async {
    try {
      Uri url = Uri.http(_url, '$_api$_prefix/list/mychat');
      var token = sessionUser.deviceToken;

      Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

      final res = await http.get(url, headers: headers);

      if (res.statusCode == 401) {
        SharedPref().logout();
      }

      final data = json.decode(res.body);

      SolicitudModel solicitud = SolicitudModel.fromJsonList(data);

      return solicitud.toList;
    } catch (e) {
      return [];
    }
  }

  Future<SolicitudModel?> solicitud(String idEsp) async {
    try {
      var token = sessionUser.deviceToken;

      Uri url = Uri.http(_url, '$_api$_prefix/solicitud/$idEsp');

      Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

      final res = await http.get(url, headers: headers);

      if (res.statusCode == 401) {
        SharedPref().logout();
      }

      final data = json.decode(res.body);

      SolicitudModel solicitud = SolicitudModel.fromJson(data);

      return solicitud;
    } catch (e) {
      return null;
    }
  }

  Future<List<MessageModel>> getMessage(String idChat) async {
    try {
      var token = sessionUser.deviceToken;

      Uri url = Uri.http(_url, '$_api$_prefix/message/$idChat');

      Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

      final res = await http.get(url, headers: headers);

      if (res.statusCode == 401) {
        SharedPref().logout();
      }

      final data = json.decode(res.body);

      MessageModel message = MessageModel.fromJsonList(data);

      //? reverse list to show last message first

      return message.toList.reversed.toList();
    } catch (e) {
      return [];
    }
  }

  Future<List<MessageModel>> send(String mensaje, abogado, sender, cliente, chatId) async {
    try {
      var token = sessionUser.deviceToken;

      Uri url = Uri.http(_url, '$_api$_prefix/send');

      Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

      String bodyParams = json.encode({
        'mensaje': mensaje,
        'abogado': abogado,
        'sender': sender,
        'cliente': cliente,
        'chat_id': chatId,
      });

      final res = await http.post(url, headers: headers, body: bodyParams);

      final data = json.decode(res.body);

      MessageModel message = MessageModel.fromJsonList(data);

      //? reverse list to show last message first

      return message.toList.reversed.toList();
    } catch (e) {
      return [];
    }
  }

  Future<bool> statusChat(String idChat) async {
    try {
      var token = sessionUser.deviceToken;

      Uri url = Uri.http(_url, '$_api$_prefix/status/$idChat');

      Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

      final res = await http.get(url, headers: headers);

      if (res.statusCode == 401) {
        SharedPref().logout();
      }
      final data = res.body.toString() == '3' ? true : false;

      return data;
    } catch (e) {
      return false;
    }
  }
}
