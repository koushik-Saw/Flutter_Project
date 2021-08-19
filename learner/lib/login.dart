import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

String _email = "", _password = "";

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        children: [
          //Icon
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/ring.png"),
              )),
            ),
          ),

          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                //Text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),

                //Emailtextfield
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: Icon(Icons.mail),
                    ),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.pink,
                          )),
                          hintText: "Email"),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          _email = value.trim();
                        });
                      },
                    ))
                  ],
                ),

                //passwordtextfield
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(Icons.lock),
                    ),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: Colors.pink,
                          )),
                          hintText: "Pass"),
                      onChanged: (value) {
                        setState(() {
                          _password = value.trim();
                        });
                      },
                    ))
                  ],
                ),

                //Login Button
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () {
                        //signin();
                      },
                      child: Text("Login"),
                    ),
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }
}
