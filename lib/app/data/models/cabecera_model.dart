part of 'models.dart';


CabeceraModel cabeceraModelFromJson(String str) => CabeceraModel.fromJson(json.decode(str));

String cabeceraModelToJson(CabeceraModel data) => json.encode(data.toJson());

class CabeceraModel {
  CabeceraModel({
    required this.statusCode,
    required this.message,
  });

  int statusCode;
  String message;

  factory CabeceraModel.fromJson(Map<String, dynamic> json) => CabeceraModel(
    statusCode: json["status_code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "message": message,
  };
}
