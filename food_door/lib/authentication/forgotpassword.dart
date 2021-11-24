import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_door/authentication/signup.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  _ForgotpasswordState createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
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
          "Forgot Password",
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
                "Forgot Password",
                style: TextStyle(
                    color: Color(0xff04475f),
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Please Enter Your Email So we can help you to recover your password",
                style: TextStyle(
                    color: Color(0xff04597b),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 90 ,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Your Email",
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
                  "Reset Password",
                  style: TextStyle(fontSize: 26),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF00D1266),
                  minimumSize: const Size(double.infinity, 60.00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
