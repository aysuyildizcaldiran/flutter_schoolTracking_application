import 'package:flutter/material.dart';
import 'package:flutter_application_json/service/hedef3_service.dart';
import 'package:flutter_application_json/view/add_view.dart';
import 'package:flutter_application_json/view/ekle_menu.dart';
import 'package:flutter_application_json/view/list_view.dart';
import 'package:flutter_application_json/view/search_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Lists(),
    Menu(),
    SearchView(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
          child: BottomNavigationBar(
            backgroundColor: Color.fromARGB(255, 245, 183, 48),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.list, color: Colors.white),
                label: 'List',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add, color: Colors.white),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search_outlined, color: Colors.white),
                label: 'Search',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            showUnselectedLabels: false,
            onTap: _onItemTapped,
          ),
        ));
  }
}
