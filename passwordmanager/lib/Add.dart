import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  bool isfile = false;
  late File fileimage;

  final _accountcontroller = new TextEditingController();
  final _usercontroller = new TextEditingController();
  final _emailcontroller = new TextEditingController();
  final _passwordcontroller = new TextEditingController();
  final _phonecontroller = new TextEditingController();
  final _recoverycontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                  child: Icon(Icons.games),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                    onPressed: () {
                      savepassword();
                    },
                    child: Text("Pick Icon")),
                Container(
                  height: size.height * 0.05,
                  width: size.width * 1,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[500]!.withOpacity(.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    controller: _accountcontroller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(
                            Icons.games,
                            size: 28,
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Account Name"),
                  ),
                ),
                Container(
                  height: size.height * 0.05,
                  width: size.width * 1,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[500]!.withOpacity(.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    controller: _usercontroller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(
                            Icons.person,
                            size: 28,
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Username"),
                  ),
                ),
                Container(
                  height: size.height * 0.05,
                  width: size.width * 1,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[500]!.withOpacity(.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    controller: _passwordcontroller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(
                            Icons.password,
                            size: 28,
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Password"),
                  ),
                ),
                Container(
                  height: size.height * 0.05,
                  width: size.width * 1,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[500]!.withOpacity(.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    controller: _emailcontroller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(
                            Icons.email,
                            size: 28,
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Email"),
                  ),
                ),
                Container(
                  height: size.height * 0.05,
                  width: size.width * 1,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[500]!.withOpacity(.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    controller: _phonecontroller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(
                            Icons.phone_iphone,
                            size: 28,
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Phone"),
                  ),
                ),
                Container(
                  height: size.height * 0.05,
                  width: size.width * 1,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[500]!.withOpacity(.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    controller: _recoverycontroller,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(
                            Icons.email_rounded,
                            size: 28,
                            color: Colors.black,
                          ),
                        ),
                        hintText: "Recovery Email"),
                  ),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('data')
                          .add({"CompanyName": "Company name"});
                    },
                    child: Text("Add")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Pickimage() async {
    final picker = ImagePicker();
    final Picked_file = await picker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      fileimage = Picked_file as File;
    });
  }

  void savepassword() {
    final _accountname = _accountcontroller.text;
    final _username = _usercontroller.text;
    final _password = _passwordcontroller.text;
    final _email = _emailcontroller.text;
    final _phone = _phonecontroller.text;
    final _recoveryemail = _recoverycontroller.text;

    FirebaseFirestore.instance.collection("accounts").doc(_accountname).set({
      "Account Name": _accountname,
      "Username": _username,
      "Password": _password,
      "Email": _email,
      "Phone": _phone,
      "Recovery Email": _recoveryemail,
    });
    _accountcontroller.clear();
    _usercontroller.clear();
    _passwordcontroller.clear();
    _emailcontroller.clear();
    _phonecontroller.clear();
    _recoverycontroller.clear();
  }
}
