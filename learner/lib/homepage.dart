import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learner/academic.dart';
import 'package:learner/essentials.dart';
import 'package:learner/profile.dart';
import 'package:learner/update.dart';

import 'login.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List data = [];

  Future<String> getData() async {
    var response = await rootBundle.loadString('assets/sample.json');
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
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Searchbar(size: size),
              Listview(size: size, data: data),
              Bottombar(
                size: size,
              )
            ],
          ),
        ));
  }
}

class Listview extends StatelessWidget {
  const Listview({
    Key? key,
    required this.size,
    required this.data,
  }) : super(key: key);

  final Size size;
  final List data;

  @override
  Widget build(BuildContext context) {
    return Container(
         padding: EdgeInsets.only(
           left: 20,
           right: 20,
           bottom: 5,
         ),
         color: Colors.black,
         height: size.height * .7,
         child: ListView.builder(
           itemCount: data == null ? 0 : data.length,
           itemBuilder: (BuildContext context, int index) {
             return new Card(
               color: Colors.black,
               child: InkWell(
                   onTap: () {
                     if (index == 0) {
                       Essentials();
                     } else if (index == 1) {
                       Navigator.push(
                           context,
                           MaterialPageRoute(
                               builder: (context) => Academic()));
                     }
                   },
                   child: Column(children: [
                     Padding(padding: EdgeInsets.all(5.0)),
                     Row(
                       mainAxisAlignment:
                           MainAxisAlignment.spaceBetween,
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
       );
  }
}

class Bottombar extends StatelessWidget {
  const Bottombar({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      color: Colors.black,
      height: size.height * .1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/menu2.png",
            height: 40,
            width: 40,
          ),
          CircleAvatar(
            radius: 30,
            child: Text(
              'T',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.blue,
          ),
          SizedBox(
            height: 50,
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Teachers"),
              style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
          ),
        ],
      ),
    );
  }
}

class Searchbar extends StatelessWidget {
  const Searchbar({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 80,
            ),
            height: size.height * .2,
            decoration: BoxDecoration(color: Colors.black),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Learner",
                    style: TextStyle(color: Colors.white, fontSize: 42)),
                Spacer(),
                Image.asset(
                  "assets/ring.png",
                  width: 40,
                  height: 40,
                ),
                GestureDetector(
                  onTap: (
                  ){Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Profile()));

                  },
                  child: CircleAvatar(
                    radius: 35.0,
                    backgroundImage: NetworkImage(
                        "https://i2.wp.com/theworldaccordingtocosmos.com/wp-content/uploads/2019/11/landscape-1500925839-golden-retriever-puppy.jpg?w=480&ssl=1"),
                    backgroundColor: Colors.transparent,
                  ),
                )

              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 90,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: 54,
              decoration: BoxDecoration(
                color: Colors.cyan,
              ),
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.8))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
