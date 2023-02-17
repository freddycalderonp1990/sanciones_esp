part of 'models.dart';

CadeteModel cadeteModelFromJson(String str) =>
    CadeteModel.fromJson(json.decode(str));

class CadeteModel {
  CadeteModel({
    required this.statusCode,
    required this.message,
    required this.dataCadete,
  });

  int statusCode;
  String message;
  DataCadete dataCadete;

  factory CadeteModel.fromJson(Map<String, dynamic> json) => CadeteModel(
        statusCode: json["status_code"],
        message: json["message"],
        dataCadete: DataCadete.fromJson(json["result"]),
      );
}

class DataCadete {
  DataCadete(
      {required this.person,
      required this.height,
      required this.bloodType,
      required this.driverLicense,
      required this.civilStatus,
      required this.numberChildren,
      required this.instructionLevel,
      required this.titleSecondary,
      required this.titleThirdLevel,
      required this.senescytThirdLevel,
      required this.titleFourthLevel,
      required this.senescytFourthLevel,
      required this.observation,
      required this.domesticCalamities,
      required this.dateEntryEsp,
      required this.bankAccount,
      required this.bankingEntity,
      required this.bankAccountType,
      required this.legalRepresentantiveNames,
      required this.legalRepresentativeTelephone,
      required this.immediateFamilyNames,
      required this.immediateFamilyTelephone,
      required this.antiquity,
      required this.promotion,
      required this.section,
      required this.situation,
      required this.image});

  Person person;
  double height;
  String bloodType;
  String driverLicense;
  dynamic civilStatus;
  int numberChildren;
  dynamic instructionLevel;
  dynamic titleSecondary;
  dynamic titleThirdLevel;
  dynamic senescytThirdLevel;
  dynamic titleFourthLevel;
  dynamic senescytFourthLevel;
  dynamic observation;
  dynamic domesticCalamities;
  dynamic dateEntryEsp;
  dynamic bankAccount;
  dynamic bankingEntity;
  dynamic bankAccountType;
  dynamic legalRepresentantiveNames;
  dynamic legalRepresentativeTelephone;
  dynamic immediateFamilyNames;
  dynamic immediateFamilyTelephone;
  dynamic antiquity;
  String promotion;
  String section;
  dynamic situation;
  String image;

  factory DataCadete.empty() => DataCadete(
      person: Person.empty(),
      height: 0,
      bloodType: "",
      driverLicense: "",
      civilStatus: "",
      numberChildren: 0,
      instructionLevel: "",
      titleSecondary: "",
      titleThirdLevel: "",
      senescytThirdLevel: "",
      titleFourthLevel: "",
      senescytFourthLevel: "",
      observation: "",
      domesticCalamities: "",
      dateEntryEsp: "",
      bankAccount: "",
      bankingEntity: "",
      bankAccountType: "",
      legalRepresentantiveNames: "",
      legalRepresentativeTelephone: "",
      immediateFamilyNames: "",
      immediateFamilyTelephone: "",
      antiquity: "",
      promotion: "",
      section: "",
      situation: "",
      image: '');

  factory DataCadete.fromJson(Map<String, dynamic> json) => DataCadete(
      person: Person.fromJson(json["person"]),
      height: ParseModel.parseToDouble(json["height"]),
      bloodType: json["bloodType"],
      driverLicense: json["driverLicense"],
      civilStatus: json["civilStatus"],
      numberChildren: ParseModel.parseToInt(json["numberChildren"]),
      instructionLevel: json["instructionLevel"],
      titleSecondary: json["titleSecondary"],
      titleThirdLevel: json["titleThirdLevel"],
      senescytThirdLevel: json["senescytThirdLevel"],
      titleFourthLevel: json["titleFourthLevel"],
      senescytFourthLevel: json["senescytFourthLevel"],
      observation: json["observation"],
      domesticCalamities: json["domesticCalamities"],
      dateEntryEsp: json["dateEntryESP"],
      bankAccount: json["bankAccount"],
      bankingEntity: json["bankingEntity"],
      bankAccountType: json["bankAccountType"],
      legalRepresentantiveNames: json["legalRepresentantiveNames"],
      legalRepresentativeTelephone: json["legalRepresentativeTelephone"],
      immediateFamilyNames: json["immediateFamilyNames"],
      immediateFamilyTelephone: json["immediateFamilyTelephone"],
      antiquity: json["antiquity"],
      promotion: ParseModel.parseToString(json["promotion"]),
      section: ParseModel.parseToString(json["section"]),
      situation: json["situation"],
      image: ParseModel.parseToString(json["image"]));

