import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_door/model/bottomnavibar.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class Phoneverification extends StatefulWidget {
  const Phoneverification({Key? key}) : super(key: key);

  @override
  _PhoneverificationState createState() => _PhoneverificationState();
}

class _PhoneverificationState extends State<Phoneverification> {
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
          "Verification",
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Verification",
                style: TextStyle(
                    color: Color(0xff04475f),
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Enter the OTP from your phone that",
                style: TextStyle(
                    color: Color(0xff04597b),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: const [
                  Text(
                    "We just sent you at",
                    style: TextStyle(
                        color: Color(0xff04597b),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "+8801764622658",
                    style: TextStyle(
                        color: Color(0xff6c0606),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              OTPTextField(
                length: 5,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 60,
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  print("Completed: " + pin);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Text(
                    "Didn't receive code?",
                    style: TextStyle(
                        color: Color(0xff04597b),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  Text(
                    "Resend Code",
                    style: TextStyle(
                        color: Color(0xff05892e),
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Bottomnav()));
                },
                child: const Text(
                  "Verify",
                  style: TextStyle(fontSize: 26),
                ),
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff00d1266),
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
