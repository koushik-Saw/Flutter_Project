import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Myorder extends StatefulWidget {
  const Myorder({Key? key}) : super(key: key);

  @override
  _MyorderState createState() => _MyorderState();
}

class _MyorderState extends State<Myorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Saved"),
      ),
    );
  }
}
