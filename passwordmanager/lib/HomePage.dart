import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

List _alldata = [];
List _filtereddata = [];

TextEditingController _searchcontroller = new TextEditingController();
class _HomePageState extends State<HomePage> {
  Icon cusicon = Icon(Icons.search);
  Widget custitle = Text("Home");



  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    _searchcontroller.addListener(_searchchanged);
  }

  Future<void> _searchchanged() async {


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: custitle,
        leading: Icon(Icons.home_outlined),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (cusicon.icon == Icons.search) {
                  cusicon = Icon(Icons.cancel);
                  custitle = TextField(
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                          )),
                    ),
                    style: TextStyle(),
                    controller: _searchcontroller,
                  );
                } else {
                  cusicon = Icon(Icons.search);
                  custitle = Text("Home");
                }
              });
            },
            icon: cusicon,
          ),
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => login()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Getdata(),
    );
  }
}

class Getdata extends StatelessWidget {
  const Getdata({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance;
    return new StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("accounts").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) return new Text("There is no expense");

          else{

              return new ListView(children: getExpenseItems(snapshot));
            
          }

        });
  }
}
getdata(QuerySnapshot snapshot){
  return snapshot.docs.map((doc) => Card(
      color: Color(0xfff),
      child: Padding(
        padding: EdgeInsets.all(1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ListTile(
              leading: new Text(doc["Account Name"],
                  style: TextStyle(fontSize: 24, color: Colors.amber)),
              title: new Text(
                "Username: " + doc["Username"],
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
              subtitle: new Text(
                "Password: " + doc["Password"].toString(),
                style: TextStyle(fontSize: 16, color: Colors.teal),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.only(left: 93),
              title: new Text(
                "Email: " + doc["Email"],
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              subtitle: new Text(
                "Phone: " + doc["Phone"].toString(),
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            )
          ],
        ),
      )))
      .toList();
}
getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
  return _alldata = snapshot.data!.docs
      .map((doc) =>
      Card(
          color: Color(0xfff),
          child: Padding(
            padding: EdgeInsets.all(1.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ListTile(
                  leading: new Text(doc["Account Name"],
                      style: TextStyle(fontSize: 24, color: Colors.amber)),
                  title: new Text(
                    "Username: " + doc["Username"],
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                  subtitle: new Text(
                    "Password: " + doc["Password"].toString(),
                    style: TextStyle(fontSize: 16, color: Colors.teal),
                  ),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.only(left: 93),
                  title: new Text(
                    "Email: " + doc["Email"],
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  subtitle: new Text(
                    "Phone: " + doc["Phone"].toString(),
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                )
              ],
            ),
          )))
      .toList();
}
