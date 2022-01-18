import 'dart:convert';

Tiendas tiendasFromJson(String str) => Tiendas.fromJson(json.decode(str));

String tiendasToJson(Tiendas data) => json.encode(data.toJson());

class Tiendas {
  String id;
  String name;
  String descript;
  String logo;
  String idModulo;
  String idUser;

  Tiendas({
    required this.id,
    required this.name,
    required this.descript,
    required this.logo,
    required this.idModulo,
    required this.idUser,
  });

  factory Tiendas.fromJson(Map<String, dynamic> json) => Tiendas(
        id: json["id"] is int ? json["id"].toString() : json["id"],
        name: json["name"],
        descript: json["descript"],
        logo: json["logo"],
        idModulo: json["id_modulo"],
        idUser: json["id_user"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "descript": descript,
        "logo": logo,
        "id_modulo": idModulo,
        "id_user": idUser,
      };
}
