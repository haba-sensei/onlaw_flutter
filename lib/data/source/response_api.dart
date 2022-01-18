import 'dart:convert';

ResponseApi responseApiFromJson(String str) =>
    ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {
  String message = '';
  dynamic error;
  bool success = false;

  dynamic data;

  ResponseApi({
    message,
    error,
    success,
  });

//modificaciones
//ignore:
  ResponseApi.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    error = json["error"];
    success = json["success"];
    try {
      data = json['data'];
    } catch (e) {
      // ignore: avoid_print
      print('Exeption data $e');
    }
  }

/* fin */

  Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "success": success,
        "data": data,
      };
}
