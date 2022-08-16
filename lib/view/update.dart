import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Update extends StatefulWidget {
  final String id;
  const Update({Key? key, required this.id}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  var userData = {};
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
    print("************");
    print(userData['hedefAdi']);
    print("*************");
    setState(() {
      userData = userData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 245, 183, 48),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                initialValue: userData['telefon'].toString(),
                textInputAction: TextInputAction.next,
              ),
            ),
            Text(userData['hedefAdi'].toString()),
            Text(userData['telefon'].toString()),
          ],
        ));
  }
}
