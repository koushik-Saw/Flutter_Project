import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class listitle extends StatelessWidget {
  const listitle({
    Key? key, required this.icn, required this.listtitle, required this.wiz,
  }) : super(key: key);
final Icon icn;
final String? listtitle;
final Widget wiz;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icn,
              const SizedBox(
                width: 20,
              ),
              Text(listtitle!),
            ],
          ),

          wiz
        ],
      ),
    );
  }
}