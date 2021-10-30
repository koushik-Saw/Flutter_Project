import 'dart:ui';


import 'package:flutter/material.dart';
import 'package:myrobi/account.dart';
import 'package:myrobi/lifestyle.dart';
import 'package:myrobi/offers.dart';

import 'homepage.dart';
import 'menu.dart';


void main() {
  runApp(
    MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyApp(),
    ),
  );
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: Bottomnav(),
    );
  }
}

class Bottomnav extends StatefulWidget {
  const Bottomnav({Key? key}) : super(key: key);

  @override
  _BottomnavState createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int indexno = 0;
  final List<Widget> _childreen = [
    const Homepage(),
    const Lifestyle(),
    const Offers(),
    const Account(),
    const Menu(),
  ];

  void ontaped(int index) {
    setState(() {
      indexno = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _childreen[indexno],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.deepOrangeAccent,
        onTap: ontaped,
        currentIndex: indexno,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.local_mall), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer_rounded),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "")
        ],
      ),
    );
  }
}
