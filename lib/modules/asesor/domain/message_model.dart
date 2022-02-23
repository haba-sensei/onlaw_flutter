import 'dart:convert';

MessageModel messageModelFromJson(String str) => MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  String? id;
  String? mensaje;
  String? abogado;
  String? sender;
  String? cliente;
  String? chatId;
  String? createdAt;
  String? updatedAt;
  List<MessageModel> toList = [];

  MessageModel({
    required this.id,
    required this.mensaje,
    required this.abogado,
    required this.sender,
    required this.cliente,
    required this.chatId,
    required this.createdAt,
    required this.updatedAt,
  });

  MessageModel.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      MessageModel mensaje = MessageModel.fromJson(item);

      toList.add(mensaje);
    }
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        id: json["id"] is int ? json["id"].toString() : json["id"],
        mensaje: json["mensaje"],
        abogado: json["abogado"] is int ? json["abogado"].toString() : json["abogado"],
        sender: json["sender"] is int ? json["sender"].toString() : json["sender"],
        cliente: json["cliente"] is int ? json["cliente"].toString() : json["cliente"],
        chatId: json["chat_id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mensaje": mensaje,
        "abogado": abogado,
        "sender": sender,
        "cliente": cliente,
        "chat_id": chatId,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
