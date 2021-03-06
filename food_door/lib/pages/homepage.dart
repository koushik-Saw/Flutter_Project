import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_door/model/bottomtextbutton.dart';
import 'package:food_door/pages/resitems.dart';

import 'account.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  List recent = [];
  List lunch = [];
  String fast = "Lunch";

  Future<String> getRecent(String item) async {
    var response;
    if (item == "Lunch" || item == "Dinner") {
      response = await rootBundle.loadString('asset/jsonfiles/lunch.json');
    } else if (item == "fast") {
      response = await rootBundle.loadString('asset/jsonfiles/recent.json');
    }
    else if (item == "breakfast") {
      response = await rootBundle.loadString('asset/jsonfiles/breakfast.json');
    }
    setState(() {
      var extract = json.decode(response);
      recent = extract["recent"];
    });
    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    getRecent(fast);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffc2c2cb),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            icon:
                const Icon(Icons.delivery_dining_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ),
        title: const Text(
          "Food",
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        backgroundColor: const Color(0xfff15a24),
        elevation: 0,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 18,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: CustomShape(),
              child: Container(
                height: size.height * .28,
                color: const Color(0xfff15a24),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                        child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.search_outlined,
                                color: Color(0xfff15a24),
                              ),
                              suffixIcon: const Icon(
                                Icons.tune_outlined,
                                color: Color(0xfff15a24),
                              ),
                              filled: true,
                              fillColor: const Color(0xffffffff),
                              hintText: "Search",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16))),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          itmtyp("fast","Fast Food",Icon(Icons.lunch_dining_outlined)),
                          itmtyp("breakfast","Break Fast",Icon(Icons.free_breakfast_outlined)),
                          itmtyp("Lunch","Lunch",Icon(Icons.rice_bowl_outlined)),
                          itmtyp("Dinner","Dinner",Icon(Icons.dinner_dining_outlined)),
                          //itmtyp("Lunch","Drink",Icon(Icons.local_bar_outlined)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: const Color(0xffc2c2cb),
                height: size.height * .52,
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Favourites"),
                          Text("Clear All"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: const Color(0xffc2c2cb),
                        height: 200,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: const [
                              Favourites(),
                              SizedBox(
                                width: 10,
                              ),
                              Favourites(),
                              SizedBox(
                                width: 10,
                              ),
                              Favourites()
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "All Restuarents",
                          ),
                          Text("Clear All"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RecentRes(recent: recent),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Order Again"),
                          Text("See All"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: const Color(0xffc2c2cb),
                        height: 200,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: const [
                              Favourites(),
                              SizedBox(
                                width: 10,
                              ),
                              Favourites(),
                              SizedBox(
                                width: 10,
                              ),
                              Favourites()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Column itmtyp(String a,b,Icon icn) {

    return Column(
      children: [
        IconButton(
          onPressed: () {
            getRecent(a);
          },
          icon: icn,color: Colors.white,

        ),
         Text(
          b,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}

class RecentRes extends StatelessWidget {
  const RecentRes({
    Key? key,
    required this.recent,
  }) : super(key: key);

  final List recent;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 200,
      child: ListView.builder(
          itemCount: recent == null ? 0 : recent.length,
          itemBuilder: (BuildContext context, int index) {
            String namedata = recent[index]["name"];
            return InkWell(
              onTap: () {
                print(namedata);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResItems(
                        resname: namedata,
                      ),
                    ));
              },
              child: Card(
                color: Colors.white,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(namedata),
                              const SizedBox(
                                width: 100,
                              ),
                              const Icon(
                                Icons.bookmark,
                                color: Color(0xfff15a24),
                                size: 20,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.bookmark,
                                color: Color(0xfff15a24),
                                size: 15,
                              ),
                              Text(recent[index]["type"]),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rate,
                                color: Color(0xfff15a24),
                                size: 15,
                              ),
                              Text(recent[index]["rating"]),
                              const SizedBox(
                                width: 20,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              const Icon(
                                Icons.call,
                                color: Color(0xff34bb6e),
                                size: 15,
                              ),
                              Text(recent[index]["contact"]),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

class Favourites extends StatelessWidget {
  const Favourites({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      height: 180,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                child: Image.network(
                  "https://images.unsplash.com/photo-1626229652216-e5bb7f511917?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80",
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 5,
            ),
            const Text("Burger King"),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: const [
                Text(
                  "Burger",
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "American Food",
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Deshi Food",
                  style: TextStyle(fontSize: 10),
                ),
                SizedBox(
                  width: 5,
                ),
              ],
            ),
            Row(
              children: [
                Row(
                  children: const [
                    Text(
                      "*",
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      "Burger",
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      "Burger",
                      style: TextStyle(fontSize: 8),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 18,
                ),
                Row(
                  children: const [
                    Text(
                      "Burger",
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      "Burger",
                      style: TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
