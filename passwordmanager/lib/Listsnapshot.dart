import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Widget buildCard(BuildContext context, DocumentSnapshot document) {
  return new Container(
      child: Card(
          color: Color(0xfff),
          child: Padding(
            padding: EdgeInsets.all(1.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ListTile(
                  title: new Text(
                    "Username: " ),
                  ),

              ],
            ),
          )));
}
