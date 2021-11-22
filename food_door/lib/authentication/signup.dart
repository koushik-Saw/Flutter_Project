import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool hidePassword = false;
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
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16))),
                style: const TextStyle(fontSize: 22),
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
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 26),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF00D1266),
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
              SignInButtonBuilder(
                width: double.infinity,
                height: 60.00,
                image: Image.asset(
                  "asset/facebook.png",
                  width: 40,
                  height: 30,
                ),
                onPressed: () {},
                backgroundColor: const Color(0xff53a0f4),
                text: 'Connect With Facebook',
                fontSize: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              SignInButtonBuilder(
                width: double.infinity,
                height: 60.00,
                image: Image.asset(
                  "asset/google.png",
                  width: 40,
                  height: 30,
                ),
                onPressed: () {},
                backgroundColor: const Color(0xff53a0f4),
                text: 'Connect With Google',
                fontSize: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
