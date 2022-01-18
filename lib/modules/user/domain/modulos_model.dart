import 'dart:convert';

Modulos modulosFromJson(String str) => Modulos.fromJson(json.decode(str));

String modulosToJson(Modulos data) => json.encode(data.toJson());

class Modulos {
  String id;
  String name;
  String image;
  bool state;
  String route;

  Modulos({
    required this.id,
    required this.name,
    required this.image,
    required this.state,
    required this.route,
  });

  factory Modulos.fromJson(Map<String, dynamic> json) => Modulos(
        id: json["id"] is int ? json["id"].toString() : json["id"],
        name: json["name"],
        image: json["image"],
        state: json["state"],
        route: json["route"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "state": state,
        "route": route,
      };
}
