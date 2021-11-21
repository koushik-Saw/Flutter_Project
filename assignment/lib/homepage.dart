import 'dart:ui';

import 'package:assignment/settings.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final urlImages = [
    'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Zm9vZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1504754524776-8f4f37790ca0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Zm9vZHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGZvb2R8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int activeIndex = 0;
    final button = PopupMenuButton<String>(
      itemBuilder: (BuildContext context) {
        return Settings.choices.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
    return Scaffold(
        backgroundColor: const Color(0xffe5e5e5),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Header(size: size),
                Searchbar(size: size),
                const SizedBox(
                  height: 40.0,
                ),
                Container(
                  height: size.height * 0.2,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Center(
                      child: CarouselSlider.builder(
                    itemCount: urlImages.length,
                    itemBuilder: (contex, index, realIndex) {
                      final urlImage = urlImages[index];
                      return buildImage(urlImage, index);
                    },
                    options: CarouselOptions(
                      height: 200,
                      onPageChanged: (index, reason) =>
                          setState(() => activeIndex = index),
                    ),
                  )),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Titlewithbtn(
                  title: "Categories",
                  btn: "View All",
                ),
                //Categories
                Catagories(size),
                const Titlewithbtn(
                  title: "Popular Food Nearby",
                  btn: "View All",
                ),
                const SizedBox(
                  height: 20.0,
                ),
                //Popular Food Nearby
                popularfoodnearby(size: size),
                //Food Campaign
                const Titlewithbtn(
                  title: "Food Campaign",
                  btn: "View All",
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Foodcamp(size: size),
                const SizedBox(
                  height: 20.0,
                ),
                const Titlewithbtn(
                  title: "Popular Restaurants",
                  btn: "View All",
                ),
                const SizedBox(
                  height: 20.0,
                ),
                //Popular Restaurants
                PopularRestaurants(size: size),
                const SizedBox(
                  height: 20.0,
                ),
                //New on App
                const Titlewithbtn(
                  title: "New on App",
                  btn: "View All",
                ),
                const SizedBox(
                  height: 20.0,
                ),
                NewInAPp(size: size),
                const SizedBox(
                  height: 20.0,
                ),
                //All Restaurants
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "All Restaurants",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrangeAccent,
                              fontSize: 18),
                        ),
                        Text("200+ near you"),
                      ],
                    ),
                    PopupMenuButton(
                      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                        const PopupMenuItem(
                          child: Text('All'),
                        ),
                        const PopupMenuItem(
                          child: Text('Take Away'),
                        ),
                        const PopupMenuItem(
                          child: Text('Home Delivery'),
                        ),
                      ],
                      icon: Icon(Icons.settings),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                AllRestaurant(size: size),
              ],
            ),
          ),
        ));
  }

  SizedBox Catagories(Size size) {
    return SizedBox(
      height: 150,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5.0), //or 15.0
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Image.asset("asset/icons/all.png"),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("All")
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5.0), //or 15.0
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Image.asset("asset/icons/coffe.png"),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Coffee")
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5.0), //or 15.0
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Image.asset("asset/icons/cake.png"),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Cake")
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5.0), //or 15.0
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Image.asset("asset/icons/fries.png"),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Fries")
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5.0), //or 15.0
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Image.asset("asset/icons/drink.png"),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Drinks")
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5.0), //or 15.0
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Image.asset("asset/icons/pizza.png"),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Pizza")
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5.0), //or 15.0
                        child: SizedBox(
                          height: 60,
                          width: 60,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Image.asset("asset/icons/soup.png"),
                            style:
                                ElevatedButton.styleFrom(primary: Colors.white),
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Soup")
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          child: Image.network(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
      );
}

class AllRestaurant extends StatelessWidget {
  const AllRestaurant({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Allres(
          size: size,
          titl: "Mc Donald's",
          imgg:
              "https://images.unsplash.com/photo-1619454016518-697bc231e7cb?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTl8fG1jZG9uYWxkc3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
        ),
        const SizedBox(
          height: 10.0,
        ),
        Allres(
          size: size,
          titl: "Starbucks",
          imgg:
              "https://images.unsplash.com/photo-1545231027-637d2f6210f8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c3RhcmJ1Y2tzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
        ),
        const SizedBox(
          height: 10.0,
        ),
        Allres(
          size: size,
          titl: "",
          imgg:
              "https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Dominos_pizza_logo.svg/1200px-Dominos_pizza_logo.svg.png",
        ),
      ],
    );
  }
}

class Foodcamp extends StatelessWidget {
  const Foodcamp({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Foopcamp(
            size: size,
            imgs:
                "https://images.unsplash.com/photo-1600891964599-f61ba0e24092?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cmVzdGF1cmFudCUyMGZvb2R8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
          ),
          const SizedBox(
            width: 10,
          ),
          Foopcamp(
            size: size,
            imgs:
                "https://images.unsplash.com/photo-1532634922-8fe0b757fb13?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Zm9vZCUyMGFuZCUyMGRyaW5rfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
          ),
          const SizedBox(
            width: 10,
          ),
          Foopcamp(
            size: size,
            imgs:
                "https://images.unsplash.com/photo-1467453678174-768ec283a940?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8Zm9vZCUyMGFuZCUyMGRyaW5rfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
          ),
        ],
      ),
    );
  }
}

