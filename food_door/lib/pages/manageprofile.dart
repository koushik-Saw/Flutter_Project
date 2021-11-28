import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_door/model/listtile.dart';

class Manageprofile extends StatefulWidget {
  const Manageprofile({Key? key}) : super(key: key);

  @override
  _ManageprofileState createState() => _ManageprofileState();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80",
                ),
              ),
            ),
            listitle(icn: Icon(Icons.person), listtitle: "Name", wiz: Icon(Icons.edit_outlined,color: Color(0xFF0D1266))),
            listitle(icn: Icon(Icons.lock), listtitle: "Password", wiz: Icon(Icons.chevron_right_outlined,color: Color(0xFF0D1266))),
            listitle(icn: Icon(Icons.mail), listtitle: "Mail", wiz: Icon(Icons.chevron_right_outlined,color: Color(0xFF0D1266))),
            listitle(icn: Icon(Icons.call), listtitle: "Phone", wiz: Icon(Icons.chevron_right_outlined,color: Color(0xFF0D1266))),
            listitle(icn: Icon(Icons.location_on_outlined,), listtitle: "Address", wiz: Icon(Icons.chevron_right_outlined,color: Color(0xFF0D1266))),
            listitle(icn: Icon(Icons.language_outlined), listtitle: "Language", wiz: Icon(Icons.chevron_right_outlined,color: Color(0xFF0D1266))),
            listitle(icn: Icon(Icons.info_outlined), listtitle: "Gender", wiz: Icon(Icons.chevron_right_outlined,color: Color(0xFF0D1266))),
          ],
        ),
      ),
    );
  }
}
