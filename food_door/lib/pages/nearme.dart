
import 'package:flutter/material.dart';

class Nearme extends StatefulWidget {
  const Nearme({Key? key}) : super(key: key);

  @override
  _NearmeState createState() => _NearmeState();
}

class _NearmeState extends State<Nearme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Near Me"),),
    );
  }
}
