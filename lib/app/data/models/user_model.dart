part of 'models.dart';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    required this.refresh,
    required this.access,
    required this.userData,
  });

  String refresh;
  String access;
  UserData userData;

  factory AuthModel.empty() => AuthModel(
      refresh: '',
      access: '',
      userData: UserData.empty());

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        refresh: json["refresh"],
        access: json["access"],
        userData: UserData.fromJson(json["user"]!=null?json["user"]:json["user_data"]),
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
        "access": access,
        "user_data": userData.toJson(),
      };
}

class UserData {
  UserData({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.isSuperuser,
    required this.groups,
    required this.permissions,
    required this.menu,
  });

  int id;
  String name;
  String username;
  String email;
  bool isSuperuser;
  List<String> groups;
  List<String> permissions;
  List<String> menu;

  factory UserData.empty() => UserData(
      id: 0,
      name: '',
      username: '',
      email: '',
      isSuperuser: false,
      groups: [],
      permissions: [],
      menu: []);

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: ParseModel.parseToInt(json["id"]),
        name: ParseModel.parseToString(json["name"]),
        username: ParseModel.parseToString(json["username"]),
        email: ParseModel.parseToString(json["email"]),
        isSuperuser: ParseModel.parseToBool(json["is_superuser"]),
        groups: List<String>.from(json["groups"].map((x) => x)),
        permissions: List<String>.from(json["permissions"].map((x) => x)),
        menu: List<String>.from(json["menu"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "is_superuser": isSuperuser,
        "groups": List<dynamic>.from(groups.map((x) => x)),
        "permissions": List<dynamic>.from(permissions.map((x) => x)),
        "menu": List<dynamic>.from(menu.map((x) => x)),
      };
}
