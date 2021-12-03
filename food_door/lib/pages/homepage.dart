import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_door/model/bottomtextbutton.dart';
import 'package:food_door/model/searchbar.dart';

import 'account.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
      body: Column(
        children: [
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: size.height * .28,
              color: const Color(0xfff15a24),
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [const Searchbar(),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Bottomtextbutton(icons: Icon(Icons.lunch_dining_outlined,color: Colors.white,), title: "Burger",clr: Colors.white,),
                        Bottomtextbutton(icons: Icon(Icons.local_pizza_outlined,color: Colors.white,), title: "Pizza",clr: Colors.white,),
                        Bottomtextbutton(icons: Icon(Icons.ramen_dining_outlined,color: Colors.white,), title: "Breakfast",clr: Colors.white,),
                        Bottomtextbutton(icons: Icon(Icons.coffee_outlined,color: Colors.white,), title: "Coffee",clr: Colors.white,),
                        Bottomtextbutton(icons: Icon(Icons.local_bar_outlined,color: Colors.white,), title: "Drink",clr: Colors.white,),
                      ],
                    )

                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
            color: Colors.black,
              height: size.height * .53,
              width: double.infinity,
              child: SingleChildScrollView(
                child:
                Column(
                  children: const [

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
