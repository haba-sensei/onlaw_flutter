import 'dart:convert';

SolicitudModel solicitudModelFromJson(String str) => SolicitudModel.fromJson(json.decode(str));

String solicitudModelToJson(SolicitudModel data) => json.encode(data.toJson());

class SolicitudModel {
  String? id;
  String? abogado;
  String? esp;
  String? cliente;
  String? chatId;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? fullname;
  String? nombre;
  List<SolicitudModel> toList = [];

  SolicitudModel({
    this.id,
    this.abogado,
    this.esp,
    this.cliente,
    this.chatId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.fullname,
    this.nombre,
  });

  SolicitudModel.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      SolicitudModel solicitudes = SolicitudModel.fromJson(item);

      toList.add(solicitudes);
    }
  }

  factory SolicitudModel.fromJson(Map<String, dynamic> json) => SolicitudModel(
        id: json["id"] is int ? json["id"].toString() : json["id"],
        abogado: json["abogado"] is int ? json["abogado"].toString() : json["abogado"],
        esp: json["esp"] is int ? json["esp"].toString() : json["esp"],
        cliente: json["cliente"] is int ? json["cliente"].toString() : json["cliente"],
        chatId: json["chat_id"] is int ? json["chat_id"].toString() : json["chat_id"],
        status: json["status"] is int ? json["status"].toString() : json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        fullname: json["fullname"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "abogado": abogado,
        "esp": esp,
        "cliente": cliente,
        "chat_id": chatId,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "fullname": fullname,
        "nombre": nombre,
      };
}
