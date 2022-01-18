// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:onlaw/core/utils/shared_pref.dart';
import 'package:onlaw/data/source/remote/env_remote.dart';
import 'package:onlaw/modules/user/domain/user_model.dart';
import 'package:onlaw/shared/domain/attach_model.dart';
import 'package:onlaw/shared/domain/images_model.dart';
import 'package:onlaw/shared/domain/menu_content_model.dart';
import 'package:onlaw/shared/domain/zones_model.dart';

class MenuContentProvider extends GetxController {
  final String _url = Environment.apiConexion;
  final String _api = '/api';
  final String _prefix = '/cont';
  UserModel sessionUser = UserModel();
  final SharedPref _sharedPref = SharedPref();

  @override
  void onInit() async {
    sessionUser = UserModel.fromJson(await _sharedPref.read('user') ?? {});
    super.onInit();
  }

  //? primer nivel
  Future<List<MenuContentModel>> getAreas() async {
    try {
      Uri url = Uri.http(_url, '$_api$_prefix/areas');

      var token = sessionUser.deviceToken;

      Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

      final res = await http.get(url, headers: headers);

      if (res.statusCode == 401) {
        SharedPref().logout();
      }
      print(token);
      final data = json.decode(res.body);

      MenuContentModel area = MenuContentModel.fromJsonList(data);

      return area.toList;
    } catch (e) {
      // print('Errors $e');
      return [];
    }
  }

  //? segundo nivel
  Future<List<MenuContentModel>> getAreasCont($id) async {
    try {
      Uri url = Uri.http(_url, '$_api$_prefix/areas_cont/' + $id);

      var token = sessionUser.deviceToken;

      Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

      final res = await http.get(url, headers: headers);

      if (res.statusCode == 401) {
        SharedPref().logout();
      }

      final data = json.decode(res.body);

      MenuContentModel areaCont = MenuContentModel.fromJsonList(data);

      return areaCont.toList;
    } catch (e) {
      // print('Errors $e');
      return [];
    }
  }

  //? tercer nivel
  Future<List<MenuContentModel>> getAreasContDet($id) async {
    try {
      Uri url = Uri.http(_url, '$_api$_prefix/areas_cont_det/' + $id);

      var token = sessionUser.deviceToken;

      Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

      final res = await http.get(url, headers: headers);

      if (res.statusCode == 401) {
        SharedPref().logout();
      }

      final data = json.decode(res.body);

      MenuContentModel areaContDet = MenuContentModel.fromJsonList(data);

      return areaContDet.toList;
    } catch (e) {
      // print('Errors $e');
      return [];
    }
  }

  //? cuarto nivel parte 1
  Future<List<MenuContentModel>> getMapa($id) async {
    try {
      Uri url = Uri.http(_url, '$_api$_prefix/mapas/-1/' + $id);

      var token = sessionUser.deviceToken;

      Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

      final res = await http.get(url, headers: headers);

      if (res.statusCode == 401) {
        SharedPref().logout();
      }

      final data = json.decode(res.body);

      MenuContentModel mapas = MenuContentModel.fromJsonList(data);

      return mapas.toList;
    } catch (e) {
      // print('Errors $e');
      return [];
    }
  }

  //? cuarto nivel parte 2
  Future<List<MenuContentModel>> getMapaPorZona($zona, $id) async {
    try {
      Uri url = Uri.http(_url, '$_api$_prefix/zona_filter/' + $zona + '/' + $id);

      var token = sessionUser.deviceToken;

      Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

      final res = await http.get(url, headers: headers);

      if (res.statusCode == 401) {
        SharedPref().logout();
      }

      final data = json.decode(res.body);

      MenuContentModel mapasPorZona = MenuContentModel.fromJsonList(data);

      return mapasPorZona.toList;
    } catch (e) {
      // print('Errors $e');
      return [];
    }
  }

