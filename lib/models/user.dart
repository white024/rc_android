// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

List<User> userFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.idKullanici,
    this.kullaniciAdiU,
    this.sifre,
    this.durum,
    this.profil,
  });

  int idKullanici;
  String kullaniciAdiU;
  String sifre;
  bool durum;
  dynamic profil;

  factory User.fromJson(Map<String, dynamic> json) => User(
        idKullanici: json["idKullanici"],
        kullaniciAdiU: json["kullaniciAdiU"],
        sifre: json["sifre"],
        durum: json["durum"] == null ? null : json["durum"],
        profil: json["profil"],
      );

  Map<String, dynamic> toJson() => {
        "idKullanici": idKullanici,
        "kullaniciAdiU": kullaniciAdiU,
        "sifre": sifre,
        "durum": durum == null ? null : durum,
        "profil": profil,
      };
}
