import 'package:flutter/material.dart';
import 'package:tugasakhir/example.dart';
import 'package:tugasakhir/menu/ternak.dart';
import 'package:tugasakhir/menu/toko.dart';

import '../menu/info.dart';

// void main() {
//   runApp(MaterialApp(
//     title: 'Sapi',
//   ));
// }

class Pagehome extends StatefulWidget {
  @override
  _PagehomeState createState() => _PagehomeState();
}

class _PagehomeState extends State<Pagehome> {
  Future<bool> exitDialog;
  // return ShowDialog()
  int _pilihanbottom = 0;

  final List<Widget> childern = [
    ternak(),
    toko(),
    info(),
    // profile(),
    DataPasien(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _pilihanbottom = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: childern.elementAt(_pilihanbottom)),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ternak',
            backgroundColor: Colors.grey
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Toko',
              backgroundColor: Colors.grey
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
              backgroundColor: Colors.grey
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
              backgroundColor: Colors.grey
          ),
        ],
        currentIndex: _pilihanbottom,
        selectedItemColor: Colors.red[700],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: ()=> SystemNavigator.pop(),
      //   tooltip: 'Close app',
      //   backgroundColor: Colors.blue,
      //   child: Icon(Icons.exit_to_app),
      // ),
    );
  }
}
