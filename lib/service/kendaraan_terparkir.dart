// To parse this JSON data, do
//
//     final kendaraanTerparkirResponse = kendaraanTerparkirResponseFromJson(jsonString);

import 'dart:convert';

KendaraanTerparkirResponse kendaraanTerparkirResponseFromJson(String str) =>
    KendaraanTerparkirResponse.fromJson(json.decode(str));

String kendaraanTerparkirResponseToJson(KendaraanTerparkirResponse data) =>
    json.encode(data.toJson());

class KendaraanTerparkirResponse {
  KendaraanTerparkirResponse({
    required this.meta,
    required this.data,
  });

  Meta meta;
  int data;

  factory KendaraanTerparkirResponse.fromJson(Map<String, dynamic> json) =>
      KendaraanTerparkirResponse(
        meta: Meta.fromJson(json["meta"]),
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": data,
      };
}

class Meta {
  Meta({
    required this.code,
    required this.status,
    required this.message,
  });

  int code;
  String status;
  String message;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
      };
}
