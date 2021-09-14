import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learner/homepage.dart';
import 'package:learner/update.dart';

import 'login.dart';

class Essentials extends StatefulWidget {
  const Essentials({Key? key}) : super(key: key);

  @override
  _EssentialsState createState() => _EssentialsState();
}

class _EssentialsState extends State<Essentials> {
  List data = [];

  Future<String> getData() async {
    var response = await rootBundle.loadString('assets/essentials.json');
    // await http.get(Uri.parse(url), headers: {"Accept": "application/json"});

    setState(() {
      var extract = json.decode(response);
      data = extract["items"];
    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          BackBtn(),
          SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                color: Colors.black,
                height: size.height * .9,
                child: ListView.builder(
                  itemCount: data == null ? 0 : data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new Card(
                      color: Colors.black,
                      child: InkWell(
                          onTap: () {
                            if (index == 0) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => login()));
                            } else if (index == 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Update()));
                            }
                          },
                          child: Column(children: [
                            Padding(padding: EdgeInsets.all(5.0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data[index]["name"],
                                  style: TextStyle(color: Colors.green),
                                ),
                                Text(
                                  data[index]["description"],
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 22),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 220,
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      data[index]["image"],
                                      fit: BoxFit.fill,
                                      width: size.width * 2,
                                    ),
                                  )),
                            ),
                          ])),
                    );
                  },
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}

class BackBtn extends StatelessWidget {
  const BackBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      height: 60,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Home()));
              },
              icon: Image.asset(
                "assets/back.png",
                fit: BoxFit.fill,
                width: 200,
                height: 200,
              )),
          Text(
            "IELTS Essentials",
            style: TextStyle(color: Colors.amber, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
