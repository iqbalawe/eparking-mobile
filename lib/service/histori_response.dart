// To parse this JSON data, do
//
//     final historiResponse = historiResponseFromJson(jsonString);

import 'dart:convert';

HistoriResponse historiResponseFromJson(String str) =>
    HistoriResponse.fromJson(json.decode(str));

String historiResponseToJson(HistoriResponse data) =>
    json.encode(data.toJson());

class HistoriResponse {
  HistoriResponse({
    required this.data,
    required this.meta,
  });

  Meta meta;
  List<HistoriKendaraan> data;

  factory HistoriResponse.fromJson(Map<String, dynamic> json) =>
      HistoriResponse(
        meta: Meta.fromJson(json["meta"]),
        data: List<HistoriKendaraan>.from(
            json["data"].map((x) => HistoriKendaraan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class HistoriKendaraan {
  HistoriKendaraan({
    required this.id,
    required this.gedung,
    required this.kendaraanId,
    required this.status,
    required this.jamMasuk,
    required this.jamKeluar,
    required this.createdAt,
    required this.updatedAt,
    required this.kendaraan,
  });

  int id;
  String gedung;
  String kendaraanId;
  String status;
  String? jamMasuk;
  String? jamKeluar;
  DateTime createdAt;
  DateTime updatedAt;
  Kendaraan kendaraan;

  factory HistoriKendaraan.fromJson(Map<String, dynamic> json) =>
      HistoriKendaraan(
        id: json["id"],
        gedung: json["gedung"],
        kendaraanId: json["kendaraan_id"],
        status: json["status"],
        jamMasuk: json["jam_masuk"],
        jamKeluar: json["jam_keluar"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        kendaraan: Kendaraan.fromJson(json["kendaraan"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "gedung": gedung,
        "kendaraan_id": kendaraanId,
        "jam_masuk": jamMasuk,
        "jam_keluar": jamKeluar,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "kendaraan": kendaraan.toJson(),
      };
}

class Kendaraan {
  Kendaraan({
    required this.id,
    required this.namaCivitas,
    required this.statusCivitas,
    required this.nipNim,
    required this.platNomor,
    required this.jenisKendaraan,
    required this.merk,
    required this.fotoStnk,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String namaCivitas;
  String statusCivitas;
  String nipNim;
  String platNomor;
  String jenisKendaraan;
  String merk;
  String fotoStnk;
  DateTime createdAt;
  DateTime updatedAt;

  factory Kendaraan.fromJson(Map<String, dynamic> json) => Kendaraan(
        id: json["id"],
        namaCivitas: json["nama_civitas"],
        statusCivitas: json["status_civitas"],
        nipNim: json["nip_nim"],
        platNomor: json["plat_nomor"],
        jenisKendaraan: json["jenis_kendaraan"],
        merk: json["merk"],
        fotoStnk: json["foto_stnk"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_civitas": namaCivitas,
        "status_civitas": statusCivitas,
        "nip_nim": nipNim,
        "plat_nomor": platNomor,
        "jenis_kendaraan": jenisKendaraan,
        "merk": merk,
        "foto_stnk": fotoStnk,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
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
