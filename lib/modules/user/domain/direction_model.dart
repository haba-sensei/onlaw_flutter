// To parse this JSON data, do
//
//     final directionModel = directionModelFromJson(jsonString);

import 'dart:convert';

DirectionModel directionModelFromJson(String str) =>
    DirectionModel.fromJson(json.decode(str));

String directionModelToJson(DirectionModel data) => json.encode(data.toJson());

class DirectionModel {
  String? ciudad;
  String? postal;
  String? direction;

  DirectionModel({
    required this.ciudad,
    required this.postal,
    required this.direction,
  });

  factory DirectionModel.fromJson(Map<String, dynamic> json) => DirectionModel(
        ciudad: json["ciudad"],
        postal: json["postal"],
        direction: json["direction"],
      );

  Map<String, dynamic> toJson() => {
        "ciudad": ciudad,
        "postal": postal,
        "direction": direction,
      };
}
