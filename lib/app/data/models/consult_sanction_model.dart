part of 'models.dart';

List<ConsultSanctionModel> consultSanctionModelFromJson(String str) =>
    List<ConsultSanctionModel>.from(
        json.decode(str).map((x) => ConsultSanctionModel.fromJson(x)));

String consultSanctionModelToJson(List<ConsultSanctionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ConsultSanctionModel {
  ConsultSanctionModel({
    required this.id,
    required this.cadet,
    required this.instructor,
    required this.code,
    required this.missingDescription,
    required this.dateSanction,
    required this.dateRegistration,
    required this.score,
    required this.isActive,
    required this.sectionPromotion,
    required this.legalRegulation,
    required this.statusSanction,
  });

  int id;
  Cadet cadet;
  Instructor instructor;
  String code;
  String missingDescription;
  String dateSanction;
  String dateRegistration;
  double score;
  bool isActive;
  int sectionPromotion;
  int legalRegulation;
  StatusSanction statusSanction;

  factory ConsultSanctionModel.fromJson(Map<String, dynamic> json) =>
      ConsultSanctionModel(
        id: json["id"],
        cadet: Cadet.fromJson(json["cadet"]),
        instructor: Instructor.fromJson(json["instructor"]),
        code: ParseModel.parseToString(json["code"]),
        missingDescription:
            ParseModel.parseToString(json["missingDescription"]),
        dateSanction: ParseModel.parseToString(json["dateSanction"]),
        dateRegistration: ParseModel.parseToString(json["dateRegistration"]),
        score: ParseModel.parseToDouble(json["score"]),
        isActive: ParseModel.parseToBool(json["isActive"]),
        sectionPromotion: ParseModel.parseToInt(json["sectionPromotion"]),
        legalRegulation: ParseModel.parseToInt(json["legalRegulation"]),
        statusSanction: StatusSanction.fromJson(json["statusSanction"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cadet": cadet.toJson(),
        "instructor": instructor.toJson(),
        "code": code,
        "missingDescription": missingDescription,
        "dateSanction": dateSanction,
        "dateRegistration": dateRegistration,
        "score": score,
        "isActive": isActive,
        "sectionPromotion": sectionPromotion,
        "legalRegulation": legalRegulation,
        "statusSanction": statusSanction,
      };
}

class StatusSanction {
  StatusSanction({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory StatusSanction.fromJson(Map<String, dynamic> json) => StatusSanction(
        id: ParseModel.parseToInt(json["id"]),
        name: ParseModel.parseToString(json["name"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Cadet {
  Cadet({
    required this.person,
    required this.promotion,
    required this.section,
    required this.promotionId,
    required this.sectionId,
    required this.situation,
  });

  Person person;

  String promotion;
  String section;
  int promotionId;
  int sectionId;
  int situation;

  factory Cadet.fromJson(Map<String, dynamic> json) => Cadet(
        person: Person.fromJson(json["person"]),
        promotion: ParseModel.parseToString(json["promotion"]),
        section: ParseModel.parseToString(json["section"]),
        promotionId: ParseModel.parseToInt(json["promotionID"]),
        sectionId: ParseModel.parseToInt(json["sectionID"]),
        situation: ParseModel.parseToInt(json["situation"]),
      );

  Map<String, dynamic> toJson() => {
        "person": person.toJson(),
        "promotion": promotion,
        "section": section,
        "promotionID": promotionId,
        "sectionID": sectionId,
        "situation": situation,
      };
}

class Person {
  Person({
    required this.id,
    required this.dni,
    required this.names,
    required this.address,
    required this.email,
    required this.provinceDomicile,
    required this.cantonDomicile,
    required this.parroquiaDomicile,
    required this.sex,
    required this.cellphone,
  });

  int id;
  String dni;
  String names;

  String address;
  String email;
  String provinceDomicile;
  String cantonDomicile;
  String parroquiaDomicile;
  String sex;
  String cellphone;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: ParseModel.parseToInt(json["id"]),
        dni: ParseModel.parseToString(json["dni"]),
        names: ParseModel.parseToString(json["names"]) +
            " " +
            ParseModel.parseToString(json["lastName"]) +
            " " +
            ParseModel.parseToString(json["secondName"]),
        address: ParseModel.parseToString(json["address"]),
        email: ParseModel.parseToString(json["email"]),
        provinceDomicile: ParseModel.parseToString(json["provinceDomicile"]),
        cantonDomicile: ParseModel.parseToString(json["cantonDomicile"]),
        parroquiaDomicile: ParseModel.parseToString(json["parroquiaDomicile"]),
        sex: ParseModel.parseToString(json["sex"]),
        cellphone: ParseModel.parseToString(json["cellphone"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dni": dni,
        "names": names,
        "address": address,
        "email": email,
        "provinceDomicile": provinceDomicile,
        "cantonDomicile": cantonDomicile,
        "parroquiaDomicile": parroquiaDomicile,
        "sex": sex,
        "cellphone": cellphone,
      };
}

class Instructor {
  Instructor({
    required this.person,
    required this.grade,
    required this.dateStart,
    required this.dateEnd,
  });

  Person person;
  String grade;
  String dateStart;
  String dateEnd;

  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
        person: Person.fromJson(json["person"]),
        grade: json["grade"],
        dateStart: json["dateStart"],
        dateEnd: json["dateEnd"],
      );

  Map<String, dynamic> toJson() => {
        "person": person.toJson(),
        "grade": grade,
        "dateStart": dateStart,
        "dateEnd": dateEnd,
      };
}
