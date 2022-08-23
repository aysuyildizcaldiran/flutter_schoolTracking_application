import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_json/view/add_view.dart';
import 'package:flutter_application_json/view/kullanici_add_view.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 183, 48),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              padding: EdgeInsets.all(10),
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => AddView()));
                  },
                  icon: Icon(Icons.school_outlined),
                  label: Text("Okul Ekle"),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 245, 183, 48)))),
            ),
            Container(
                width: 250,
                padding: EdgeInsets.all(10),
                child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => Kullanici()));
                    },
                    icon: Icon(Icons.person),
                    label: Text("Kişi Ekle"),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 245, 183, 48)))))
          ],
        ),
      ),
    );
  }
}
