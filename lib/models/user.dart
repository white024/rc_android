// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

// ignore_for_file: camel_case_types, prefer_if_null_operators

import 'dart:convert';

List<user> userFromJson(String str) =>
    List<user>.from(json.decode(str).map((x) => user.fromJson(x)));

String userToJson(List<user> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class user {
  user({
    this.idKullanici,
    this.kullaniciAdiU,
    this.sifre,
    this.durum,
  });

  int idKullanici;
  String kullaniciAdiU;
  String sifre;
  bool durum;

  factory user.fromJson(Map<String, dynamic> json) => user(
        idKullanici: json["idKullanici"],
        kullaniciAdiU: json["kullaniciAdiU"],
        sifre: json["sifre"],
        durum: json["durum"] == null ? null : json["durum"],
      );

  Map<String, dynamic> toJson() => {
        "idKullanici": idKullanici,
        "kullaniciAdiU": kullaniciAdiU,
        "sifre": sifre,
        "durum": durum == null ? null : durum,
      };
}
