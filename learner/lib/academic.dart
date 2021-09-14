import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learner/update.dart';

import 'homepage.dart';
import 'login.dart';

class Academic extends StatefulWidget {
  const Academic({Key? key}) : super(key: key);

  @override
  _AcademicState createState() => _AcademicState();
}

class _AcademicState extends State<Academic> {
  List data = [];

  Future<String> getData() async {
    var response = await rootBundle.loadString('assets/academic.json');
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
                  left: 10,
                  right: 10,
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
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    data[index]["leading"],
                                    style: TextStyle(
                                        color: Colors.amber, fontSize: 48),
                                  ),
                                ),
                                color: Colors.deepPurple,
                                padding: EdgeInsets.only(left: 10,right: 10),
                              ),
                              Container(
                                color: Colors.deepPurple,
                                padding: EdgeInsets.only(left: 10,right: 10),
                                alignment: Alignment.topRight,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index]["title"],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 26),
                                    ),
                                    Text(
                                      data[index]["extra"],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 26),
                                    ),
                                    Text(
                                      data[index]["subtitle"],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 26),
                                    ),
                                    Text(
                                      data[index]["trailing"],
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 26),
                                    ),
                                  ],
                                ),
                              ),

                            ]),
                      ),
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
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              icon: Image.asset(
                "assets/back.png",
                fit: BoxFit.fill,
                width: 200,
                height: 200,
              )),
          Text(
            "IELTS Academic",
            style: TextStyle(color: Colors.amber, fontSize: 22),
          ),
        ],
      ),
    );
  }
}