  Map<String, dynamic> toJson() => {
        "person": person.toJson(),
        "height": height,
        "bloodType": bloodType,
        "driverLicense": driverLicense,
        "civilStatus": civilStatus,
        "numberChildren": numberChildren,
        "instructionLevel": instructionLevel,
        "titleSecondary": titleSecondary,
        "titleThirdLevel": titleThirdLevel,
        "senescytThirdLevel": senescytThirdLevel,
        "titleFourthLevel": titleFourthLevel,
        "senescytFourthLevel": senescytFourthLevel,
        "observation": observation,
        "domesticCalamities": domesticCalamities,
        "dateEntryESP": dateEntryEsp,
        "bankAccount": bankAccount,
        "bankingEntity": bankingEntity,
        "bankAccountType": bankAccountType,
        "legalRepresentantiveNames": legalRepresentantiveNames,
        "legalRepresentativeTelephone": legalRepresentativeTelephone,
        "immediateFamilyNames": immediateFamilyNames,
        "immediateFamilyTelephone": immediateFamilyTelephone,
        "antiquity": antiquity,
        "promotion": promotion,
        "situation": situation,
      };
}

class Person {
  Person(
      {required this.id,
      required this.dni,
      required this.names,
      required this.lastName,
      required this.secondName,
      required this.address,
      required this.email,
      required this.provinceDomicile,
      required this.cantonDomicile,
      required this.parroquiaDomicile,
      required this.sex,
      required this.cellphone,
      required this.namesComplete});

  int id;
  String dni;
  String names;
  String namesComplete;
  String lastName;
  String secondName;
  String address;
  String email;
  String provinceDomicile;
  String cantonDomicile;
  String parroquiaDomicile;
  String sex;
  String cellphone;

  factory Person.empty() => Person(
      id: 0,
      address: "",
      cantonDomicile: "",
      cellphone: "",
      dni: "",
      email: "",
      lastName: "",
      names: "",
      parroquiaDomicile: "",
      provinceDomicile: "",
      secondName: "",
      sex: "",
      namesComplete: "");

  factory Person.fromJson(Map<String, dynamic> json) => Person(
      id: ParseModel.parseToInt(json["id"]),
      dni: ParseModel.parseToString(json["dni"]),
      names: ParseModel.parseToString(json["names"]),
      lastName: ParseModel.parseToString(json["lastName"]),
      secondName: ParseModel.parseToString(json["secondName"]),
      address: ParseModel.parseToString(json["address"]),
      email: ParseModel.parseToString(json["email"]),
      provinceDomicile: ParseModel.parseToString(json["provinceDomicile"]),
      cantonDomicile: ParseModel.parseToString(json["cantonDomicile"]),
      parroquiaDomicile: ParseModel.parseToString(json["parroquiaDomicile"]),
      sex: ParseModel.parseToString(json["sex"]),
      cellphone: ParseModel.parseToString(json["cellphone"]),
      namesComplete: ParseModel.parseToString(json["names"]) +
          " " +
          ParseModel.parseToString(json["lastName"]) +
          " " +
          ParseModel.parseToString(json["secondName"]));

  Map<String, dynamic> toJson() => {
        "id": id,
        "dni": dni,
        "names": names,
        "lastName": lastName,
        "secondName": secondName,
        "address": address,
        "email": email,
        "provinceDomicile": provinceDomicile,
        "cantonDomicile": cantonDomicile,
        "parroquiaDomicile": parroquiaDomicile,
        "sex": sex,
        "cellphone": cellphone,
      };
}
