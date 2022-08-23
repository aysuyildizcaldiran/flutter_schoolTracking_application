import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_json/model/arama.dart';
import 'package:flutter_application_json/model/hedef3.dart';
import 'package:flutter_application_json/model/odeme.dart';

class Hedef3Service {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String sonuc = '';
  Future<String> addHedef(
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
        servisBtn: ServisBtn(
            dagitmaBitir: DagitmaBitir(mesaj: "Dağıtma bitirildi.", durum: true),
            dagitmaBasla: DagitmaBasla(mesaj: "Dağıtmaya başlandı.", durum: true),
            otoBasla: OtoBasla(mesaj: "Otomatik mod aktif edildi.", durum: true),
            otoBitir: OtoBitir(mesaj: "Otomatik mod bitirildi", durum: true),
            toplamaBasla: ToplamaBasla(mesaj: "Toplamaya başladı.", durum: true),
            toplamaBitir: ToplamaBitir(mesaj: "Toplama bitirildi.", durum: true)),
        toplaBtn: ToplaBtn(
          beklendiAlindi: Yaklasti(
            renk: "0xffffc744",
            kilit: false,
            cagri: true,
            yon: 1,
            text: "Beklendi Alındı.",
            mesaj: "Beklendi Alındı.",
            sms: false,
            kmesaj: "Servis bekledi ve aldı.",
          ),
          serviseBindi: Yaklasti(
            renk: "0xff8ec33f",
            kilit: false,
            cagri: false,
            yon: 1,
            text: "Bindi.",
            mesaj: "servise bindi",
            sms: true,
            kmesaj: "Personel iş yeri yönünde ki servise binmiştir.",
          ),
          serviseBinmedi: Yaklasti(
            renk: "0xffe82b2f",
            kilit: true,
            cagri: false,
            yon: 1,
            text: "Bindi.",
            mesaj: "servise binmedi",
            sms: true,
            kmesaj: "Personel iş yönünde ki servise binmedi.",
          ),
          indi: Yaklasti(
              renk: "0xff8ec33f",
              kilit: true,
              cagri: false,
              yon: 1,
              text: "İndi.",
              mesaj: "okula bırakıldı",
              sms: false,
              kmesaj: "Personel iş yönünde varış durağında indi"),
          beklendiAlinmadi: Yaklasti(
              renk: "0xffffc744",
              kilit: true,
              cagri: true,
              yon: 1,
              text: "Beklendi Alınmadı",
              mesaj: "Beklendi alınmadı.",
              sms: false,
              kmesaj: "Servis sizi almak için durağa yaklaştı."),
          duragaYaklasti: Yaklasti(
              renk: "0xff8ec33f",
              kilit: false,
              cagri: true,
              yon: 1,
              text: "İndi.",
              mesaj: "durağa yaklaştı",
              sms: false,
              kmesaj: "Servis sizi almak için durağa yaklaştı."),
        ),
        dagitBtn: DagitBtn(
            indi: Yaklasti(
                yon: 2,
                mesaj: "Öğrenci ev yönünde, akşam durağına  bırakıldı.",
                renk: "0xff8ec33f",
                kilit: true,
                text: "İndi",
                cagri: false,
                kmesaj: "Personel ev yönünde, varış durağında indi.",
                sms: true),
            yaklasti: Yaklasti(
                renk: "0xff8ec33f",
                sms: true,
                kmesaj: "eve yaklaştı",
                cagri: true,
                text: "Yaklaştı",
                kilit: false,
                yon: 2,
                mesaj: "Eve yaklaştı"),
            serviseBindi: Yaklasti(
                kmesaj: "Personel ev yönüne gitmek üzere servise bindi.",
                mesaj: "Öğrenci eve varmak üzere, akşam servisine bindi.",
                text: "Bindi",
                renk: "0xffff1122",
                cagri: false,
                kilit: false,
                yon: 2,
                sms: true),
            serviseBinmedi: Yaklasti(
                cagri: false,
                text: "Binmedi",
                kilit: true,
                kmesaj: "Personel eve varmak için servis kullanmadı.",
                renk: "0xffe82b2f",
                mesaj: "Öğrenci eve varmak için servise binmedi",
                sms: true,
                yon: 2)),
        veliizinBtn: VeliizinBtn(
            bir: Bir(renk: "0xffee4725", yon: 1, sms: false, mesaj: "Sabah", durum: true, kilit: true),
            iki: Iki(
              yon: 2,
              kilit: true,
              sms: true,
              renk: "0xffee4725",
              durum: true,
              mesaj: "Akşam",
            ),
            uc: Uc(sms: true, kilit: true, mesaj: "izinli", durum: true, yon: 3, renk: "0xffee4725")),
        kullaniciizinBtn: VeliizinBtn(
            bir: Bir(
                renk: "0xffee4725", mesaj: "Sabah servise binmeyeceğim.", kilit: true, durum: true, yon: 1, sms: true),
            iki: Iki(
                renk: "0xffee4725", sms: true, mesaj: "Akşam servise binmeyeceğim.", durum: true, yon: 2, kilit: true),
            uc: Uc(kilit: true, sms: true, renk: "0xffee4725", durum: true, mesaj: "Kullanıcı İzinli", yon: 3)),
        idariizinBtn: VeliizinBtn(
            bir: Bir(renk: "0xff8ec33f", sms: true, kilit: true, mesaj: "Velisi alacak.", durum: true, yon: 2),
            iki: Iki(
                durum: true, yon: 2, kilit: true, sms: true, renk: "0xff30a9e0", mesaj: "Serbest çıkış izni verildi."),
            uc: Uc(kilit: true, renk: "0xffffc744", mesaj: "Okulda kalacak.", durum: true, yon: 2, sms: true)));
    DocumentReference ref = await _firestore.collection("hedef").add(h.toJson());
    OdemeJson odeme = OdemeJson(hedefId: ref.id);
    AramaJson arama = AramaJson(hedefId: ref.id);

