import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_json/material/%C4%B1cons.dart';
import 'package:flutter_application_json/material/colors.dart';
import 'package:flutter_application_json/material/text.dart';

class Update extends StatefulWidget {
  final String id;
  const Update({Key? key, required this.id}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  late Map userData;
  TextEditingController hedefAdi = TextEditingController();
  TextEditingController telefon = TextEditingController();
  TextEditingController ogrencikota = TextEditingController();
  TextEditingController serviskota = TextEditingController();
  TextEditingController cagriSesId = TextEditingController();
  TextEditingController komisyon = TextEditingController();
  TextEditingController fiyat = TextEditingController();
  TextEditingController anlasmaController = TextEditingController();
  TextEditingController cagriSesAksamController = TextEditingController();
  TextEditingController dLatitude = TextEditingController();
  TextEditingController dLongitude = TextEditingController();
  TextEditingController tip = TextEditingController();
  var items = ["Ogrenci", "Personel"];
  String dropdownvalue = "Ogrenci";
  var itemsss = ["Bireysel", "Topluca"];
  String anlasmadropdownvalue = "Bireysel";

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    try {
      var snap = await FirebaseFirestore.instance.collection("hedef").doc(widget.id).get();
      userData = snap.data()!;
    } catch (e) {
      print(e.toString());
    }

    setState(() {
      userData = userData;
      hedefAdi.text = userData['hedefAdi'];
      telefon.text = userData['telefon'].toString();
      ogrencikota.text = userData['ogrenciKota'].toString();
      serviskota.text = userData['servisKota'].toString();
      cagriSesId.text = userData['cagrisesId'].toString();
      komisyon.text = userData['komisyon'].toString();
      fiyat.text = userData['fiyatnet'].toString();
      anlasmaController.text = userData['anlasma'];
      cagriSesAksamController.text = userData['cagriSesAksam'].toString();
      dLatitude.text = userData['yer']['_latitude'].toString();
      dLongitude.text = userData['yer']['_longitude'].toString();
      if (userData['tip'].toString().contains('1')) {
        dropdownvalue = "Ogrenci";
      } else {
        dropdownvalue = "Personel";
      }
      if (userData['anlasma'].toString().contains('1')) {
        anlasmadropdownvalue = "Bireysel";
      } else {
        anlasmadropdownvalue = "Topluca";
      }
    });
  }

