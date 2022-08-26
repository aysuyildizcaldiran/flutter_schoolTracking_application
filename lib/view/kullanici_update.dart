import 'package:flutter/material.dart';
import 'package:flutter_application_json/material/colors.dart';
import 'package:flutter_application_json/material/text.dart';
import 'package:flutter_application_json/model/kullanici.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class KullaniciUpdate extends StatefulWidget {
  final String id;
  const KullaniciUpdate({Key? key, required this.id}) : super(key: key);

  @override
  State<KullaniciUpdate> createState() => _KullaniciUpdateState();
}

class _KullaniciUpdateState extends State<KullaniciUpdate> {
  late Map userData;
  TextEditingController nameController = TextEditingController();
  TextEditingController dLatitude = TextEditingController();
  TextEditingController dLongitude = TextEditingController();
  TextEditingController telefon = TextEditingController();
  TextEditingController sifreController = TextEditingController();
  TextEditingController yakinMesafeController = TextEditingController();
  TextEditingController hedef = TextEditingController();

  bool smsisChecked = true;
  bool cagriisChecked = true;
  bool soforisChecked = false;
  bool hostesisChecked = false;
  bool kullaniciisChecked = false;
  bool adminisChecked = true;
  bool idariisChecked = false;
  bool veliisChecked = false;
  bool durumisChecked = true;
  @override
  void initState() {
    super.initState();
    try {
      getData();
    } catch (e) {}

    durumisChecked;
    smsisChecked;
    cagriisChecked;
    hostesisChecked;
    kullaniciisChecked;
    soforisChecked;
    adminisChecked;
    idariisChecked;
    veliisChecked;
    durumisChecked;
    hedef;
  }

  getData() async {
    try {
      var snap = await FirebaseFirestore.instance.collection("kisi").doc(widget.id).get();
      userData = snap.data()!;
    } catch (e) {
      print(e.toString());
    }

    setState(() {
      userData = userData;
      nameController.text = userData['adSoyad'];
      telefon.text = userData['telefon'].toString();
      sifreController.text = userData['sifre'];
      yakinMesafeController.text = userData['yaklastiMesafe'].toString();
      dLatitude.text = userData['adres']['_latitude'].toString();
      dLongitude.text = userData['adres']['_longitude'].toString();
      smsisChecked = userData['tercih']['sms'];
      cagriisChecked = userData['tercih']['cagri'];
      adminisChecked = userData['yetki']['admin'];
      kullaniciisChecked = userData['yetki']['kullanici'];
      soforisChecked = userData['yetki']['sofor'];
      hostesisChecked = userData['yetki']['hostes'];
      idariisChecked = userData['yetki']['idari'];
      veliisChecked = userData['yetki']['veli'];
      durumisChecked = userData['durum'];
      hedef.text = userData['hedefId'].toString();
    });
  }

