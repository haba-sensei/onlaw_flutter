import 'dart:convert';

ZonesModel zonesModelFromJson(String str) => ZonesModel.fromJson(json.decode(str));

String zonesModelToJson(ZonesModel data) => json.encode(data.toJson());

class ZonesModel {
  String? id;
  String? zona;
  String? modelo;
  List<ZonesModel> toList = [];

  ZonesModel({
    required this.id,
    required this.zona,
    required this.modelo,
  });

  factory ZonesModel.fromJson(Map<String, dynamic> json) => ZonesModel(
        id: json["id"] is int ? json["id"].toString() : json["id"],
        zona: json["zona"],
        modelo: json["modelo"],
      );

  ZonesModel.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      ZonesModel zones = ZonesModel.fromJson(item);
      toList.add(zones);
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "zona": zona,
        "modelo": modelo,
      };
}
