import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_json/service/kullanici_service.dart';

class Kullanici extends StatefulWidget {
  const Kullanici({Key? key}) : super(key: key);

  @override
  State<Kullanici> createState() => _KullaniciState();
}

class _KullaniciState extends State<Kullanici> {
  KullaniciServis kullaniciServis = KullaniciServis();
  TextEditingController nameController = TextEditingController();
  TextEditingController dLatitude = TextEditingController();
  TextEditingController dLongitude = TextEditingController();
  TextEditingController telefon = TextEditingController();
  TextEditingController sifreController = TextEditingController();
  TextEditingController yakinMesafeController = TextEditingController();
  TextEditingController sms = TextEditingController();

  bool smsisChecked = true;
  bool cagriisChecked = true;
  bool soforisChecked = false;
  bool hostesisChecked = false;
  bool kullaniciisChecked = false;
  bool adminisChecked = true;
  bool idariisChecked = false;
  bool veliisChecked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    yakinMesafeController.text = "250";
    smsisChecked;
    cagriisChecked;
    hostesisChecked;
    kullaniciisChecked;
    soforisChecked;
    adminisChecked;
    idariisChecked;
    veliisChecked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 183, 48),
        actions: [
          TextButton(
            onPressed: () {
              kullaniciServis.addKisi(
                nameController.text,
                telefon.text,
                dLatitude.text,
                dLongitude.text,
                sifreController.text,
                yakinMesafeController.text,
                telefon.text,
                smsisChecked,
                cagriisChecked,
                hostesisChecked,
                kullaniciisChecked,
                soforisChecked,
                adminisChecked,
                idariisChecked,
                veliisChecked,
              );
            },
            child: Text(
              "Kaydet",
              style: Theme.of(context).textTheme.subtitle2?.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
      body: ListView(children: [
        Column(
          children: [
            name(),
            telefonFunction(),
            yerFunction(),
            sifre(),
            yakinMesafe(),
            tercihFunction(context),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text("SMS"),
                ),
                Checkbox(
                  fillColor: MaterialStateProperty.all(Colors.amber),
                  value: smsisChecked,
                  onChanged: (((bool? value) {
                    setState(() {
                      smsisChecked = value!;
                    });
                  })),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text("Çağrı"),
                ),
                Checkbox(
                  fillColor: MaterialStateProperty.all(Colors.amber),
                  value: cagriisChecked,
                  onChanged: (((bool? value) {
                    setState(() {
                      cagriisChecked = value!;
                    });
                  })),
                )
              ],
            ),
            Row(children: <Widget>[
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 15.0),
                    child: Divider(
                      color: Colors.black,
                      height: 50,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Yetki", style: Theme.of(context).textTheme.subtitle1),
              ),
              Expanded(
                child: new Container(
                    margin: const EdgeInsets.only(left: 15.0, right: 10.0),
                    child: Divider(
                      color: Colors.black,
                      height: 50,
                    )),
              ),
            ]),
            soforFunction(context),
            hostesFunction(context),
            kullaniciFunction(context),
            adminFunction(context),
            idariFunction(context),
            veliFunction(context)
          ],
        )
      ]),
    );
  }

  Row hostesFunction(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Hostes", style: Theme.of(context).textTheme.subtitle1),
        ),
        Checkbox(
          fillColor: MaterialStateProperty.all(Colors.amber),
          value: hostesisChecked,
          onChanged: (((bool? value) {
            setState(() {
              hostesisChecked = value!;
            });
          })),
        ),
      ],
    );
  }

  Row soforFunction(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Şoför", style: Theme.of(context).textTheme.subtitle1),
        ),
        Checkbox(
          fillColor: MaterialStateProperty.all(Colors.amber),
          value: soforisChecked,
          onChanged: (((bool? value) {
            setState(() {
              soforisChecked = value!;
            });
          })),
        ),
      ],
    );
  }

  Row kullaniciFunction(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Kullanıcı", style: Theme.of(context).textTheme.subtitle1),
        ),
        Checkbox(
          fillColor: MaterialStateProperty.all(Colors.amber),
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

  Row adminFunction(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Admin", style: Theme.of(context).textTheme.subtitle1),
        ),
        Checkbox(
          fillColor: MaterialStateProperty.all(Colors.amber),
          value: adminisChecked,
          onChanged: (((bool? value) {
            setState(() {
              adminisChecked = value!;
            });
          })),
        ),
      ],
    );
  }

  Row idariFunction(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("İdari", style: Theme.of(context).textTheme.subtitle1),
        ),
        Checkbox(
          fillColor: MaterialStateProperty.all(Colors.amber),
          value: idariisChecked,
          onChanged: (((bool? value) {
            setState(() {
              idariisChecked = value!;
            });
          })),
        ),
      ],
    );
  }

  Row veliFunction(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Veli", style: Theme.of(context).textTheme.subtitle1),
        ),
        Checkbox(
          fillColor: MaterialStateProperty.all(Colors.amber),
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

  Row tercihFunction(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: Divider(
              color: Colors.black,
              height: 50,
            )),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Tercih", style: Theme.of(context).textTheme.subtitle1),
      ),
      Expanded(
        child: new Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: Divider(
              color: Colors.black,
              height: 50,
            )),
      ),
    ]);
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
}

class _InputDecarotor {
  final nameInput = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      hintText: 'Ad Soyad',
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
  final sifreInput = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      hintText: 'Şifre',
      prefixIcon: const Icon(
        Icons.password_outlined,
        color: Colors.grey,
      ),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final dLatitude = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      hintText: 'Latitude',
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final dLongitude = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      hintText: 'Longitude',
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final yakinMesafe = InputDecoration(
      hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
      hintText: 'Yakın Mesafe',
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
}
