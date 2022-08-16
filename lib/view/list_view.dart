import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_json/model/hedef3.dart';
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
          backgroundColor: const Color.fromARGB(255, 245, 183, 48),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }

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
                      subtitle: Text(id),
                      trailing: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext) => Update(
                                          id: id,
                                        )));
                          },
                          icon: const Icon(
                            Icons.document_scanner_outlined,
                            color: Colors.orange,
                          ))),
                );
              }).toList(),
            );
          },
        ));
  }
}
