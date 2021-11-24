import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_door/pages/account.dart';
import 'package:food_door/pages/cart.dart';
import 'package:food_door/pages/homepage.dart';
import 'package:food_door/pages/myorder.dart';
import 'package:food_door/pages/nearme.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({Key? key}) : super(key: key);

  @override
  _BottomnavState createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  int indexno = 0;
  final List<Widget> _childreen = [
    const Homepage(),
    const Nearme(),
    const Cart(),
    const Myorder(),
    const Account(),
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
          BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ), label: ""),
          BottomNavigationBarItem(icon: Icon(
            Icons.bookmark,
          ), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: ""),
        ],
      ),
    );
  }
}