class Allres extends StatelessWidget {
  const Allres({
    Key? key,
    required this.size,
    required this.titl,
    required this.imgg,
  }) : super(key: key);
  final Size size;
  final String titl, imgg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 1,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Image.network(
              imgg,
              fit: BoxFit.fill,
              width: 45,
              height: 45,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Mc Donald's"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const <Widget>[
                    Text("American Cuisine, Fast Food"),
                    SizedBox(
                      width: 70,
                    ),
                    Icon(Icons.favorite_rounded)
                  ],
                ),
                SizedBox(
                  height: 2,
                  child: RatingBar.builder(
                    minRating: 5,
                    itemSize: 20.0,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.deepOrangeAccent,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class NewInAPp extends StatelessWidget {
  const NewInAPp({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Newinapp(size: size),
          const SizedBox(
            width: 20,
          ),
          Newinapp(size: size),
          const SizedBox(
            width: 20,
          ),
          Newinapp(size: size),
        ],
      ),
    );
  }
}

class Newinapp extends StatelessWidget {
  const Newinapp({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .30,
      width: size.width * .45,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
            child: Image.network(
              "https://images.unsplash.com/photo-1471253794676-0f039a6aae9d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Burger"),
                const SizedBox(
                  height: 5,
                ),
                const Text("Mc Donald, New York"),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 2,
                  child: RatingBar.builder(
                    minRating: 5,
                    itemSize: 20.0,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.deepOrangeAccent,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PopularRestaurants extends StatelessWidget {
  const PopularRestaurants({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          PopularRes(
            size: size,
            imges:
                "https://images.unsplash.com/photo-1587574293340-e0011c4e8ecf?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fHJlc3RhdXJhbnR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
          ),
          const SizedBox(
            width: 20,
          ),
          PopularRes(
            size: size,
            imges:
                "https://images.unsplash.com/photo-1421622548261-c45bfe178854?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjN8fHJlc3RhdXJhbnQlMjBuYW1lfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
          ),
          const SizedBox(
            width: 20,
          ),
          PopularRes(
            size: size,
            imges:
                "https://images.unsplash.com/photo-1514933651103-005eec06c04b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHJlc3RhdXJhbnQlMjBuYW1lfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
          ),
        ],
      ),
    );
  }
}

class PopularRes extends StatelessWidget {
  const PopularRes({
    Key? key,
    required this.size,
    required this.imges,
  }) : super(key: key);
  final String imges;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .27,
      width: size.width * .45,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
            child: Image.network(
              imges,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Burger"),
                const SizedBox(
                  height: 5,
                ),
                const Text("Mc Donald, New York"),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 2,
                  child: RatingBar.builder(
                    minRating: 5,
                    itemSize: 20.0,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.deepOrangeAccent,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Foopcamp extends StatelessWidget {
  const Foopcamp({
    Key? key,
    required this.size,
    required this.imgs,
  }) : super(key: key);
  final String imgs;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .4,
      width: size.width * .5,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)),
            child: Image.network(
              imgs,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Burger"),
                const SizedBox(
                  height: 5,
                ),
                const Text("Mc Donald, New York"),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 2,
                  child: RatingBar.builder(
                    minRating: 5,
                    itemSize: 20.0,
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.deepOrangeAccent,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text("\$5"),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "\$8",
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, elevation: 0),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Titlewithbtn extends StatelessWidget {
  const Titlewithbtn({
    Key? key,
    required this.title,
    required this.btn,
  }) : super(key: key);
  final String title, btn;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text(btn),
      ],
    );
  }
}

class popularfoodnearby extends StatelessWidget {
  const popularfoodnearby({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.2,
      child: Column(
        children: [
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  popularfood(
                    populartitle: "Burger",
                    img:
                        "https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=999&q=80",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  popularfood(
                      populartitle: "Pasta",
                      img:
                          "https://images.unsplash.com/photo-1611270629569-8b357cb88da9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHBhc3RhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
                  SizedBox(
                    width: 10,
                  ),
                  popularfood(
                    populartitle: "Pizza",
                    img:
                        "https://images.unsplash.com/photo-1513104890138-7c749659a591?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cGl6emF8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60",
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class popularfood extends StatelessWidget {
  const popularfood({
    Key? key,
    required this.populartitle,
    required this.img,
  }) : super(key: key);
  final String populartitle, img;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 330,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Image.network(
              img,
              fit: BoxFit.fill,
              width: 120,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(populartitle),
                const SizedBox(
                  height: 5,
                ),
                const Text("Mc Donald, New York"),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 2,
                  child: RatingBar.builder(
                    minRating: 5,
                    itemSize: 20.0,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.deepOrangeAccent,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text("\$5"),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "\$8",
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, elevation: 0),
                    )
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class Searchbar extends StatelessWidget {
  const Searchbar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      margin: const EdgeInsets.only(top: 30),
      height: size.height * 0.05,
      decoration: const BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.all(Radius.circular(1.0))),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {},
              decoration: const InputDecoration(
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Search food and restaurant here",
              ),
            ),
          ),
          const Icon(Icons.search_rounded),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.05,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: const [Icon(Icons.home_rounded), Text("Location")],
          ),
          const Icon(Icons.notifications_rounded),
        ],
      ),
    );
  }
}
