// To parse this JSON data, do
//
//     final mesaj = mesajFromJson(jsonString);

import 'dart:convert';

List<Mesaj> mesajFromJson(String str) =>
    List<Mesaj>.from(json.decode(str).map((x) => Mesaj.fromJson(x)));

String mesajToJson(List<Mesaj> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mesaj {
  Mesaj({
    this.mesajNo,
    this.idG,
    this.idAlici,
    this.kullaniciAdiG,
    this.kullaniciAdiA,
    this.mesaj,
    this.messageType,
  });

  int mesajNo;
  int idG;
  String idAlici;
  String kullaniciAdiG;
  String kullaniciAdiA;
  String mesaj;
  String messageType;

  factory Mesaj.fromJson(Map<String, dynamic> json) => Mesaj(
        mesajNo: json["mesajNo"],
        idG: json["idG"],
        idAlici: json["idAlici"],
        kullaniciAdiG: json["kullaniciAdiG"],
        kullaniciAdiA: json["kullaniciAdiA"],
        mesaj: json["mesaj"],
        messageType: json["messageType"],
      );

  Map<String, dynamic> toJson() => {
        "mesajNo": mesajNo,
        "idG": idG,
        "idAlici": idAlici,
        "kullaniciAdiG": kullaniciAdiG,
        "kullaniciAdiA": kullaniciAdiA,
        "mesaj": mesaj,
        "messageType": messageType,
      };
}
