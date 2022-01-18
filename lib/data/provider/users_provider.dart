// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:onlaw/core/utils/shared_pref.dart';
import 'package:onlaw/data/source/remote/env_remote.dart';
import 'package:onlaw/data/source/response_api.dart';
import 'package:onlaw/modules/user/domain/user_model.dart';

class UsersProvider extends GetxController {
  final String _url = Environment.apiConexion;
  final String _api = '/api';
  final String _prefix = '/auth';
  UserModel sessionUser = UserModel();
  final SharedPref _sharedPref = SharedPref();

  @override
  void onInit() async {
    sessionUser = UserModel.fromJson(await _sharedPref.read('user') ?? {});
    super.onInit();
  }

  Future<ResponseApi?> login(String email, String password) async {
    try {
      Uri url = Uri.http(_url, '$_api/login');

      String bodyParams = json.encode({'email': email, 'password': password});

      Map<String, String> headers = {'Content-type': 'application/json'};

      final res = await http.post(url, headers: headers, body: bodyParams);

      final data = json.decode(res.body);

      ResponseApi responseApi = ResponseApi.fromJson(data);

      return responseApi;
    } catch (e) {
      print('Error $e');
      return null;
    }
  }

  Future<ResponseApi?> create(UserModel user) async {
    try {
      Uri url = Uri.http(_url, '$_api/register');

      String bodyParams = json.encode(user);

      Map<String, String> headers = {'Content-type': 'application/json'};

      final res = await http.post(url, headers: headers, body: bodyParams);

      final data = json.decode(res.body);

      ResponseApi responseApi = ResponseApi.fromJson(data);

      return responseApi;
    } catch (e) {
      print('Errors $e');
      return null;
    }
  }

  Future<ResponseApi?> logout() async {
    try {
      Uri url = Uri.http(_url, '$_api$_prefix/logout');

      String bodyParams =
          json.encode({'device_token': sessionUser.deviceToken});

      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $sessionUser.deviceToken'
      };

      final res = await http.post(url, headers: headers, body: bodyParams);

      final data = json.decode(res.body);

      ResponseApi responseApi = ResponseApi.fromJson(data);

      return responseApi;
    } catch (e) {
      print('Errors $e');
      return null;
    }
  }

  Future<ResponseApi?> updateUser(UserModel user) async {
    try {
      Uri url = Uri.http(_url, '$_api$_prefix/updateUser');

      String bodyParams = json.encode(user);

      var token = sessionUser.deviceToken;

      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      final res = await http.put(url, headers: headers, body: bodyParams);

      if (res.statusCode == 401) {
        SharedPref().logout();
      }
      final data = json.decode(res.body);

      ResponseApi responseApi = ResponseApi.fromJson(data);

      return responseApi;
    } catch (e) {
      print('Errors $e');
      return null;
    }
  }

  Future<UserModel?> getUser() async {
    try {
      Uri url = Uri.http(_url, '$_api$_prefix/getUser');
      var token = sessionUser.deviceToken;
      Map<String, String> headers = {
        'Content-type': 'application/json',
        'Authorization': 'Bearer $token'
      };

      final res = await http.get(url, headers: headers);

      if (res.statusCode == 401) {
        SharedPref().logout();
      }

      final data = json.decode(res.body);

      UserModel user = UserModel.fromJson(data);

      return user;
    } catch (e) {
      print('Errors $e');
      return null;
    }
  }
}
