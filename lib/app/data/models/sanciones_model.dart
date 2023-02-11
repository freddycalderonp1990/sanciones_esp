part of 'models.dart';

SancionesModel sancionesModelFromJson(String str) => SancionesModel.fromJson(json.decode(str));

String sancionesModelToJson(SancionesModel data) => json.encode(data.toJson());

class SancionesModel {
  SancionesModel({
    required this.statusCode,
    required this.message,
    required this.sancion,
  });

  int statusCode;
  String message;
  List<Sancion> sancion;

  factory SancionesModel.fromJson(Map<String, dynamic> json) => SancionesModel(
    statusCode: json["status_code"],
    message: json["message"],
    sancion: List<Sancion>.from(json["result"].map((x) => Sancion.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "message": message,
    "sancion": List<dynamic>.from(sancion.map((x) => x.toJson())),
  };
}

class Sancion {
  Sancion({
    required this.id,
    required this.code,
    required this.name,
    required this.description,
    required this.active,
    required this.parentId,
  });

  int id;
  String code;
  String name;
  String description;
  bool active;
  int parentId;

  factory Sancion.fromJson(Map<String, dynamic> json) => Sancion(
    id:ParseModel.parseToInt( json["id"]),
    code: ParseModel.parseToString(json["code"]),
    name: ParseModel.parseToString( json["name"]),
    description:  ParseModel.parseToString(json["description"]),
    active: ParseModel.parseToBool( json["active"]),
    parentId:ParseModel.parseToInt( json["parentId"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "name": name,
    "description": description,
    "active": active,
    "parentId": parentId,
  };
}
