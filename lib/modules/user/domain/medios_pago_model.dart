import 'dart:convert';

MedioPagoModel medioPagoModelFromJson(String str) =>
    MedioPagoModel.fromJson(json.decode(str));

String medioPagoModelToJson(MedioPagoModel data) => json.encode(data.toJson());

class MedioPagoModel {
  String cardNumber;
  String expiryDate;
  String cardHolderName;
  String cvvCode;

  MedioPagoModel({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
  });

  factory MedioPagoModel.fromJson(Map<String, dynamic> json) => MedioPagoModel(
        cardNumber: json["cardNumber"],
        expiryDate: json["expiryDate"],
        cardHolderName: json["cardHolderName"],
        cvvCode: json["cvvCode"],
      );

  Map<String, dynamic> toJson() => {
        "cardNumber": cardNumber,
        "expiryDate": expiryDate,
        "cardHolderName": cardHolderName,
        "cvvCode": cvvCode,
      };
}
