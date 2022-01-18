// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:mi_primer_delivery/src/api/environment.dart';
// import 'package:mi_primer_delivery/src/models/opcion.dart';
// import 'package:mi_primer_delivery/src/models/response_api.dart';
// import 'package:mi_primer_delivery/src/models/user.dart';
// import 'package:http/http.dart' as http;
// import 'package:mi_primer_delivery/src/utils/custom_snack_bar.dart';
// import 'package:mi_primer_delivery/src/utils/shared_pref.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';

// class OpcionesProvider {
//   String _url = Environment.API_DELIVERY;
//   String _api = '/api/opciones';

//   BuildContext context;
//   User sessionUser;

//   Future init(BuildContext context, User sessionUser) async {
//     this.context = context;
//     this.sessionUser = sessionUser;
//   }

//    Future<List<Opcion>> getAll(String id) async {
//     try {
//       Uri url = Uri.http(_url, '$_api/getAll/$id');

//       Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': sessionUser.sessionToken};

//       final res = await http.get(url, headers: headers);

//       if (res.statusCode == 401) {
//         showTopSnackBar(
//           context,
//           CustomSnackBar.error(
//             message: 'TU SESSION EXPIRO',
//           ),
//         );
//         new SharedPref().logout(context, sessionUser.id);
//       }

//       final data = json.decode(res.body);

//       Opcion opcion = Opcion.fromJsonList(data);
//       return opcion.toList;
//     } catch (e) {
//       print('Errors $e');
//       return [];
//     }
//   }

//    Future<ResponseApi> create(Opcion opcion) async {
//     try {
//       Uri url = Uri.http(_url, '$_api/create');

//       String bodyParams = json.encode(opcion);

//       Map<String, String> headers = {'Content-type': 'application/json', 'Authorization': sessionUser.sessionToken};

//       final res = await http.post(url, headers: headers, body: bodyParams);

//       if (res.statusCode == 401) {
//         showTopSnackBar(
//           context,
//           CustomSnackBar.error(
//             message: 'TU SESSION EXPIRO',
//           ),
//         );
//         new SharedPref().logout(context, sessionUser.id);
//       }

//       final data = json.decode(res.body);

//       ResponseApi responseApi = ResponseApi.fromJson(data);

//       return responseApi;
//     } catch (e) {
//       print('Errors $e');
//       return null;
//     }
//   }

// }
