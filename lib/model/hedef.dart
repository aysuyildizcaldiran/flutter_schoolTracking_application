import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';

Hedef1 welcomeFromJson(String str) => Hedef1.fromJson(json.decode(str));

String welcomeToJson(Hedef1 data) => json.encode(data.toJson());

class Hedef1 {
  String? id;
  int telefon;
  //ServisBtn? servisBtn;
  int? guncelleme;
  // VeliizinBtn? veliizinBtn;
  String? hedefAdi;
  // bool? durum;
  // int? servisKota;
  // int? cagrisesId;
  // String? ipucu;
  // bool? aylikOdeme;
  // String? kurtarmak;
  //Yer? yer;
  // String? anlasma;
  // String? dagitBtn;
  // int? ogrenciKota;
  // double? fiyatnet;
  // String? idariiznBtn;
  // String? logo;
  // String? toplaBtn;
  // int? ogrenciSayisi;
  // String? kullaniciizinBtn;
  // int? cagriSesAksam;
  // int? komisyon;

  Hedef1({
    required this.id,
    required this.telefon,
    //required this.servisBtn,
    required this.guncelleme,
    // required this.veliizinBtn,
    required this.hedefAdi,
    // required this.durum,
    // required this.servisKota,
    // required this.cagrisesId,
    // required this.ipucu,
    // required this.aylikOdeme,
    // required this.kurtarmak,
    // required this.yer,
    // required this.anlasma,
    // required this.dagitBtn,
    // required this.ogrenciKota,
    // required this.fiyatnet,
    // required this.idariiznBtn,
    // required this.logo,
    // required this.toplaBtn,
    // required this.ogrenciSayisi,
    // required this.kullaniciizinBtn,
    // required this.cagriSesAksam,
    //required this.komisyon
  });

  factory Hedef1.fromJson(Map<String, dynamic> json) => Hedef1(
        id: json["id"],
        telefon: json["telefon"],
        guncelleme: json["guncelleme"],
        hedefAdi: json["hedefAdi"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "telefon": telefon,
        "guncelleme": guncelleme,
        "hedefAdi": hedefAdi,
      };
}

class Yer {
  Yer({
    required this.enlem,
    required this.boylam,
  });

  num enlem;
  num boylam;

  factory Yer.fromJson(Map<String, dynamic> json) => Yer(
        enlem: json["_enlem"].toDouble(),
        boylam: json["_boylam"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "_enlem": enlem,
        "_boylam": boylam,
      };
}

class Veliizin {
  Veliizin(
      {required this.yo,
      required this.kilit,
      required this.sms,
      required this.renk,
      required this.durum,
      required this.mesaj,
      required this.id});

  num yo;
  bool kilit;
  bool sms;
  String renk;
  bool durum;
  String mesaj;
  String id;

  factory Veliizin.fromJson(Map<String, dynamic> json) => Veliizin(
      yo: json["yo"],
      kilit: json["kilit"],
      sms: json["sms"],
      renk: json["renk"],
      durum: json["durum"],
      mesaj: json["mesaj"],
      id: json["id"]);

  Map<String, dynamic> toJson() => {
        "yo": yo,
        "kilit": kilit,
        "sms": sms,
        "renk": renk,
        "durum": durum,
        "mesaj": mesaj,
        "id": id,
      };
}

class VeliizinBtn {
  VeliizinBtn({required this.bir, required this.iki, required this.uc});

  Veliizin bir;
  Veliizin iki;
  Veliizin uc;

  factory VeliizinBtn.fromJson(Map<String, dynamic> json) => VeliizinBtn(
        bir: json["bir"],
        iki: json["iki"],
        uc: json["uc"],
      );

  Map<String, dynamic> toJson() => {"bir": bir, "iki": iki, "uc": uc};
}

class Servis {
  Servis({required this.durum, required this.mesaj, required this.id});

  bool durum;
  String mesaj;
  String id;

  factory Servis.fromJson(Map<String, dynamic> json) =>
      Servis(durum: json["durum"], mesaj: json["mesaj"], id: json["id"]);

  Map<String, dynamic> toJson() => {
        "durum": durum,
        "mesaj": mesaj,
        "id": id,
      };
}

class ServisBtn {
  ServisBtn(
      {required this.dagitmaBitir,
      required this.dagitmaBasla,
      required this.otoBasla,
      required this.otoBitir,
      required this.toplamaBasla,
      required this.toplamaBitir});

  Servis dagitmaBitir;
  Servis dagitmaBasla;
  Servis otoBasla;
  Servis otoBitir;
  Servis toplamaBasla;
  Servis toplamaBitir;
  factory ServisBtn.fromJson(Map<String, dynamic> json) => ServisBtn(
      dagitmaBitir: json["dagitmaBitir"],
      dagitmaBasla: json["dagitmaBasla"],
      otoBasla: json["otoBasla"],
      otoBitir: json["otoBitir"],
      toplamaBasla: json["toplamaBasla"],
      toplamaBitir: json["toplamaBitir"]);

  Map<String, dynamic> toJson() => {
        "dagitmaBitir": dagitmaBitir,
        "dagitmaBasla": dagitmaBasla,
        "otoBasla": otoBasla,
        "otoBitir": otoBitir,
        "toplamaBasla": toplamaBasla,
        "toplamaBitir": toplamaBitir
      };
}
