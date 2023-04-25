part of 'models.dart';

CadeteModel cadeteModelFromJson(String str) =>
    CadeteModel.fromJson(json.decode(str));

String cadeteModelToJson(CadeteModel data) => json.encode(data.toJson());

class CadeteModel {
  CadeteModel({
    required this.dataCadete,
    required this.height,
    required this.bloodType,
    required this.driverLicense,

    required this.numberChildren,
    required this.instructionLevel,

    required this.promotion,
    required this.section,

    required this.image,
  });

  DataCadete dataCadete;
  int height;
  String bloodType;
  String driverLicense;

  int numberChildren;
  String instructionLevel;
  String promotion;
  String section;
  String image;

  factory CadeteModel.empty()=>
      CadeteModel(dataCadete: DataCadete.empty(),
          height: 0,
          bloodType: "",
          driverLicense: "",

          numberChildren: 0,
          instructionLevel: "",

          promotion: "",
          section: "",

          image: "");

  factory CadeteModel.fromJson(Map<String, dynamic> json) =>
      CadeteModel(
        dataCadete: DataCadete.fromJson(json["person"]),
        height: ParseModel.parseToInt(json["height"]),
        bloodType:ParseModel.parseToString( json["bloodType"]),
        driverLicense: ParseModel.parseToString(json["driverLicense"]),

        numberChildren:ParseModel.parseToInt( json["numberChildren"]),
        instructionLevel:ParseModel.parseToString( json["instructionLevel"]),
        promotion: ParseModel.parseToString(json["promotion"]),
        section: ParseModel.parseToString(json["section"]),
        image:ParseModel.parseToString( json["image"]),
      );

  Map<String, dynamic> toJson() =>
      {
        "person": dataCadete.toJson(),
        "height": height,
        "bloodType": bloodType,
        "driverLicense": driverLicense,

        "numberChildren": numberChildren,
        "instructionLevel": instructionLevel,
        "promotion": promotion,
        "section": section,
        "image": image,
      };
}

class DataCadete {
  DataCadete({
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
    required this.namesComplete
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
  String namesComplete;

  factory DataCadete.empty()=>
      DataCadete(id: 0,
          dni: "",
          names: "",
          lastName: "",
          secondName: "",
          address: "",
          email: "",
          provinceDomicile: "",
          cantonDomicile: "",
          parroquiaDomicile: "",
          sex: "",
          cellphone: "",
      namesComplete: "");

  factory DataCadete.fromJson(Map<String, dynamic> json) {

   String names=ParseModel.parseToString(  json["names"]);
   String lastName=ParseModel.parseToString(  json["lastName"]);
   String secondName=ParseModel.parseToString(  json["secondName"]);

   String namesComplete=names+" "+lastName+" "+secondName;

   return DataCadete(
      id: ParseModel.parseToInt( json["id"]),
      dni:ParseModel.parseToString( json["dni"]),
      names: names,
      lastName: lastName,
      secondName: secondName,
      namesComplete: namesComplete,
      address: ParseModel.parseToString( json["address"]),
      email: ParseModel.parseToString( json["email"]),
      provinceDomicile: ParseModel.parseToString( json["provinceDomicile"]),
      cantonDomicile:ParseModel.parseToString(  json["cantonDomicile"]),
      parroquiaDomicile:ParseModel.parseToString(  json["parroquiaDomicile"]),
      sex: ParseModel.parseToString( json["sex"]),
      cellphone: ParseModel.parseToString( json["cellphone"]),
    );
  }


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
