// To parse this JSON data, do
//
//     final modelUser = modelUserFromJson(jsonString);

import 'dart:convert';

ModelUser modelUserFromJson(String str) => ModelUser.fromJson(json.decode(str));

String modelUserToJson(ModelUser data) => json.encode(data.toJson());

class ModelUser {
  ModelUser({
    this.message,
    this.status,
    this.tabeluser,
  });

  String message;
  int status;
  List<Tabeluser> tabeluser;

  factory ModelUser.fromJson(Map<String, dynamic> json) => ModelUser(
    message: json["message"] == null ? null : json["message"],
    status: json["status"] == null ? null : json["status"],
    tabeluser: json["tabeluser"] == null ? null : List<Tabeluser>.from(json["tabeluser"].map((x) => Tabeluser.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "status": status == null ? null : status,
    "tabeluser": tabeluser == null ? null : List<dynamic>.from(tabeluser.map((x) => x.toJson())),
  };
}

class Tabeluser {
  Tabeluser({
    this.idUser,
    this.email,
    this.fullname,
    this.password,
    this.tanggal,
    this.isActive,
  });

  String idUser;
  String email;
  String fullname;
  String password;
  DateTime tanggal;
  String isActive;

  factory Tabeluser.fromJson(Map<String, dynamic> json) => Tabeluser(
    idUser: json["id_user"] == null ? null : json["id_user"],
    email: json["email"] == null ? null : json["email"],
    fullname: json["fullname"] == null ? null : json["fullname"],
    password: json["password"] == null ? null : json["password"],
    tanggal: json["tanggal"] == null ? null : DateTime.parse(json["tanggal"]),
    isActive: json["is_active"] == null ? null : json["is_active"],
  );

  Map<String, dynamic> toJson() => {
    "id_user": idUser == null ? null : idUser,
    "email": email == null ? null : email,
    "fullname": fullname == null ? null : fullname,
    "password": password == null ? null : password,
    "tanggal": tanggal == null ? null : tanggal.toIso8601String(),
    "is_active": isActive == null ? null : isActive,
  };
}
