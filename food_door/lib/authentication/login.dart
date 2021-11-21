import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:food_door/authentication/forgotpassword.dart';
import 'package:food_door/authentication/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool hidePassword = false;
  bool isSwitchOn = false;

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
          "Sign In",
          style: TextStyle(
              color: Color(0xff04475f),
              fontSize: 22,
              fontWeight: FontWeight.bold),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome to",
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
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16))),
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 18,
              ),
              TextField(
                obscureText: !hidePassword,
                decoration: InputDecoration(
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
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      FlutterSwitch(
                        padding: 3,
                        toggleColor: const Color.fromRGBO(255, 255, 255, 1.0),
                        activeColor: const Color(0xFF0D1266),
                        inactiveColor: Colors.black,
                        toggleSize: 18.0,
                        height: 25,
                        width: 45,
                        value: isSwitchOn,
                        onToggle: (bool value) {
                          setState(() {
                            isSwitchOn = value;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("Remember Me")
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Forgotpassword()));
                    },
                    child: const Text("Forgot Password!"),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(fontSize: 26),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF00D1266),
                  minimumSize: const Size(double.infinity, 80.00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't Have any account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()));
                    },
                    child: const Text("Sign Up"),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(child: Text("OR")),
              const SizedBox(
                height: 20,
              ),
              SignInButtonBuilder(
                width: double.infinity,
                height: 80.00,
                image: Image.asset(
                  "asset/facebook.png",
                  width: 40,
                  height: 40,
                ),
                onPressed: () {},
                backgroundColor: const Color(0xff53a0f4),
                text: 'Connect With Facebook',
                fontSize: 26,
              ),
              const SizedBox(
                height: 20,
              ),
              SignInButtonBuilder(
                width: double.infinity,
                height: 80.00,
                image: Image.asset(
                  "asset/google.png",
                  width: 40,
                  height: 40,
                ),
                onPressed: () {},
                backgroundColor: const Color(0xff53a0f4),
                text: 'Connect With Google',
                fontSize: 26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
