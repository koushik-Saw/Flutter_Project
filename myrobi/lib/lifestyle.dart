import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lifestyle extends StatefulWidget {
  const Lifestyle({Key? key}) : super(key: key);

  @override
  _LifestyleState createState() => _LifestyleState();
}

class _LifestyleState extends State<Lifestyle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lifestyle"),),
    );
  }
}
