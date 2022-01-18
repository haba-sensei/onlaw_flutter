import 'dart:convert';

MenuContentModel menuContentModelFromJson(String str) => MenuContentModel.fromJson(json.decode(str));

String menuContentModelToJson(MenuContentModel data) => json.encode(data.toJson());

class MenuContentModel {
  String? id;
  String? nombre;
  String? detalle;
  String? color;
  String? nivel;
  List<MenuContentModel> toList = [];

  MenuContentModel({
    required this.id,
    required this.nombre,
    required this.detalle,
    required this.color,
    required this.nivel,
  });

  MenuContentModel.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      MenuContentModel area = MenuContentModel.fromJson(item);
      toList.add(area);
    }
  }

  factory MenuContentModel.fromJson(Map<String, dynamic> json) => MenuContentModel(
        id: json["id"] is int ? json["id"].toString() : json["id"],
        nombre: json["nombre"],
        detalle: json["detalle"],
        color: json["color"],
        nivel: json["nivel"] is int ? json["nivel"].toString() : json["nivel"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "detalle": detalle,
        "color": color,
        "nivel": nivel,
      };
}
