import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/newdata.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    UpdateData(),
    UpdateData(),
    UpdateData(),
    UpdateData()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.black, unselectedItemColor: Colors.black,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'Menu',
              style: TextStyle(color: Colors.black),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.one_x_mobiledata),
            title: Text(
              'Order',
              style: TextStyle(color: Colors.black),
            ),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              title: Text(
                'Pay-In',
                style: TextStyle(color: Colors.black),
              )),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
