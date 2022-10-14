// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    this.status,
    this.message,
    this.errors,
    this.data,
  });

  bool? status;
  String? message;
  dynamic? errors;
  List<Datum>? data;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        status: json["status"],
        message: json["message"],
        errors: json["errors"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "errors": errors,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.menuId,
    this.menuCode,
    this.menuName,
    this.menuGroup,
    this.menuStatus,
    this.iconCode,
  });

  int? menuId;
  String? menuCode;
  String? menuName;
  String? menuGroup;
  String? menuStatus;
  String? iconCode;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        menuId: json["MenuID"],
        menuCode: json["MenuCode"],
        menuName: json["MenuName"],
        menuGroup: json["MenuGroup"],
        menuStatus: json["MenuStatus"],
        iconCode: json["IconCode"],
      );

  Map<String, dynamic> toJson() => {
        "MenuID": menuId,
        "MenuCode": menuCode,
        "MenuName": menuName,
        "MenuGroup": menuGroup,
        "MenuStatus": menuStatus,
        "IconCode": iconCode,
      };
}
