part of 'models.dart';

List<SancionesModel> sancionesModelFromJson(String str) => List<SancionesModel>.from(json.decode(str).map((x) => SancionesModel.fromJson(x)));

String sancionesModelToJson(List<SancionesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SancionesModel {
  SancionesModel({
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

  factory SancionesModel.fromJson(Map<String, dynamic> json) => SancionesModel(
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




