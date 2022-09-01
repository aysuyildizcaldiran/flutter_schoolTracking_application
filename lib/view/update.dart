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
  final _hedefAdi = TextEditingController();
  final _telefon = TextEditingController();
  final _ogrencikota = TextEditingController();
  final _serviskota = TextEditingController();
  final _ogrenciSayisi = TextEditingController();
  final _cagriSesId = TextEditingController();
  final _komisyon = TextEditingController();
  final _fiyat = TextEditingController();
  final _anlasmaController = TextEditingController();
  final _cagriSesAksamController = TextEditingController();
  final _dLatitude = TextEditingController();
  final _dLongitude = TextEditingController();
  final _tip = TextEditingController();
  var items = ["Ogrenci", "Personel"];
  String dropdownvalue = "Ogrenci";
  var itemsss = ["Bireysel", "Topluca"];
  String anlasmadropdownvalue = "Bireysel";
  @override
  void initState() {
    getData();
    super.initState();
    dropdownvalue;
    anlasmadropdownvalue;
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
      _hedefAdi.text = userData['hedefAdi'];
      _telefon.text = userData['telefon'].toString();
      _ogrencikota.text = userData['ogrenciKota'].toString();
      _serviskota.text = userData['servisKota'].toString();
      _ogrenciSayisi.text = userData['ogrenciSayisi'].toString();
      _cagriSesId.text = userData['cagrisesId'].toString();
      _komisyon.text = userData['komisyon'].toString();
      _fiyat.text = userData['fiyatnet'].toString();
      _anlasmaController.text = userData['anlasma'];
      _cagriSesAksamController.text = userData['cagriSesAksam'].toString();
      _dLatitude.text = userData['yer']['_latitude'].toString();
      _dLongitude.text = userData['yer']['_longitude'].toString();
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
    var telefonparse = int.parse(_telefon.text);
    var ogrenciKotaparse = int.parse(_ogrencikota.text);
    var servisKotaparse = int.parse(_serviskota.text);
    var ogrenciSayisiparse = int.parse(_ogrenciSayisi.text);
    var fiyatparse = int.parse(_fiyat.text);
    var komisyonparse = int.parse(_komisyon.text);
    var cagriSesIdparse = int.parse(_cagriSesId.text);
    var cagriSesAksamparse = int.parse(_cagriSesAksamController.text);
    var dlatitudeparse = double.parse(_dLatitude.text);
    var dlongitudeparse = double.parse(_dLongitude.text);

    var snap = await FirebaseFirestore.instance.collection("hedef").doc(widget.id).update({
      "hedefAdi": _hedefAdi.text,
      "telefon": telefonparse,
      "ogrencikota": ogrenciKotaparse,
      "servisKota": servisKotaparse,
      "ogrenciSayisi": ogrenciSayisiparse,
      "cagrisesId": cagriSesIdparse,
      "anlasma": _anlasmaController.text,
      "komisyon": komisyonparse,
      "fiyatnet": fiyatparse,
      "yer._latitude": dlatitudeparse,
      "yer._longitude": dlongitudeparse,
      "tip": _tip.text,
      "cagriSesAksam": cagriSesAksamparse
    });
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
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Okul Güncelleme Başarılı!"),
                  backgroundColor: ProjectColors.amber,
                ));
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
            anlasma(),
            cagriSesAksam(),
            yerFunction(),
            tipMethot(),
          ],
        ));
  }

  Padding okulName() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _hedefAdi,
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
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: SizedBox(
              width: 170,
              height: 50,
              child: TextFormField(
                controller: _ogrencikota,
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
                  controller: _serviskota,
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  autofillHints: const [AutofillHints.telephoneNumber],
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                      hintText: 'Servis Kota Sayısı',
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
        controller: _telefon,
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
                controller: _cagriSesId,
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
                controller: _ogrenciSayisi,
                keyboardType: TextInputType.number,
                autofocus: true,
                textInputAction: TextInputAction.next,
                decoration: _InputDecarotor().ogrenciSayisiInput,
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
              controller: _komisyon,
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
              controller: _fiyat,
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

  Padding cagriSesAksam() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _cagriSesAksamController,
        keyboardType: TextInputType.number,
        autofocus: true,
        textInputAction: TextInputAction.next,
        decoration: _InputDecarotor().cagriSesAksamInput,
      ),
    );
  }

  Padding yerFunction() {
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
                controller: _dLatitude,
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
                controller: _dLongitude,
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
      child: Column(
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
                  _tip.text = "1";
                  _cagriSesId.text = "13508667";
                  _cagriSesAksamController.text = "13508667";
                } else {
                  _tip.text = "2";
                  _cagriSesId.text = "20825999";
                  _cagriSesAksamController.text = "20825999";
                }
              });
            },
          ),
        ],
      ),
    );
  }

  Container anlasma() {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.centerLeft,
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
                  _anlasmaController.text = "1";
                } else {
                  _anlasmaController.text = "2";
                }
              });
            },
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
  final ogrenciSayisiInput = InputDecoration(
      label: Text("Öğrenci Sayısı"), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
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
