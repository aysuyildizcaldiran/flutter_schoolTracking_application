import 'package:flutter/material.dart';
import 'package:flutter_application_json/material/%C4%B1cons.dart';
import 'package:flutter_application_json/material/colors.dart';
import 'package:flutter_application_json/material/text.dart';
import 'package:flutter_application_json/view/add_view.dart';

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
        backgroundColor: ProjectColors.orange,
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
                  icon: ProjectIcon.schoolIcon,
                  label: Text(ProjectText.okulEkle),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(ProjectColors.orange))),
            ),
          ],
        ),
      ),
    );
  }
}
