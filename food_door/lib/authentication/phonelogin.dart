import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_door/authentication/phoneverfication.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class Phonelogin extends StatefulWidget {
  const Phonelogin({Key? key}) : super(key: key);

  @override
  _PhoneloginState createState() => _PhoneloginState();
}

class _PhoneloginState extends State<Phonelogin> {
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
              "Login Into Food House",
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
            children:  [
              const Text(
                "Enter Your Registered Phone number to login",
                style: TextStyle(
                    color: Color(0xff04597b),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),const SizedBox(
                height: 18,
              ),
              const Text(
                "Phone Number",
                style: TextStyle(
                    color: Color(0xff04597b),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 18,
              ),
              IntlPhoneField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
                onCountryChanged: (phone) {

                },
              ),
              const SizedBox(
                height: 18,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Phoneverification()));
                },
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 26),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xFF00D1266),
                  minimumSize: const Size(double.infinity, 80.00),
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
