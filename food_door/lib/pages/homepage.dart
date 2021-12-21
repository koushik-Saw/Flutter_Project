import 'package:flutter/material.dart';
import 'package:food_door/model/searchbar.dart';

import 'account.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TabController _controller = TabController(length: 5, vsync: this);

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
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Searchbar(),
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
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: Colors.white,
                        height: 50,
                        child: TabBar(
                            labelColor: Colors.black,
                            indicatorColor: const Color(0xfff15a24),
                            labelStyle: const TextStyle(
                                fontSize: 14.0, color: Colors.black),
                            //For Selected tab
                            unselectedLabelStyle: const TextStyle(
                                fontSize: 10.0, color: Colors.black),
                            controller: _controller,
                            tabs: const [
                              Tab(
                                text: "Recent",
                              ),
                              Tab(
                                text: 'Favourite',
                              ),
                              Tab(
                                text: 'Rating',
                              ),
                              Tab(
                                text: 'Popular',
                              ),
                              Tab(
                                text: 'Trending',
                              ),
                            ]),
                      ),
                      Container(
                        height: 350,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView(
                            children: const [
                              recent(
                                storename: "Burger King",
                                itemname: "Burger",
                                storedistance: "2.1km",
                                storeratting: "5.0",
                                timetoreach: "30min",
                                contact: "Contact",
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              recent(
                                storename: "Burger King",
                                itemname: "Burger",
                                storedistance: "2.1km",
                                storeratting: "5.0",
                                timetoreach: "30min",
                                contact: "Contact",
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              recent(
                                storename: "Burger King",
                                itemname: "Burger",
                                storedistance: "2.1km",
                                storeratting: "5.0",
                                timetoreach: "30min",
                                contact: "Contact",
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              recent(
                                storename: "Burger King",
                                itemname: "Burger",
                                storedistance: "2.1km",
                                storeratting: "5.0",
                                timetoreach: "30min",
                                contact: "Contact",
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              recent(
                                storename: "Burger King",
                                itemname: "Burger",
                                storedistance: "2.1km",
                                storeratting: "5.0",
                                timetoreach: "30min",
                                contact: "Contact",
                              ),
                            ],
                          ),
                        ),
                      )
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
}

class recent extends StatelessWidget {
  const recent({
    Key? key,
    required this.storename,
    required this.itemname,
    required this.storedistance,
    required this.storeratting,
    required this.timetoreach,
    required this.contact,
  }) : super(key: key);
  final String storename,
      itemname,
      storedistance,
      storeratting,
      timetoreach,
      contact;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
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
                    Text(storename),
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
                    Text(itemname),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.place,
                      color: Color(0xfff15a24),
                      size: 15,
                    ),
                    Text(storedistance),
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
                    Text(storeratting),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.schedule,
                      color: Color(0xff000000),
                      size: 15,
                    ),
                    Text(timetoreach),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(
                      Icons.call,
                      color: Color(0xff34bb6e),
                      size: 15,
                    ),
                    Text(contact),
                  ],
                )
              ],
            )
          ],
        ),
      ),
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
