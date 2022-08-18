import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_json/service/update_service.dart';

class Update extends StatefulWidget {
  final String id;
  const Update({Key? key, required this.id}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
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

  late Map userData;

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
      _hedefAdi.text = userData['hedefAdi'];
      _telefon.text = userData['telefon'].toString();
      _ogrencikota.text = userData['ogrenciKota'].toString();
      _serviskota.text = userData['serviskota'].toString();
      _ogrenciSayisi.text = userData['ogrenciSayisi'].toString();
      _cagriSesId.text = userData['cagriSesId'].toString();
      _komisyon.text = userData['komisyon'].toString();
      _fiyat.text = userData['fiyat'].toString();
      _anlasmaController.text = userData['anlasma'];
      _cagriSesAksamController.text = userData['cagriSesAksam'].toString();
      _dLatitude.text = userData['yer']['_latitude'].toString();
      _dLongitude.text = userData['yer']['_longitude'].toString();
      _tip.text = userData['tip'].toString();
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
    var dlatitudeparse = double.parse(_dLatitude.text);
    var dlongitudeparse = double.parse(_dLongitude.text);

    var snap = await FirebaseFirestore.instance.collection("hedef").doc(widget.id).update({
      "hedefAdi": _hedefAdi.text,
      "telefon": telefonparse,
      "ogrencikota": ogrenciKotaparse,
      "serviskota": servisKotaparse,
      "ogrenciSayisi": ogrenciSayisiparse,
      "cagriSesId": cagriSesIdparse,
      "anlasma": _anlasmaController.text,
      "komisyon": komisyonparse,
      "fiyat": fiyatparse,
      "yer._latitude": dlatitudeparse,
      "yer._longitude": dlongitudeparse,
      "tip": _tip.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 245, 183, 48),
          actions: [
            TextButton(
              onPressed: () {
                getUpdate();
              },
              child: Text(
                "Güncelle",
                style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.white),
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
        // initialValue: userData['hedefAdi'].toString(),
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

  Padding anlasma() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _anlasmaController,
        keyboardType: TextInputType.name,
        autofocus: true,
        autofillHints: const [AutofillHints.name],
        textInputAction: TextInputAction.next,
        decoration: _InputDecarotor().anlasmaInput,
      ),
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
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.centerLeft,
        child: TextFormField(
          controller: _tip,
          decoration: _InputDecarotor().tip,
        ));
  }
}

class _InputDecarotor {
  final nameInput = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      hintText: 'Name',
      prefixIcon: const Icon(
        Icons.person,
        color: Colors.grey,
      ),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final telephoneInput = InputDecoration(
      prefixIcon: const Icon(
        Icons.phone,
        color: Colors.grey,
      ),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final kotaInput = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      hintText: 'Öğrenci Kota Sayısı',
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final tipInput = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      hintText: 'Tip',
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final cagriSesIdInput = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      hintText: 'Çağrı Ses ID',
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final anlasmaInput = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      hintText: 'Anlasma',
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final fiyatNetInput = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      hintText: 'Net Fiyat',
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final ogrenciSayisiInput = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      hintText: 'Öğrenci Sayısı',
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final cagriSesAksamInput = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      hintText: 'Çağrı Ses Akşam',
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final komisyonInput = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      hintText: 'Komisyon',
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final dLatitude = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      hintText: 'Latitude',
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final dLongitude = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      hintText: 'Longitude',
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final tip = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
}
