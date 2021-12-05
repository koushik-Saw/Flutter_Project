import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bottomtextbutton.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({Key? key}) : super(key: key);

  @override
  _SearchbarState createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: TextFormField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search_outlined,color: Color(0xfff15a24),),
                suffixIcon: const Icon(Icons.tune_outlined,color: Color(0xfff15a24),),
                filled: true,
                fillColor: const Color(0xffffffff),
                hintText: "Search",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
            style: const TextStyle(fontSize: 16),
          ),

        ),
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
    );
  }
}
