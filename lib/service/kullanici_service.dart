import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_json/model/kullanici.dart';

class KullaniciServis {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String sonuc = '';
  Future<String> addKisi(
      String adSoyad,
      String telefon,
      String dLatitude,
      String dLongitude,
      String sifre,
      String yaklastiMesafe,
      String bildirimTel,
      bool smsisChecked,
      bool cagriisChecked,
      bool hostesisChecked,
      bool kullaniciisChecked,
      bool soforisChecked,
      bool adminisChecked,
      bool idariisChecked,
      bool veliisChecked) async {
    var bildirimTelparse = int.parse(bildirimTel);
    var dLatitudeparse = int.parse(dLatitude);
    var dLongitudeparse = int.parse(dLongitude);
    var yaklastiMesafeparse = int.parse(yaklastiMesafe);

    KullaniciJson kullaniciJson = KullaniciJson(
        adSoyad: adSoyad,
        bildirimTel: bildirimTelparse,
        telefon: telefon,
        sifre: sifre,
        adres: Adres(iLatitude: dLatitudeparse, iLongitude: dLongitudeparse),
        yaklastiMesafe: yaklastiMesafeparse,
        tercih: Tercih(cagri: cagriisChecked, sms: smsisChecked),
        yetki: Yetki(
            sofor: soforisChecked,
            hostes: hostesisChecked,
            kullanici: kullaniciisChecked,
            admin: adminisChecked,
            idari: idariisChecked,
            veli: veliisChecked),
        kupon: Kupon(durum: false, indirim: 0, kuponId: "0"),
        izin: Izin(baslaTarih: 0, bitirTarih: 0),
        signalId: "123123",
        guncelleme: 0,
        durum: true);

    DocumentReference ref = await _firestore.collection("kisi").add(kullaniciJson.toJson());

    await _firestore.collection("kisi").doc(ref.id).update({"rid": ref.id});
    return sonuc;
  }
}
