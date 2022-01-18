import 'dart:convert';

AttachModel attachModelFromJson(String str) => AttachModel.fromJson(json.decode(str));

String attachModelToJson(AttachModel data) => json.encode(data.toJson());

class AttachModel {
  String? id;
  String? urlAttach;
  String? titulo;
  List<AttachModel> toList = [];

  AttachModel({
    required this.id,
    required this.urlAttach,
    required this.titulo,
  });

  factory AttachModel.fromJson(Map<String, dynamic> json) => AttachModel(
        id: json["id"] is int ? json["id"].toString() : json["id"],
        urlAttach: json["url_attach"],
        titulo: json["titulo"],
      );

  AttachModel.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      AttachModel attachs = AttachModel.fromJson(item);
      toList.add(attachs);
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "url_attach": urlAttach,
        "titulo": titulo,
      };
}
