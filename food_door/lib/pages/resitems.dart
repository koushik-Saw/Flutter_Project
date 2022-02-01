import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResItems extends StatefulWidget {
  final String resname;

  const ResItems({Key? key, required this.resname}) : super(key: key);

  @override
  _ResItemsState createState() => _ResItemsState();
}

class _ResItemsState extends State<ResItems> {
  List recent = [];
final _quantitycontroller = new TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? user = FirebaseAuth.instance.currentUser?.email;
  Future<String> getRecent(String item) async {
    var response;
    if (item == "Burger King" || item == "Star Bucks" || item == "Mc Donald") {
      response = await rootBundle.loadString('asset/jsonfiles/fastfood.json');
    } else if (item == "Sultans Dine" ||
        item == "Kacci Bhai" ||
        item == "Star Kabab") {
      response = await rootBundle.loadString('asset/jsonfiles/kaccivai.json');
    } else if (item == "Mayer Doa Hotel" || item == "Star Hotel") {
      response =
          await rootBundle.loadString('asset/jsonfiles/breakfastfood.json');
    }
    setState(() {
      var extract = json.decode(response);
      recent = extract["items"];
    });
    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    getRecent(widget.resname);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.resname),
      ),
      body: ListView.builder(
          itemCount: recent == null ? 0 : recent.length,
          itemBuilder: (BuildContext context, int index) {
            String itmnm = recent[index]["name"];
            String itmprc = recent[index]["price"];
            String itmratio = recent[index]["ratio"];

            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15.0)),
                        child: Image.network(
                          "https://images.unsplash.com/photo-1626229652216-e5bb7f511917?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80",
                          width: 100,
                          height: 80,
                          fit: BoxFit.cover,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(itmnm),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(itmratio),
                        Row(
                          children: [
                            Text(itmprc),
                            const SizedBox(
                              width: 20,
                            ),
                            SizedBox(
                              width: 50,
                              height: 50,
                              child: TextFormField(
                                controller: _quantitycontroller,
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xffffffff),
                                  hintText: "0",
                                  border: UnderlineInputBorder(
                                      borderRadius: BorderRadius.zero),
                                ),
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  final quantity = _quantitycontroller.text;
                                  final resitm = itmnm;
                                  final resitmprc = itmprc;
                                  final setname = widget.resname + user!;
                                  FirebaseFirestore.instance.collection(user!).doc().set({
                                    "Item name": resitm,
                                    "Item Price": resitmprc,
                                    "Item Quantity": quantity,
                                    "Restaurant Name": widget.resname,
                                  });
                                },
                                child: Icon(Icons.shopping_cart))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
