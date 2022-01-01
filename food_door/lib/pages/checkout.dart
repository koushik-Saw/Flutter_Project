import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ),
        title: const Text(
          "My Cart",
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 80,
                child: ListTile(
                  leading: Image.network(
                    "https://images.unsplash.com/photo-1626229652216-e5bb7f511917?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80",
                    width: 100,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  title: Text("Deliver To"),
                  subtitle: Text("30\$"),
                  trailing: Text("Change"),
                ),
              ),
              Container(
                  color: Colors.white,
                  height: 150,
                  child: ListView(
                    children: [
                      ListTile(
                        leading: Image.network(
                          "https://images.unsplash.com/photo-1626229652216-e5bb7f511917?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80",
                          width: 100,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        title: Text("Burger"),
                        subtitle: Text("30\$"),
                        trailing: Text("2pc"),
                      ),
                      ListTile(
                        leading: Image.network(
                          "https://images.unsplash.com/photo-1626229652216-e5bb7f511917?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80",
                          width: 100,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        title: Text("Burger"),
                        subtitle: Text("30\$"),
                        trailing: Text("2pc"),
                      ),
                    ],
                  )),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Payment Method"),
                  Text("Add New"),
                ],
              ),
              const SizedBox(height: 5,),
              Container(
                child: Column(
                  children: const [
                    ListTile(
                      leading: Icon(Icons.payment_outlined),
                      title: Text("Pay Pal"),
                      subtitle: Text("Faster & Safer way to send money"),
                    ),
                    ListTile(
                      leading: Icon(Icons.payment_outlined),
                      title: Text("Credit Card"),
                      subtitle: Text("Pay with MasterCard, Visa or other"),
                    ),
                  ],
                ),
              ),
              Container(
                height: 60,
                decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 0),
                      bottom: BorderSide(width: 0),
                    )),
                child: const ListTile(
                  leading: Icon(
                    Icons.local_offer_outlined,
                    color: Color(0xfff15a24),
                  ),
                  title: Text("Add Promo Code"),
                  trailing:
                  Icon(Icons.arrow_forward_outlined, color: Colors.black),
                ),
              ),
              Container(
                height: 100,
                decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 0),
                      bottom: BorderSide(width: 0),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Item Total"),
                        Text("\$50.00"),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Discount"),
                        Text("\$10.00"),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Delivery Fee"),
                        Text("Free"),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 60,
                decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(width: 0),
                      bottom: BorderSide(width: 0),
                    )),
                child: const ListTile(
                  title: Text("Total"),
                  trailing:
                  Text("\$70.00"),
                ),
              ),

              ElevatedButton(
                onPressed:
                    () {
                },
                child: const Text(
                  "Check Out",
                  style: TextStyle(fontSize: 26),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFFF15A24),
                  minimumSize: const Size(double.infinity, 60.00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
