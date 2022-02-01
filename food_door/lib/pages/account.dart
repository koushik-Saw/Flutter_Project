import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:food_door/model/bottomtextbutton.dart';
import 'package:food_door/model/listtile.dart';
import 'package:food_door/pages/manageprofile.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool isSwitchOn = false;
  bool isSwitchOn1 = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? user = FirebaseAuth.instance.currentUser?.email;


  Future getThreshold() async {
    await FirebaseFirestore.instance.collection('accounts').doc(user).get();
  }
  Future<Map<String, dynamic>?> getData() async {
    DocumentReference<Map<String, dynamic>> document =
    FirebaseFirestore.instance.collection('accounts').doc(user); // path to doc
    DocumentSnapshot<Map<String, dynamic>> query = await document.get();
    print(query.data());
    return query.data();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffdcdce5),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xfff15a24),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, color: Colors.white),
          )
        ],
      ),
      body: FutureBuilder<Map<String,dynamic>?>(
        future: getData(),
        builder:  (BuildContext context, AsyncSnapshot<Map<String, dynamic>?> snapshot){
          if (snapshot.hasError) return const CircularProgressIndicator();
          return Column(
            children: [
              SizedBox(
                height: size.height * .28,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: CustomShape(),
                      child: Container(
                        height: size.height * .25,
                        color: const Color(0xfff15a24),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 45,
                                width: 45,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80",
                                  ),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:   [Text(snapshot.data!['Username']),
                                    Text(
                                      snapshot.data!['Email'],
                                      style: const TextStyle(
                                          fontSize: 16.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 2,
                              offset: const Offset(
                                  0, 1.0), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.only(top: 100),
                        height: size.height * .12,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children:  [
                            Bottomtextbutton(
                              icons: const Icon(
                                Icons.local_shipping,
                              ),
                              title: "My Order",clr: Colors.black,callback: (){},
                            ),
                             Bottomtextbutton(
                              icons: const Icon(
                                Icons.redeem,
                              ),
                              title: "Offers & Promos",clr: Colors.black,callback: (){}),
                            Bottomtextbutton(
                              icons: const Icon(
                                Icons.room,
                              ),
                              title: snapshot.data!['Delivery Address'],clr: Colors.black,callback: (){})
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 0,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: size.height * .48,
                    width: size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          blurRadius: 2,
                          offset:
                          const Offset(0, 1.0), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          const Text("My Account"),
                          listitle(
                            icn: const Icon(
                              Icons.person,color: Color(0xFF0D1266),
                            ),
                            listtitle: "Manage Profile",
                            wiz:
                            IconButton(onPressed: (){Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Manageprofile()));}, icon: const Icon(
                                Icons.chevron_right_outlined,color: Color(0xFF0D1266))
                            ),),
                          listitle(
                            icn: const Icon(
                              Icons.payment,color: Color(0xFF0D1266),
                            ),
                            listtitle: "Payment",
                            wiz: IconButton(onPressed: (){Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Manageprofile()));}, icon: const Icon(
                                Icons.chevron_right_outlined,color: Color(0xFF0D1266))
                            ),
                          ),
                          const Text("Notification"),
                          listitle(
                            icn: const Icon(
                              Icons.notifications_outlined,color: Color(0xFF0D1266),
                            ),
                            listtitle: "Notification",
                            wiz: FlutterSwitch(
                              padding: 3,
                              toggleColor: const Color.fromRGBO(255, 255, 255, 1.0),
                              activeColor: const Color(0xFFF15A24),
                              inactiveColor: Colors.black,
                              toggleSize: 18.0,
                              height: 25,
                              width: 45,
                              value: isSwitchOn,
                              onToggle: (bool value) {
                                setState(() {
                                  isSwitchOn = value;
                                });
                              },
                            ),
                          ),
                          listitle(
                            icn: const Icon(
                              Icons.notifications_outlined,color: Color(0xFF0D1266),
                            ),
                            listtitle: "Payment", wiz: FlutterSwitch(
                            padding: 3,
                            toggleColor: const Color.fromRGBO(255, 255, 255, 1.0),
                            activeColor: const Color(0xFFF15A24),
                            inactiveColor: Colors.black,
                            toggleSize: 18.0,
                            height: 25,
                            width: 45,
                            value: isSwitchOn1,
                            onToggle: (bool value) {
                              setState(() {
                                isSwitchOn1 = value;
                              });
                            },
                          ),
                          ),
                          const Text("More"),
                          const listitle(
                            icn: Icon(
                              Icons.logout_outlined,color: Color(0xFF0D1266),
                            ),
                            listtitle: "Log Out", wiz: Text(""),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      )
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 40);
    path.quadraticBezierTo(width / 2, height, width, height - 40);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
