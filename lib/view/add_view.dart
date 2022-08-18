import 'package:flutter/material.dart';
import 'package:flutter_application_json/service/hedef3_service.dart';

class AddView extends StatefulWidget {
  const AddView({Key? key}) : super(key: key);

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  Hedef3Service hedef3service = Hedef3Service();

  TextEditingController hedefAdi = TextEditingController();
  TextEditingController telefon = TextEditingController();
  TextEditingController ogrencikota = TextEditingController();
  TextEditingController serviskota = TextEditingController();
  TextEditingController ogrenciSayisi = TextEditingController();
  TextEditingController cagriSesId = TextEditingController();
  TextEditingController komisyon = TextEditingController();
  TextEditingController fiyat = TextEditingController();
  TextEditingController anlasmaController = TextEditingController();
  TextEditingController cagriSesAksamController = TextEditingController();
  TextEditingController dLatitude = TextEditingController();
  TextEditingController dLongitude = TextEditingController();
  TextEditingController tip = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 183, 48),
        // title: Text("Okul Ekle", style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              Hedef3Service().addHedef(
                  hedefAdi.text,
                  telefon.text,
                  ogrencikota.text,
                  serviskota.text,
                  ogrenciSayisi.text,
                  cagriSesId.text,
                  komisyon.text,
                  fiyat.text,
                  cagriSesAksamController.text,
                  anlasmaController.text,
                  dLatitude.text,
                  dLongitude.text,
                  tip.text);
            },
            child: Text(
              "Kaydet",
              style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              okulName(),
              telefonFunction(),
              kotaInputFunction(),
              ogrenciSayisiFunction(),
              fiyatFunction(),
              anlasma(),
              cagriSesAksam(),
              yerFunction(),
              tipMethot()
            ],
          ),
        ),
      ]),
    );
  }

  Container tipMethot() {
    return Container(
        padding: const EdgeInsets.all(8.0),
        alignment: Alignment.centerLeft,
        child: TextFormField(
          controller: tip,
          decoration: _InputDecarotor().tip,
        ));
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
              child: TextField(
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
              child: TextField(
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

  Padding cagriSesAksam() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: cagriSesAksamController,
        keyboardType: TextInputType.number,
        autofocus: true,
        textInputAction: TextInputAction.next,
        decoration: _InputDecarotor().cagriSesAksamInput,
      ),
    );
  }

  Padding anlasma() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          value = anlasmaController.text;
        },
        controller: anlasmaController,
        keyboardType: TextInputType.name,
        autofocus: true,
        autofillHints: const [AutofillHints.name],
        textInputAction: TextInputAction.next,
        decoration: _InputDecarotor().anlasmaInput,
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
            child: TextField(
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
            child: TextField(
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
              child: TextField(
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
              child: TextField(
                controller: ogrenciSayisi,
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
              child: TextField(
                controller: ogrencikota,
                keyboardType: TextInputType.number,
                autofocus: true,
                autofillHints: const [AutofillHints.telephoneNumber],
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
              child: TextField(
                  controller: serviskota,
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
      child: TextField(
        controller: telefon,
        keyboardType: TextInputType.phone,
        autofocus: true,
        autofillHints: const [AutofillHints.telephoneNumber],
        textInputAction: TextInputAction.next,
        decoration: _InputDecarotor().telephoneInput,
      ),
    );
  }

  Padding okulName() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: hedefAdi,
        keyboardType: TextInputType.name,
        autofocus: true,
        autofillHints: const [AutofillHints.email],
        textInputAction: TextInputAction.next,
        decoration: _InputDecarotor().nameInput,
      ),
    );
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
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      hintText: 'Telefon Numarası',
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
      hintText: "Tip ",
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
}