  getUpdate() async {
    int telefonparse = int.parse(telefon.text);
    var ogrenciKotaparse = int.parse(ogrencikota.text);
    var servisKotaparse = int.parse(serviskota.text);
    var fiyatparse = int.parse(fiyat.text);
    var komisyonparse = int.parse(komisyon.text);
    var cagriSesIdparse = int.parse(cagriSesId.text);
    var cagriSesAksamparse = int.parse(cagriSesAksamController.text);
    var dlatitudeparse = double.parse(dLatitude.text);
    var dlongitudeparse = double.parse(dLongitude.text);

    var snap = await FirebaseFirestore.instance.collection("hedef").doc(widget.id).update({
      "hedefAdi": hedefAdi.text,
      "telefon": telefonparse,
      "ogrencikota": ogrenciKotaparse,
      "servisKota": servisKotaparse,
      "cagrisesId": cagriSesIdparse,
      "anlasma": anlasmaController.text,
      "komisyon": komisyonparse,
      "fiyatnet": fiyatparse,
      "yer._latitude": dlatitudeparse,
      "yer._longitude": dlongitudeparse,
      "tip": tip.text,
      "cagriSesAksam": cagriSesAksamparse,
      "bildirimTel": telefon.text
    }).then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Okul Güncelleme Başarılı!"),
          backgroundColor: ProjectColors.amber,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ProjectColors.orange,
          actions: [
            TextButton(
              onPressed: () {
                getUpdate();
              },
              child: Text(
                ProjectText.guncelle,
                style: Theme.of(context).textTheme.subtitle2?.copyWith(color: ProjectColors.white),
              ),
            ),
          ],
        ),
        body: ListView(
          children: [
            okulName(),
            telefonFunction(),
            kotaInputFunction(),
            ogrenciSayisiFunction(),
            fiyatFunction(),
            yerFunction(),
            tipMethot(),
          ],
        ));
  }

  Padding okulName() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10, right: 8, left: 8),
      child: TextFormField(
        controller: hedefAdi,
        keyboardType: TextInputType.name,
        autofocus: true,
        autofillHints: const [AutofillHints.email],
        textInputAction: TextInputAction.next,
        decoration: _InputDecarotor().nameInput,
      ),
    );
  }

  Padding kotaInputFunction() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 10),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: SizedBox(
              width: 170,
              height: 50,
              child: TextFormField(
                controller: ogrencikota,
                keyboardType: TextInputType.number,
                autofocus: true,
                textInputAction: TextInputAction.next,
                decoration: _InputDecarotor().kotaInput,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SizedBox(
              width: 170,
              height: 50,
              child: TextFormField(
                  controller: serviskota,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  autofillHints: const [AutofillHints.telephoneNumber],
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      label: Text("Servis Kota Sayısı"),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)))),
            ),
          ),
        ],
      ),
    );
  }

  Padding telefonFunction() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: telefon,
        keyboardType: TextInputType.phone,
        autofocus: true,
        autofillHints: const [AutofillHints.telephoneNumber],
        textInputAction: TextInputAction.next,
        decoration: _InputDecarotor().telephoneInput,
      ),
    );
  }

  Padding ogrenciSayisiFunction() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: SizedBox(
              width: 170,
              height: 50,
              child: TextFormField(
                controller: cagriSesId,
                keyboardType: TextInputType.number,
                autofocus: true,
                autofillHints: const [AutofillHints.name],
                textInputAction: TextInputAction.next,
                decoration: _InputDecarotor().cagriSesIdInput,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SizedBox(
              width: 170,
              height: 50,
              child: TextFormField(
                controller: cagriSesAksamController,
                keyboardType: TextInputType.number,
                autofocus: true,
                textInputAction: TextInputAction.next,
                decoration: _InputDecarotor().cagriSesAksamInput,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row fiyatFunction() {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: SizedBox(
            width: 170,
            height: 50,
            child: TextFormField(
              controller: komisyon,
              keyboardType: TextInputType.number,
              autofocus: true,
              textInputAction: TextInputAction.next,
              decoration: _InputDecarotor().komisyonInput,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: SizedBox(
            width: 170,
            height: 50,
            child: TextFormField(
              controller: fiyat,
              keyboardType: TextInputType.number,
              autofocus: true,
              textInputAction: TextInputAction.next,
              decoration: _InputDecarotor().fiyatNetInput,
            ),
          ),
        ),
      ],
    );
  }

  Padding yerFunction() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 20),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: SizedBox(
              width: 170,
              height: 50,
              child: TextFormField(
                controller: dLatitude,
                keyboardType: TextInputType.number,
                autofocus: true,
                autofillHints: const [AutofillHints.name],
                textInputAction: TextInputAction.next,
                decoration: _InputDecarotor().dLatitude,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: SizedBox(
              width: 170,
              height: 50,
              child: TextFormField(
                controller: dLongitude,
                keyboardType: TextInputType.number,
                autofocus: true,
                textInputAction: TextInputAction.next,
                decoration: _InputDecarotor().dLongitude,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container tipMethot() {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Column(
            children: [
              Text("Tip Seçiniz"),
              DropdownButton(
                value: dropdownvalue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                    if (dropdownvalue.contains('g')) {
                      tip.text = "1";
                      cagriSesId.text = "20825999";
                      cagriSesAksamController.text = "20825999";
                    } else {
                      tip.text = "2";
                      cagriSesId.text = "13508667";
                      cagriSesAksamController.text = "13508667";
                    }
                  });
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120),
            child: Column(
              children: [
                Text(ProjectText.anlasmaSeciniz),
                DropdownButton(
                  value: anlasmadropdownvalue,
                  icon: ProjectIcon.tipIcon,
                  items: itemsss.map((String itemss) {
                    return DropdownMenuItem(
                      value: itemss,
                      child: Text(itemss),
                    );
                  }).toList(),
                  onChanged: (String? newVal) {
                    setState(() {
                      anlasmadropdownvalue = newVal!;
                      if (anlasmadropdownvalue.contains('B')) {
                        anlasmaController.text = "1";
                      } else {
                        anlasmaController.text = "2";
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InputDecarotor {
  final nameInput = InputDecoration(
      label: Text("İsim"),
      prefixIcon: const Icon(
        Icons.person,
        color: Colors.grey,
      ),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final telephoneInput = InputDecoration(
      label: Text("Telefon Numarası"),
      prefixIcon: const Icon(
        Icons.phone,
        color: Colors.grey,
      ),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final kotaInput = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      label: Text("Öğrenci Kota Sayısı"),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final tipInput = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      hintText: 'Tip',
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final cagriSesIdInput = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      label: Text("Çağrı Ses ID"),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final anlasmaInput = InputDecoration(
      label: Text("Anlasma"), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final fiyatNetInput = InputDecoration(
      label: Text("Net Fiyat"), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final cagriSesAksamInput = InputDecoration(
      label: Text("Çağrı Ses Akşam"), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final komisyonInput = InputDecoration(
      label: Text("Komisyon"), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final dLatitude = InputDecoration(
      label: Text("Latitude"), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final dLongitude = InputDecoration(
      label: Text("Longitude"), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final tip = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
}
