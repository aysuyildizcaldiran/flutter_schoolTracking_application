import 'package:flutter/material.dart';
import 'package:flutter_application_json/material/colors.dart';
import 'package:flutter_application_json/material/text.dart';
import 'package:flutter_application_json/service/kullanici_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class KullaniciAdd extends StatefulWidget {
  final String id;
  const KullaniciAdd({Key? key, required this.id}) : super(key: key);

  @override
  State<KullaniciAdd> createState() => _KullaniciAddState();
}

class _KullaniciAddState extends State<KullaniciAdd> {
  TextEditingController yakinMesafeController = TextEditingController();
  KullaniciServis kullaniciServis = KullaniciServis();
  TextEditingController nameController = TextEditingController();
  TextEditingController dLatitude = TextEditingController();
  TextEditingController dLongitude = TextEditingController();
  TextEditingController telefon = TextEditingController();
  TextEditingController sifreController = TextEditingController();

  TextEditingController sms = TextEditingController();
  TextEditingController hedefID = TextEditingController();
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
      appBar: kullaniciAppBar(context),
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
          ],
        )
      ]),
    );
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
          fillColor: MaterialStateProperty.all(ProjectColors.orange),
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
          fillColor: MaterialStateProperty.all(Colors.amber),
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

  AppBar kullaniciAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: ProjectColors.orange,
      title: Text("Kullanıcı Ekle"),
      actions: [
        TextButton(
          onPressed: () {
            try {
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
                <String>[hedefID.text],
              ).then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Kullanıcı Ekleme Başarılı!"),
                    backgroundColor: ProjectColors.amber,
                  )));
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(e.toString()),
                backgroundColor: ProjectColors.amber,
              ));
            }
          },
          child: Text(
            ProjectText.kaydet,
            style: Theme.of(context).textTheme.subtitle2?.copyWith(color: ProjectColors.white),
          ),
        )
      ],
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

  Row tercihFunction(BuildContext context) {
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
        child: Text(ProjectText.tercih, style: Theme.of(context).textTheme.subtitle1),
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
  final sifreInput = InputDecoration(
      label: Text("Şifre"),
      prefixIcon: const Icon(
        Icons.password_outlined,
        color: Colors.grey,
      ),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final dLatitude = InputDecoration(
      label: Text("Latitude"), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final dLongitude = InputDecoration(
      label: Text("Longitude"), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
  final yakinMesafe = InputDecoration(
      label: Text("Yakın Mesafe"), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
}
