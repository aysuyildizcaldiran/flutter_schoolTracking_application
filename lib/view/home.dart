import 'package:flutter/material.dart';
import 'package:flutter_application_json/material/%C4%B1cons.dart';
import 'package:flutter_application_json/material/colors.dart';
import 'package:flutter_application_json/view/add_view.dart';
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
    AddView(),
    My(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _widgetOptions.elementAt(_selectedIndex), bottomNavigationBar: clipRRectMethot());
  }

  ClipRRect clipRRectMethot() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(40),
        topLeft: Radius.circular(40),
      ),
      child: BottomNavigationBar(
        backgroundColor: ProjectColors.orange,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ProjectIcon.listIcon,
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: ProjectIcon.addIcon,
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: ProjectColors.white,
        showUnselectedLabels: false,
        onTap: _onItemTapped,
      ),
    );
  }
}
