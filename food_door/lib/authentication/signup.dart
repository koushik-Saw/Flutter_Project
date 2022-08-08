import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_door/authentication/login.dart';
import 'package:food_door/pages/welcome.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool hidePassword = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  get user => _auth.currentUser;
  
  final _signupusercontroller = new TextEditingController();
  final _signupemailcontroller = new TextEditingController();
  final _signuppasswordcontroller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Center(
            child: Text(
              "Sign Up",
              style: TextStyle(
                  color: Color(0xff04475f),
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create Account",
                  style: TextStyle(
                      color: Color(0xff04475f),
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Enter Your Phone number or Email to sign in. Enjoy your food",
                  style: TextStyle(
                      color: Color(0xff04597b),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),const SizedBox(
                  height: 18,
                ),
                TextFormField(
                  controller: _signupusercontroller,
                  decoration: InputDecoration(
                      hintText: "Enter Your Username",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                  style: const TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFormField(
                  controller: _signupemailcontroller,
                  decoration: InputDecoration(
                      hintText: "Enter Your Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                  style: const TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  obscureText: !hidePassword,
                  controller: _signuppasswordcontroller,
                  decoration: InputDecoration(
                      hintText: "Enter Your Password",
                      suffixIcon: IconButton(
                        icon: hidePassword
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16))),
                  style: const TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    final signupemail = _signupemailcontroller.text;
                    final signuppassword = _signuppasswordcontroller.text;
                    final signupuser = _signupusercontroller.text;
                    String phone = "+880";
                    String gender = "undefined";
                    String language = "Bangla";
                    String Deliveryadd = "None";
                    signUp(email: signupemail, password: signuppassword).then((result) {
                      if (result == null) {
                        FirebaseFirestore.instance.collection("accounts").doc(signupemail).set({
                          "Username": signupuser,
                          "Email": signupemail,
                          "Phone": phone,
                          "Gender": gender,
                          "Language": language,
                          "Delivery Address":Deliveryadd
                        });
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      } else {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const Welcome()));
                      }
                    });

                  },
                  child: const Text(
                    "Sign Up",
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
                const SizedBox(
                  height: 20,
                ),

                const Center(child: Text("OR")),
                const SizedBox(
                  height: 20,
                ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   SignInButtonBuilder(
                     width: 30.00,
                     height: 50.00,
                     mini: true,
                     image: Image.asset(
                       "asset/facebook.png",
                       width: 40,
                       height: 40,
                     ),
                     onPressed: () {},
                     backgroundColor: const Color(0xffffffff),
                     text: '',
                     fontSize: 26,
                   ),
                   SignInButtonBuilder(
                     width: 30.00,
                     height: 50.00,
                     mini: true,
                     image: Image.asset(
                       "asset/google.png",
                       width: 40,
                       height: 40,
                     ),
                     onPressed: () {},
                     fontSize: 26,
                     text: '',
                     backgroundColor: const Color(0xffffffff),
                   ),
                 ],
               )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

}