    await _firestore.collection("odeme").add(odeme.toJson());
    await _firestore.collection("arama").add(arama.toJson());
    // DocumentReference ref3 = await _firestore.collection("hedef").get(ref.id);
    // print("-------------------------");
    // print(ref.id);
    // print("------------------");

    var ref2 = await _firestore.collection("hedef").doc(ref.id).update({
      "servisBtn.toplamaBasla.id": ref.id + "s1",
      "servisBtn.toplamaBitir.id": ref.id + "s2",
      "servisBtn.otoBasla.id": ref.id + "s3",
      "servisBtn.otoBitir.id": ref.id + "s4",
      "servisBtn.dagitmaBasla.id": ref.id + "s5",
      "servisBtn.dagitmaBitir.id": ref.id + "s2",
      "toplaBtn.duragaYaklasti.id": ref.id + "t1",
      "toplaBtn.indi.id": ref.id + "t2",
      "toplaBtn.serviseBinmedi.id": ref.id + "t3",
      "toplaBtn.serviseBindi.id": ref.id + "t4",
      "toplaBtn.beklendiAlinmadi.id": ref.id + "t6",
      "toplaBtn.beklendiAlindi.id": ref.id + "t5",
      "dagitBtn.yaklasti.id": ref.id + "d4",
      "dagitBtn.indi.id": ref.id + "d2",
      "dagitBtn.serviseBinmedi.id": ref.id + "d3",
      "dagitBtn.serviseBindi.id": ref.id + "d1",
      "veliizinBtn.bir.id": ref.id + "v1",
      "veliizinBtn.iki.id": ref.id + "v2",
      "veliizinBtn.uc.id": ref.id + "v3",
      "idariizinBtn.bir.id": ref.id + "i1",
      "idariizinBtn.iki.id": ref.id + "i2",
      "idariizinBtn.uc.id": ref.id + "i3",
      "kullaniciizinBtn.bir.id": ref.id + "k1",
      "kullaniciizinBtn.iki.id": ref.id + "k2",
      "kullaniciizinBtn.uc.id": ref.id + "k3",
      "rid": ref.id
    });

    return sonuc;
  }
}
