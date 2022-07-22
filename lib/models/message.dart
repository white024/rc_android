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
    this.kullaniciAdiG,
    this.kullaniciAdiA,
    this.mesaj,
    this.messageType,
    this.saat,
    this.tarih,
  });

  int mesajNo;
  String kullaniciAdiG;
  String kullaniciAdiA;
  String mesaj;
  String messageType;
  String saat;
  dynamic tarih;

  factory Mesaj.fromJson(Map<String, dynamic> json) => Mesaj(
        mesajNo: json["mesajNo"],
        kullaniciAdiG: json["kullaniciAdiG"],
        kullaniciAdiA: json["kullaniciAdiA"],
        mesaj: json["mesaj"],
        messageType: json["messageType"],
        saat: json["saat"],
        tarih: json["tarih"],
      );

  Map<String, dynamic> toJson() => {
        "mesajNo": mesajNo,
        "kullaniciAdiG": kullaniciAdiG,
        "kullaniciAdiA": kullaniciAdiA,
        "mesaj": mesaj,
        "messageType": messageType,
        "saat": saat,
        "tarih": tarih,
      };
}