  getUpdate() async {
    var telefonparse = int.parse(telefon.text);
    var yakinMesafeparse = int.parse(yakinMesafeController.text);
    var dlatitudeparse = int.parse(dLatitude.text);
    var dlongitudeparse = int.parse(dLongitude.text);

    var snap = await FirebaseFirestore.instance.collection("kisi").doc(widget.id).update({
      "adSoyad": nameController.text,
      "telefon": telefonparse,
      "sifre": sifreController.text,
      "yaklastiMesafe": yakinMesafeparse,
      "adres._latitude": dlatitudeparse,
      "adres._longitude": dlongitudeparse,
      "tercih.sms": smsisChecked,
      "tercih.cagri": cagriisChecked,
      "yetki.admin": adminisChecked,
      "yetki.kullanici": kullaniciisChecked,
      "yetki.sofor": soforisChecked,
      "yetki.hostes": hostesisChecked,
      "yetki.idari": idariisChecked,
      "yetki.veli": veliisChecked,
      "durum": durumisChecked,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kullaniciUpdateAppBar(context),
      body: ListView(children: [
        Column(
          children: [
            name(),
            telefonFunction(),
            yerFunction(),
            sifre(),
            yakinMesafe(),
            tercihFunction(context),
            tercihIslem(),
            yetkiMethot(context),
            hostesFunction(context),
            idariFunction(context),
            durumMethot(context),
            durumFunction(context),
            hedefFunction()
          ],
        )
      ]),
    );
  }

  AppBar kullaniciUpdateAppBar(BuildContext context) {
    return AppBar(
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
    );
  }

  Row durumMethot(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: ProjectColors.black,
              height: 50,
            )),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(ProjectText.durum, style: Theme.of(context).textTheme.subtitle1),
      ),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Divider(
              color: ProjectColors.black,
              height: 50,
            )),
      ),
    ]);
  }

  Row yetkiMethot(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: ProjectColors.black,
              height: 50,
            )),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(ProjectText.yetki, style: Theme.of(context).textTheme.subtitle1),
      ),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Divider(
              color: ProjectColors.black,
              height: 50,
            )),
      ),
    ]);
  }

  Row tercihIslem() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(ProjectText.sms),
        ),
        Checkbox(
          fillColor: MaterialStateProperty.all(ProjectColors.amber),
          value: smsisChecked,
          onChanged: (((bool? value) {
            setState(() {
              smsisChecked = value!;
            });
          })),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(ProjectText.cagri),
        ),
        Checkbox(
          fillColor: MaterialStateProperty.all(ProjectColors.amber),
          value: cagriisChecked,
          onChanged: (((bool? value) {
            setState(() {
              cagriisChecked = value!;
            });
          })),
        )
      ],
    );
  }

  Padding name() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: nameController,
        keyboardType: TextInputType.name,
        autofocus: true,
        autofillHints: const [AutofillHints.email],
        textInputAction: TextInputAction.next,
        decoration: _InputDecarotor().nameInput,
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

  Padding sifre() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: sifreController,
        keyboardType: TextInputType.visiblePassword,
        autofocus: true,
        autofillHints: const [AutofillHints.password],
        textInputAction: TextInputAction.next,
        decoration: _InputDecarotor().sifreInput,
      ),
    );
  }

  Padding yakinMesafe() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: yakinMesafeController,
        keyboardType: TextInputType.number,
        autofocus: true,
        autofillHints: const [AutofillHints.telephoneNumber],
        textInputAction: TextInputAction.next,
        decoration: _InputDecarotor().yakinMesafe,
      ),
    );
  }

  Row hostesFunction(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(ProjectText.hostes, style: Theme.of(context).textTheme.subtitle1),
        ),
        Checkbox(
          fillColor: MaterialStateProperty.all(ProjectColors.amber),
          value: hostesisChecked,
          onChanged: (((bool? value) {
            setState(() {
              hostesisChecked = value!;
            });
          })),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(ProjectText.sofor, style: Theme.of(context).textTheme.subtitle1),
        ),
        Checkbox(
          fillColor: MaterialStateProperty.all(ProjectColors.amber),
          value: soforisChecked,
          onChanged: (((bool? value) {
            setState(() {
              soforisChecked = value!;
            });
          })),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(ProjectText.kullanici, style: Theme.of(context).textTheme.subtitle1),
        ),
        Checkbox(
          fillColor: MaterialStateProperty.all(ProjectColors.amber),
          value: kullaniciisChecked,
          onChanged: (((bool? value) {
            setState(() {
              kullaniciisChecked = value!;
            });
          })),
        ),
      ],
    );
  }

  Row idariFunction(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(ProjectText.admin, style: Theme.of(context).textTheme.subtitle1),
        ),
        Checkbox(
          fillColor: MaterialStateProperty.all(ProjectColors.amber),
          value: adminisChecked,
          onChanged: (((bool? value) {
            setState(() {
              adminisChecked = value!;
            });
          })),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(ProjectText.idari, style: Theme.of(context).textTheme.subtitle1),
        ),
        Checkbox(
          fillColor: MaterialStateProperty.all(ProjectColors.amber),
          value: idariisChecked,
          onChanged: (((bool? value) {
            setState(() {
              idariisChecked = value!;
            });
          })),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(ProjectText.veli, style: Theme.of(context).textTheme.subtitle1),
        ),
        Checkbox(
          fillColor: MaterialStateProperty.all(ProjectColors.amber),
          value: veliisChecked,
          onChanged: (((bool? value) {
            setState(() {
              veliisChecked = value!;
            });
          })),
        ),
      ],
    );
  }

  Row durumFunction(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(ProjectText.durum, style: Theme.of(context).textTheme.subtitle1),
      ),
      Checkbox(
        fillColor: MaterialStateProperty.all(ProjectColors.amber),
        value: durumisChecked,
        onChanged: (((bool? value) {
          setState(() {
            durumisChecked = value!;
          });
        })),
      ),
    ]);
  }

  Row tercihFunction(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: ProjectColors.black,
              height: 50,
            )),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(ProjectText.tercih, style: Theme.of(context).textTheme.subtitle1),
      ),
      Expanded(
        child: Container(
            margin: EdgeInsets.only(left: 15.0, right: 10.0),
            child: Divider(
              color: ProjectColors.black,
              height: 50,
            )),
      ),
    ]);
  }

  Padding hedefFunction() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: hedef,
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
      label: Text("Ad Soyad"),
      prefixIcon: const Icon(
        Icons.person,
        color: Colors.grey,
      ),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final telephoneInput = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      label: Text("Telefon Numarası"),
      prefixIcon: const Icon(
        Icons.phone,
        color: Colors.grey,
      ),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final sifreInput = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      label: Text("Şifre"),
      prefixIcon: const Icon(
        Icons.password_outlined,
        color: Colors.grey,
      ),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final dLatitude = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      label: Text("Latitude"),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final dLongitude = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      label: Text("Longitude"),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final yakinMesafe = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      label: Text("Yakın Mesafe"),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
}
