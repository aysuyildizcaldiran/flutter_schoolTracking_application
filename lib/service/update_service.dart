import 'dart:async';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_json/model/hedef3.dart';

class UpdateService {
  late String id;
  late Map userData;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> update(
    String hedefAdi,
    String telefon,
    String ogrencikota,
    String serviskota,
    String ogrenciSayisi,
    String cagriSesId,
    String komisyon,
    String fiyat,
    String anlasmaController,
    String cagriSesAksamController,
    String dLatitude,
    String dLongitude,
    String tip,
  ) async {
    var telefonparse = int.parse(telefon);
    var ogrencikotaparse = int.parse(ogrencikota);
    var ogrenciSayisiparse = int.parse(ogrenciSayisi);
    var serviskotaparse = int.parse(serviskota);
    var cagriSesIdparse = int.parse(cagriSesId);
    var komisyonparse = int.parse(komisyon);
    var fiyatparse = double.parse(fiyat);
    var dLatitudeparse = double.parse(dLatitude);
    var dLongitudeparse = double.parse(dLongitude);
    Hedef2 h = Hedef2(
      durum: true,
      hedefAdi: hedefAdi,
      telefon: telefonparse,
      ogrenciKota: ogrencikotaparse,
      servisKota: serviskotaparse,
      ogrenciSayisi: ogrenciSayisiparse,
      cagrisesId: cagriSesIdparse,
      komisyon: komisyonparse,
      fiyatnet: fiyatparse,
      anlasma: anlasmaController,
      tip: tip,
      aylikOdeme: false,
      cagriSesAksam: 20825999,
      yer: Yer(dLatitude: dLatitudeparse, dLongitude: dLongitudeparse),
      logo: "https://servisbildirim.com/ayarlar/servis-bildirim-logo.jpg",
      guncelleme: 1652640548,
    );
    String sonuc = '';
    var ref2 = await _firestore.collection("hedef").doc(id).update({
      "hedefAdi": hedefAdi,
      "telefon": telefon,
      "ogrencikota": ogrencikota,
      "serviskota": serviskota,
      "ogrenciSayisi": ogrenciSayisi,
      "cagriSesId": cagriSesId,
      "komisyon": komisyon,
      "fiyat": fiyat,
      "cagriSesAksamController": cagriSesAksamController,
      "anlasmaController": anlasmaController,
      "dLatitude": dLatitude,
      "dLongitude": dLongitude,
      "tip": tip,
    });
    return sonuc;
  }

  getData(String id) async {
    try {
      var snap = await FirebaseFirestore.instance.collection("hedef").doc(id).get();
      userData = snap.data()!;
    } catch (e) {
      print(e.toString());
    }
    print("************");
    print(userData['yer/_longitude'].toString());
    print("*************");
  }
}
