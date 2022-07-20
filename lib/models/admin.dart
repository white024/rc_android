// To parse this JSON data, do
//
//     final rcAndroid = rcAndroidFromJson(jsonString);

import 'dart:convert';

List<admin> adminFromJson(String str) =>
    List<admin>.from(json.decode(str).map((x) => admin.fromJson(x)));

String adminToJson(List<admin> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class admin {
  admin({
    this.idYGiris,
    this.kullaniciAdiA,
    this.sifre,
    this.tur,
  });

  int idYGiris;
  String kullaniciAdiA;
  String sifre;
  String tur;

  factory admin.fromJson(Map<String, dynamic> json) => admin(
        idYGiris: json["idYGiris"],
        kullaniciAdiA: json["kullaniciAdiA"],
        sifre: json["sifre"],
        tur: json["tur"],
      );

  Map<String, dynamic> toJson() => {
        "idYGiris": idYGiris,
        "kullaniciAdiA": kullaniciAdiA,
        "sifre": sifre,
        "tur": tur,
      };
}
