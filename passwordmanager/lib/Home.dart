import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passwordmanager/Add.dart';
import 'package:passwordmanager/Update.dart';

import 'HomePage.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Home",
      home: Myapp(),
    );
  }
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int indexno = 0;
  final List<Widget> _childreen = [HomePage(), Add(), Updates()];

  void ontaped(int index) {
    setState(() {
      indexno = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xffffff),
      body: _childreen[indexno],
      bottomNavigationBar: BottomNavigationBar(
        onTap: ontaped,
        currentIndex: indexno,
        items: [
          BottomNavigationBarItem(icon: new Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: new Icon(Icons.add), label: ''),
          BottomNavigationBarItem(icon: new Icon(Icons.print),label: '')
        ],
      ),
    );
  }
}

