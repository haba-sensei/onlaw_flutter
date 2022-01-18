import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String usersModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String? id;
  String? document;
  String? numDocument;
  String? fullname;
  String? dniPasaporte;
  String? email;
  String? telefono;
  String? direccion;
  String? password;
  String? deviceToken;

  UserModel(
      {this.id,
      this.document,
      this.numDocument,
      this.fullname,
      this.dniPasaporte,
      this.email,
      this.telefono,
      this.direccion,
      this.password,
      this.deviceToken});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["id"] is int ? json["id"].toString() : json["id"],
      document: json["document"],
      numDocument: json["num_document"],
      fullname: json["fullname"],
      dniPasaporte: json["dni_pasaporte"],
      email: json["email"],
      telefono: json["telefono"],
      direccion: json["direccion"],
      password: json["password"],
      deviceToken: json["device_token"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "document": document,
        "num_document": numDocument,
        "fullname": fullname,
        "dni_pasaporte": dniPasaporte,
        "email": email,
        "telefono": telefono,
        "direccion": direccion,
        "password": password,
        "device_token": deviceToken,
      };
}
