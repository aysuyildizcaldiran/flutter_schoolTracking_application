import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_json/material/%C4%B1cons.dart';
import 'package:flutter_application_json/material/colors.dart';
import 'package:flutter_application_json/model/kullanici.dart';
import 'package:flutter_application_json/view/kullanici_add_view.dart';
import 'package:flutter_application_json/view/kullanici_update.dart';
import 'package:flutter_application_json/view/update.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('kisi').where('durum', isEqualTo: true).snapshots();
  Icon icon = ProjectIcon.searchIcon;
  Widget appBarTitle = Text(
    "Search Example",
    style: TextStyle(color: ProjectColors.white),
  );

  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ProjectColors.orange,
          title: Text('Kullanıcı Ara'),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: MySearchDelegate());
                },
                icon: icon)
          ],
        ),
        body: Container());
  }
}

StreamBuilder<QuerySnapshot<Object?>> querySnapshot() {
  String query;
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('kisi').where('durum', isEqualTo: true).snapshots();

  return StreamBuilder<QuerySnapshot>(
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
                data['adSoyad'],
                style: Theme.of(context).textTheme.headline6,
              ),
              trailing: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext) => KullaniciUpdate(
                                  id: data['rid'],
                                )));
                  },
                  icon: Icon(
                    Icons.document_scanner_outlined,
                    color: ProjectColors.amber,
                  )),
              onTap: () {
                query = data['adSoyad'];
              },
            ),
          );
        }).toList(),
      );
    },
  );
}

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.amber,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back, color: Colors.amber),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('kisi')
        .where('telefon', isEqualTo: query)
        .where('durum', isEqualTo: true)
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
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
                    data['adSoyad'],
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext) => KullaniciUpdate(
                                      id: data['rid'],
                                    )));
                      },
                      icon: Icon(
                        Icons.document_scanner_outlined,
                        color: ProjectColors.amber,
                      )),
                  onTap: () {
                    query = data['adSoyad'];
                  },
                ),
              );
            }).toList(),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return querySnapshot();
  }
}
