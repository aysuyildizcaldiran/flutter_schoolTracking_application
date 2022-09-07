import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_json/material/colors.dart';
import 'package:flutter_application_json/view/add_view.dart';
import 'package:flutter_application_json/view/kullanici_update.dart';

class My extends StatefulWidget {
  const My({Key? key}) : super(key: key);

  @override
  State<My> createState() => _MyAppState();
}

class _MyAppState extends State<My> {
  String name = "";
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('hedef').where('durum', isEqualTo: true).snapshots();
  var data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: ProjectColors.orange,
            title: Card(
              child: TextField(
                autofocus: true,
                decoration: InputDecoration(prefixIcon: Icon(Icons.search), hintText: 'Search...'),
                onChanged: (val) {
                  setState(() {
                    name = val;
                  });
                },
              ),
            )),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('kullanici').where('telefon', isEqualTo: name).snapshots(),
          builder: (context, snapshots) {
            if (snapshots.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshots.connectionState == ConnectionState.waiting) {
              return const Center(child: Text("Loading"));
            }
            return ListView.builder(
                itemCount: snapshots.data!.docs.length,
                itemBuilder: (context, index) {
                  data = snapshots.data!.docs[index].data() as Map<String, dynamic>;
                  String id = data['rid'];
                  if (name.isNotEmpty) {
                    return ListTile(
                        title: Text(
                          data['adSoyad'],
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        trailing: Wrap(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext) => KullaniciUpdate(
                                                id: id,
                                              )));
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: ProjectColors.amber,
                                )),
                            IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return querySnapshot(id);
                                      });
                                },
                                icon: Icon(
                                  Icons.school,
                                  color: ProjectColors.amber,
                                )),
                          ],
                        ));
                  }
                  return Container();
                });
          },
        ));
  }

  StreamBuilder<QuerySnapshot<Object?>> querySnapshot(String id) {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text("Loading"));
        }
        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> okulData = document.data()! as Map<String, dynamic>;
            var okulId = [okulData['rid']];

            return Center(
                child: ListTile(
              title: Text(
                okulData['hedefAdi'],
                style: Theme.of(context).textTheme.headline6,
              ),
              onTap: () {
                FirebaseFirestore.instance
                    .collection("kullanici")
                    .doc(id)
                    .update({"hedefId": FieldValue.arrayUnion(okulId)});
              },
            ));
          }).toList(),
        );
      },
    );
  }
}
