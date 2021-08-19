import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

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
          Container(
            child: Positioned(
                child: Container(
              color: Colors.black,
              height: size.height * .7,
              child: ListView(),
            )),
          ),
          Bottombar(
            size: size,
          )
        ],
      ),
    ));
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
                CircleAvatar(
                  radius: 35.0,
                  backgroundImage: NetworkImage(
                      "https://i2.wp.com/theworldaccordingtocosmos.com/wp-content/uploads/2019/11/landscape-1500925839-golden-retriever-puppy.jpg?w=480&ssl=1"),
                  backgroundColor: Colors.transparent,
                ),
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

// class Homepage extends StatefulWidget {
//   const Homepage({Key? key}) : super(key: key);
//
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// Icon cusicon = Icon(Icons.notifications);
// Widget custitle = Text("Home");
//
// class _HomeState extends State<Homepage> {
//   @override
//   Widget build(BuildContext context) {
//
//
//     // return Scaffold(
//     //   // appBar: AppBar(
//     //   //   title: custitle,
//     //   //   leading: Icon(Icons.home_outlined),
//     //   //   actions: [
//     //   //     IconButton(
//     //   //       onPressed: () {},
//     //   //       icon: cusicon,
//     //   //     ),
//     //   //     IconButton(onPressed: () {}, icon: Icon(Icons.person))
//     //   //     // IconButton(
//     //   //     //     onPressed: () {
//     //   //     //       FirebaseAuth.instance.signOut();
//     //   //     //       Navigator.push(
//     //   //     //           context, MaterialPageRoute(builder: (context) => login()));
//     //   //     //     },
//     //   //     //     icon: Icon(Icons.logout))
//     //   //   ],
//     //   // ),
//     //   body: getdata(),
//     // );
//   }
//
//   getdata() {}
// }
