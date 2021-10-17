import 'dart:ui';

import 'package:assignment/homepage.dart';
import 'package:flutter/material.dart';

import 'bookmarks.dart';
import 'cart.dart';
import 'favourites.dart';
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
    const Favourites(),
    const Cart(),
    const Bookmarks(),
    const Menu()
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
        items: [
           const BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "",
          ),
          const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
          BottomNavigationBarItem(
              icon:CircleAvatar(
                radius: 30,
                child: IconButton(
                    icon: Image.asset("asset/shopping_cart.png"),
                    onPressed: () {}),
                  backgroundColor: Colors.deepOrangeAccent
              ) ,
              label: ""),
          const BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outlined), label: ""),
          const BottomNavigationBarItem(icon: Icon(Icons.menu), label: "")
        ],
      ),
    );
  }
}
