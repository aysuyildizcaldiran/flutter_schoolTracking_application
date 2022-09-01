import 'package:flutter/material.dart';
import 'package:flutter_application_json/material/%C4%B1cons.dart';
import 'package:flutter_application_json/material/colors.dart';
import 'package:flutter_application_json/material/text.dart';
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
  var items = ["Ogrenci", "Personel"];
  String dropdownvalue = "Ogrenci";

  var itemsss = ["Bireysel", "Topluca"];
  String anlasmadropdownvalue = "Bireysel";
  @override
  void initState() {
    super.initState();
    cagriSesId.text = "13508667";
    cagriSesAksamController.text = "13508667";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: hedefAddAppBar(context),
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
              tipMethot(),
            ],
          ),
        ),
      ]),
    );
  }

  AppBar hedefAddAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectColors.orange,
      title: Text(ProjectText.okulEkle,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(color: ProjectColors.white)),
      actions: [
        addHedefButton(context),
      ],
    );
  }

  TextButton addHedefButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Hedef3Service()
            .addHedef(
              hedefAdi.text,
              telefon.text,
              ogrencikota.text,
              serviskota.text,
              ogrenciSayisi.text,
              cagriSesId.text,
              komisyon.text,
              fiyat.text,
              anlasmaController.text,
              cagriSesAksamController.text,
              dLatitude.text,
              dLongitude.text,
              tip.text,
            )
            .then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Okul Ekleme Başarılı!"),
                  backgroundColor: ProjectColors.amber,
                )));
      },
      child: Text(
        ProjectText.kaydet,
        style: Theme.of(context).textTheme.subtitle2?.copyWith(color: ProjectColors.white),
      ),
    );
  }

  Container tipMethot() {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Text(ProjectText.tipSeciniz),
          DropdownButton(
            value: dropdownvalue,
            icon: ProjectIcon.tipIcon,
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
                  cagriSesId.text = "13508667";
                  cagriSesAksamController.text = "13508667";
                } else {
                  tip.text = "2";
                  cagriSesId.text = "20825999";
                  cagriSesAksamController.text = "20825999";
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
                  anlasmaController.text = "1";
                } else {
                  anlasmaController.text = "2";
                }
              });
            },
          ),
        ],
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
      label: Text("Öğrenci Kota Sayısı"), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final tipInput =
      InputDecoration(hintText: 'Tip', enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final cagriSesIdInput = InputDecoration(
      label: Text("Çağrı Ses ID"), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));

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
      hintText: "Tip ",
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
}
