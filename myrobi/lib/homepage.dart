import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
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
class _HomeState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.account_circle_rounded),
        title: const Text("Home"),
        backgroundColor: Colors.red,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [
                Icon(Icons.notifications_rounded),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.search),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //Recharge Section
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Good Morning'),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text('Accuition Pack'),
                          TextButton(
                              onPressed: () {}, child: const Text("Details"))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Recharge"),
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.lightGreen),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    ))),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Quick Recharges"),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: const [
                                  Text("\$5",style: TextStyle(color: Colors.red),),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 20,
                                    child: Text("|"),
                                  ),
                                  Text("\$20",style: TextStyle(color: Colors.red),),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SizedBox(
                                    width: 20,
                                    child: Text("|"),
                                  ),
                                  Text("\$30",style: TextStyle(color: Colors.red),),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              // Balance Section
              Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.white,
                        child: CircleAvatar(
                            backgroundColor: Colors.purple,
                            radius: 90,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 80,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text("17.68"),
                                  Text("Expires On"),
                                  Text("1 Nov, 2021"),
                                ],
                              ),
                            )),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        dta(
                          icon: Icon(Icons.wifi),
                          txt: "1.00GB",
                        ),
                        dtabalance(
                          titles: 'Data',
                        ),
                        dta(
                          icon: Icon(Icons.mic),
                          txt: "148 Mins",
                        ),
                        dtabalance(
                          titles: 'Voice',
                        ),
                        dta(
                          icon: Icon(Icons.mail),
                          txt: "50 SMS",
                        ),
                        dtabalance(
                          titles: 'Sms',
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  height: 320,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Quick Links",textAlign: TextAlign.left,),
                      ),
                      CarouselSlider(
                        options: CarouselOptions(height: 245, viewportFraction: 1,onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },),
                        items: _childreen.map((card) {
                          return Builder(builder: (BuildContext context) {
                            return SizedBox(
                              height: 40,
                              child: Card(
                                color: Colors.blueAccent,
                                child: card,
                              ),
                            );
                          });
                        }).toList(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: map<Widget>(_childreen, (index, url) {
                          return Container(
                            width: 10.0,
                            height: 10.0,
                            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == index ? Colors.blueAccent : Colors.grey,
                            ),
                          );
                        }),
                      ),
                    ],
                  )
              )
              // Ads
            ],
          ),
        ),
      ),
    );
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
            Text(titles,style: const TextStyle(fontSize: 12),),

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
