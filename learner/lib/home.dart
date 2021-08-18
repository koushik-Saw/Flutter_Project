import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

Icon cusicon = Icon(Icons.notifications);
Widget custitle = Text("Home");

class _HomeState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: custitle,
      //   leading: Icon(Icons.home_outlined),
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: cusicon,
      //     ),
      //     IconButton(onPressed: () {}, icon: Icon(Icons.person))
      //     // IconButton(
      //     //     onPressed: () {
      //     //       FirebaseAuth.instance.signOut();
      //     //       Navigator.push(
      //     //           context, MaterialPageRoute(builder: (context) => login()));
      //     //     },
      //     //     icon: Icon(Icons.logout))
      //   ],
      // ),
      body: getdata(),
    );
  }

  getdata() {}
}