  //? quinto nivel
  Future<List<MenuContentModel>> getMapaSub($id) async {
    try {
      Uri url = Uri.http(_url, '$_api$_prefix/mapas_sub/' + $id);

      var token = sessionUser.deviceToken;

      Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

      final res = await http.get(url, headers: headers);

      if (res.statusCode == 401) {
        SharedPref().logout();
      }

      final data = json.decode(res.body);

      MenuContentModel mapaSub = MenuContentModel.fromJsonList(data);

      return mapaSub.toList;
    } catch (e) {
      // print('Errors $e');
      return [];
    }
  }

  //? sexto nivel
  Future<List<MenuContentModel>> getMapaSubDet($id) async {
    try {
      Uri url = Uri.http(_url, '$_api$_prefix/mapas_sub_det/' + $id);

      var token = sessionUser.deviceToken;

      Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

      final res = await http.get(url, headers: headers);

      if (res.statusCode == 401) {
        SharedPref().logout();
      }

      final data = json.decode(res.body);

      MenuContentModel mapaSubDet = MenuContentModel.fromJsonList(data);

      return mapaSubDet.toList;
    } catch (e) {
      // print('Errors $e');
      return [];
    }
  }

  //? septimo nivel
  Future<List<MenuContentModel>> getMapaSubDetExtra($id) async {
    try {
      Uri url = Uri.http(_url, '$_api$_prefix/mapas_sub_det_extra/' + $id);

      var token = sessionUser.deviceToken;

      Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

      final res = await http.get(url, headers: headers);

      if (res.statusCode == 401) {
        SharedPref().logout();
      }

      final data = json.decode(res.body);

      MenuContentModel mapaSubDetExtra = MenuContentModel.fromJsonList(data);

      return mapaSubDetExtra.toList;
    } catch (e) {
      // print('Errors $e');
      return [];
    }
  }

  //? get all zones provincia o distrito
  Future<List<ZonesModel>> getZones($zone) async {
    try {
      Uri url = Uri.http(_url, '$_api$_prefix/zonas_func/' + $zone);

      var token = sessionUser.deviceToken;

      Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

      final res = await http.get(url, headers: headers);

      if (res.statusCode == 401) {
        SharedPref().logout();
      }

      final data = json.decode(res.body);

      ZonesModel zones = ZonesModel.fromJsonList(data);

      return zones.toList;
    } catch (e) {
      // print('Errors $e');
      return [];
    }
  }

  //? get all imgs
  Future<List<ImagesModel>> getImages($nivel, $id) async {
    try {
      Uri url = Uri.http(_url, '$_api$_prefix/imageables/' + $nivel + '/' + $id);

      var token = sessionUser.deviceToken;

      Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

      final res = await http.get(url, headers: headers);

      if (res.statusCode == 401) {
        SharedPref().logout();
      }

      final data = json.decode(res.body);

      ImagesModel images = ImagesModel.fromJsonList(data);

      return images.toList;
    } catch (e) {
      // print('Errors $e');
      return [];
    }
  }

  //? get all attachs
  Future<List<AttachModel>> getAttachs($nivel, $id) async {
    try {
      Uri url = Uri.http(_url, '$_api$_prefix/attacheable/' + $nivel + '/' + $id);

      var token = sessionUser.deviceToken;

      Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

      final res = await http.get(url, headers: headers);

      if (res.statusCode == 401) {
        SharedPref().logout();
      }

      final data = json.decode(res.body);

      AttachModel attachs = AttachModel.fromJsonList(data);

      return attachs.toList;
    } catch (e) {
      // print('Errors $e');
      return [];
    }
  }

  //? get all suggetions
  Future<List<MenuContentModel>> getSuggestions() async {
    try {
      Uri url = Uri.http(_url, '$_api$_prefix/suggestions');

      var token = sessionUser.deviceToken;

      Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': 'Bearer $token'};

      final res = await http.get(url, headers: headers);

      if (res.statusCode == 401) {
        SharedPref().logout();
      }

      final data = json.decode(res.body);

      MenuContentModel suggestions = MenuContentModel.fromJsonList(data);

      return suggestions.toList;
    } catch (e) {
      // print('Errors $e');
      return [];
    }
  }
}
