part of 'models.dart';

CadeteModel cadeteModelFromJson(String str) =>
    CadeteModel.fromJson(json.decode(str));

String cadeteModelToJson(CadeteModel data) => json.encode(data.toJson());

class CadeteModel {
  CadeteModel({
    required this.statusCode,
    required this.message,
    required this.dataCadete,
  });

  int statusCode;
  String message;
  List<DataCadete> dataCadete;

  factory CadeteModel.fromJson(Map<String, dynamic> json) =>
      CadeteModel(
        statusCode: json["status_code"],
        message: json["message"],
        dataCadete: List<DataCadete>.from(
            json["result"].map((x) => DataCadete.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "status_code": statusCode,
        "message": message,
        "result": List<dynamic>.from(dataCadete.map((x) => x.toJson())),
      };
}

class DataCadete {
  DataCadete({
    required this.person,
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
    required this.situation,
  });

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
  dynamic situation;

  factory DataCadete.empty()=>
      DataCadete(person: Person.empty(),
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
          situation: "");

  factory DataCadete.fromJson(Map<String, dynamic> json) =>
      DataCadete(
        person: Person.fromJson(json["person"]),
        height: ParseModel.parseToDouble( json["height"]),
        bloodType: json["bloodType"],
        driverLicense: json["driverLicense"],
        civilStatus: json["civilStatus"],
        numberChildren: ParseModel.parseToInt( json["numberChildren"]),
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
        promotion: json["promotion"],
        situation: json["situation"],
      );

  Map<String, dynamic> toJson() =>
      {
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
  Person({
    required this.id,
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
  });


  int id;
  String dni;
  String names;
  String lastName;
  String secondName;
  String address;
  String email;
  String provinceDomicile;
  String cantonDomicile;
  String parroquiaDomicile;
  String sex;
  String cellphone;

  factory Person.empty()=>
      Person(id: 0,
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
          sex: "");

  factory Person.fromJson(Map<String, dynamic> json) =>
      Person(
        id: json["id"],
        dni: json["dni"],
        names: json["names"],
        lastName: json["lastName"],
        secondName: json["secondName"],
        address: json["address"],
        email: json["email"],
        provinceDomicile: json["provinceDomicile"],
        cantonDomicile: json["cantonDomicile"],
        parroquiaDomicile: json["parroquiaDomicile"],
        sex: json["sex"],
        cellphone: json["cellphone"],
      );

  Map<String, dynamic> toJson() =>
      {
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
