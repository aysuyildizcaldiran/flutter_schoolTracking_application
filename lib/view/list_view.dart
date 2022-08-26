import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_json/material/colors.dart';
import 'package:flutter_application_json/view/kullanici_add_view.dart';
import 'package:flutter_application_json/view/update.dart';

class Lists extends StatefulWidget {
  const Lists({Key? key}) : super(key: key);

  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('hedef').where('durum', isEqualTo: true).snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ProjectColors.orange,
        ),
        body: querySnapshot());
  }

  StreamBuilder<QuerySnapshot<Object?>> querySnapshot() {
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text("Loading"));
        }
        return listviewMethod(snapshot, context);
      },
    );
  }

  ListView listviewMethod(AsyncSnapshot<QuerySnapshot<Object?>> snapshot, BuildContext context) {
    return ListView(
      children: snapshot.data!.docs.map((DocumentSnapshot document) {
        Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
        String id = data['rid'];
        return Center(
          child: ListTile(
              title: Text(
                data['hedefAdi'],
                style: Theme.of(context).textTheme.headline6,
              ),
              trailing: wrapMethod(context, id)),
        );
      }).toList(),
    );
  }

  Wrap wrapMethod(BuildContext context, String id) {
    return Wrap(
      children: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext) => Update(
                            id: id,
                          )));
            },
            icon: Icon(
              Icons.document_scanner_outlined,
              color: ProjectColors.amber,
            )),
        IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext) => KullaniciAdd(id: id)));
            },
            icon: Icon(
              Icons.person_add_alt_1_outlined,
              color: ProjectColors.amber,
            ))
      ],
    );
  }
}
