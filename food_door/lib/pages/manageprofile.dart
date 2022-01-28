import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_door/model/listtile.dart';

class Manageprofile extends StatefulWidget {
  const Manageprofile({Key? key}) : super(key: key);

  @override
  _ManageprofileState createState() => _ManageprofileState();
}
final FirebaseAuth _auth = FirebaseAuth.instance;
String? user = FirebaseAuth.instance.currentUser?.email;
Future<Map<String, dynamic>?> getData() async {
  DocumentReference<Map<String, dynamic>> document =
  FirebaseFirestore.instance.collection('accounts').doc(user); // path to doc
  DocumentSnapshot<Map<String, dynamic>> query = await document.get();
  print(query.data());
  return query.data();
}
class _ManageprofileState extends State<Manageprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:FutureBuilder<Map<String,dynamic>?>(
          future: getData(),
          builder:  (BuildContext context, AsyncSnapshot<Map<String, dynamic>?> snapshot){
            if (snapshot.hasError) return const CircularProgressIndicator();
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:  [
                const Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80",
                    ),
                  ),
                ),
                listitle(icn: const Icon(Icons.person), listtitle: snapshot.data!['Username'], wiz: const Icon(Icons.edit_outlined,color: Color(0xFF0D1266))),
                listitle(icn: const Icon(Icons.mail), listtitle: snapshot.data!['Email'], wiz: const Icon(Icons.edit_outlined,color: Color(0xFF0D1266))),
                listitle(icn: const Icon(Icons.location_city), listtitle: snapshot.data!['deliveryadd'], wiz: const Icon(Icons.edit_outlined,color: Color(0xFF0D1266))),
                listitle(icn: const Icon(Icons.person), listtitle: snapshot.data!['gender'], wiz: const Icon(Icons.edit_outlined,color: Color(0xFF0D1266))),
                listitle(icn: const Icon(Icons.phone_android), listtitle: snapshot.data!['phone'], wiz: const Icon(Icons.edit_outlined,color: Color(0xFF0D1266))),
                listitle(icn: const Icon(Icons.message), listtitle: snapshot.data!['language'], wiz: const Icon(Icons.edit_outlined,color: Color(0xFF0D1266))),
              ],
            );
          }
        ),
      ),
    );
  }
}
