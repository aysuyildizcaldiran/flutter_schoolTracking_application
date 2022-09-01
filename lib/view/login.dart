import 'package:flutter/material.dart';
import 'package:flutter_application_json/material/colors.dart';
import 'package:flutter_application_json/view/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_json/view/search_view.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController sifre = TextEditingController();

  bool sifreVisible = true;
  @override
  void initState() {
    super.initState();
    sifreVisible;
  }

  getData(String email, String sifre) {
    FirebaseFirestore.instance.collection('kullanici').get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        String sifre2 = doc["sifre"];
        String email2 = doc["email"];
        if (email == email2 && sifre == sifre2) {
          Navigator.pushAndRemoveUntil(
              context, MaterialPageRoute(builder: (context) => const Home()), (route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Kullanıcı Giriş Başarısız!"),
            backgroundColor: ProjectColors.amber,
          ));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ProjectColors.orange,
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(20),
              child: TextField(controller: email, decoration: _InputDecarotor().nameInput)),
          Container(
            padding: EdgeInsets.all(20),
            child: TextField(
                controller: sifre,
                obscureText: sifreVisible,
                decoration: InputDecoration(
                  label: Text("Şifre"),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        sifreVisible = !sifreVisible;
                      });
                    },
                    icon: Icon(sifreVisible ? Icons.visibility_off : Icons.visibility),
                  ),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                )),
          ),
          Container(
            width: 200,
            child: ElevatedButton(
                onPressed: () {
                  if (email.text.isNotEmpty && sifre.text.isNotEmpty) {
                    getData(email.text, sifre.text);
                  }
                },
                child: Text("Giriş"),
                style: ElevatedButton.styleFrom(primary: ProjectColors.amber)),
          )
        ],
      ),
    );
  }
}

class _InputDecarotor {
  final nameInput = InputDecoration(
      label: Text("Email"),
      prefixIcon: const Icon(
        Icons.email,
        color: Colors.grey,
      ),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15)));
}
