import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

final _emailcontroller = new TextEditingController();
final _passwordcontroller = new TextEditingController();
bool vis = true;


class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children:  [
                    Expanded(
                      child: TextField(
                        controller: _emailcontroller,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.pink,
                                )),
                            hintText: "Email"),
                        keyboardType: TextInputType.emailAddress,

                ),
                    )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children:  [
                Expanded(
                  child: TextField(
                    controller: _passwordcontroller,
                    decoration:  InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              vis = !vis;
                            });
                          },
                          child:
                          Icon(vis ? Icons.visibility : Icons.visibility_off),
                        ),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.pink,
                            )),
                        hintText: "Password"),
                    keyboardType: TextInputType.emailAddress,
                    obscureText: vis,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  String _email = _emailcontroller.text.toString(), _password = _passwordcontroller.text.toString();
                  if(_email == "koushik" && _password == "0503"){
                    Fluttertoast.showToast(
                        msg: "Successfull",
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 10
                    );
                  }
                  else{
                    Fluttertoast.showToast(
                        msg: "Failed",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 3
                    );
                  }
                },
                child: const Text("Login"),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                },
                child: const Text("Forgot Password"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
