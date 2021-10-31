import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lifestyle extends StatefulWidget {
  const Lifestyle({Key? key}) : super(key: key);

  @override
  _LifestyleState createState() => _LifestyleState();
}

class _LifestyleState extends State<Lifestyle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lifestyle"),),
      drawer: Drawer(
        child: ListView(
          children:  [
            UserAccountsDrawerHeader(currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1574293876203-8bded53be0f0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHB1cHB5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
            ), accountEmail: const Text('koushikm187@gmail.com'),
              accountName: const Text(
                'Koushik Majumder',
                style: TextStyle(fontSize: 24.0),
              ),
              otherAccountsPictures: [
                Container(
                  height: 24,
                  width: 24,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.nightlight_round, color: Colors.white,size: 24.0,),
                  alignment: Alignment.center,
                ),
              ],
              decoration: const BoxDecoration(
                image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1635645262831-0fc4fb679750?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=870&q=80"),fit: BoxFit.cover),
              ), ),
            const lititle(icns: Icon(Icons.house),title: "House",),
            const lititle(icns: Icon(Icons.phone),title: "Phone",),
            const lititle(icns: Icon(Icons.favorite),title: "Favourites",),
          ],
        ),
      ),
    );
  }
}

class lititle extends StatelessWidget {
  const lititle({
    Key? key, required this.icns, required this.title,
  }) : super(key: key);
final Icon icns;
final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icns,
      title: Text(
        'Houses',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }
}
