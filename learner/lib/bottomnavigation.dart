// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:learner/home.dart';
// import 'package:learner/update.dart';
//
// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Home",
//       home: Myapp(),
//     );
//   }
// }
//
// class Myapp extends StatefulWidget {
//   const Myapp({Key? key}) : super(key: key);
//
//   @override
//   _MyappState createState() => _MyappState();
// }
//
// class _MyappState extends State<Myapp> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//      // bottomNavigationBar: BottomNavigation(),
//     );
//   }
// }
//
// class BottomNavigation extends StatefulWidget {
//   const BottomNavigation({Key? key}) : super(key: key);
//
//   @override
//   _BottomNavigationState createState() => _BottomNavigationState();
// }
//
// class _BottomNavigationState extends State<BottomNavigation> {
//   int indexno = 0;
//   final List<Widget> _childreen = [Homepage(), Update()];
//
//   void ontaped(int index) {
//     setState(() {
//       indexno = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         backgroundColor: Color(0xffffff),
//         body: _childreen[indexno],
//         bottomNavigationBar: new Theme(
//           data: Theme.of(context).copyWith(
//             canvasColor: Color(0x000000),
//             primaryColor: Colors.black,
//           ),
//           child: BottomNavigationBar(
//             onTap: ontaped,
//             currentIndex: indexno,
//             items: [
//               BottomNavigationBarItem(
//                   icon: new Icon(Icons.menu),
//                   label: "",
//                   backgroundColor: Colors.red),
//               BottomNavigationBarItem(
//                   icon: new Icon(Icons.person),
//                   label: "Teachers",
//                   backgroundColor: Colors.red)
//             ],
//           ),
//         ));
//   }
// }
