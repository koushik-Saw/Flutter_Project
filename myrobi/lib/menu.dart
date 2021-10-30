import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}
int _currentIndex=0;
final List<Widget> _childreen = [
  const Item1(),
  const Item2(),
  const Item3(),
];
List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}
class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("Menu"),),);
  }
}

class dta extends StatelessWidget {
  const dta({
    Key? key,
    required this.icon,
    required this.txt,
  }) : super(key: key);
  final Icon icon;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {},
          icon: icon,color: Colors.lightGreen,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          txt,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class dtabalance extends StatelessWidget {
  const dtabalance({Key? key, required this.titles}) : super(key: key);
  final String titles;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          titles,
          textAlign: TextAlign.start,
          style: const TextStyle(color: Colors.lightGreen),
        ),
        const SizedBox(
          width: 20,
        ),
        const Text(
          "Balance",
          textAlign: TextAlign.end,
        ),
      ],
    );
  }
}
class Item1 extends StatelessWidget {
  const Item1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3,),
          children: const [
            items( titles: 'Bundles',icns: Icon(Icons.card_giftcard),),
            items( titles: 'Internet Packs',icns: Icon(Icons.signal_wifi_4_bar_sharp)),
            items( titles: 'Voice',icns: Icon(Icons.mic)),
            items( titles: 'My Plan',icns: Icon(Icons.settings)),
            items( titles: 'Sim Purchase',icns: Icon(Icons.sim_card)),
            items( titles: 'Gift',icns: Icon(Icons.card_giftcard)),
            items( titles: 'Refer a friend',icns: Icon(Icons.family_restroom)),
            items( titles: 'Call History',icns: Icon(Icons.history)),
          ],
        ));
  }
}

class items extends StatelessWidget {
  const items({
    Key? key, required this.titles, required this.icns,
  }) : super(key: key);
  final String titles;
  final Icon icns;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: icns,color: Colors.lightGreen,
          ),
          Text(titles,style: const TextStyle(fontSize: 18),),

        ],
      )

    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}