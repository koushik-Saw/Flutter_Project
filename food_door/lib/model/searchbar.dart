import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({Key? key}) : super(key: key);

  @override
  _SearchbarState createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
