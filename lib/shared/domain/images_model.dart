import 'dart:convert';

ImagesModel imagesModelFromJson(String str) => ImagesModel.fromJson(json.decode(str));

String imagesModelToJson(ImagesModel data) => json.encode(data.toJson());

class ImagesModel {
  String? id;
  String? urlImagen;
  List<ImagesModel> toList = [];

  ImagesModel({
    required this.id,
    required this.urlImagen,
  });

  factory ImagesModel.fromJson(Map<String, dynamic> json) => ImagesModel(
        id: json["id"] is int ? json["id"].toString() : json["id"],
        urlImagen: json["url_imagen"],
      );

  ImagesModel.fromJsonList(List<dynamic> jsonList) {
    for (var item in jsonList) {
      ImagesModel images = ImagesModel.fromJson(item);
      toList.add(images);
    }
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "url_imagen": urlImagen,
      };
}
