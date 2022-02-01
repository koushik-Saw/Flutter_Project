import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bottomtextbutton extends StatelessWidget {
  const Bottomtextbutton({
    Key? key, required this.icons, required this.title, required this.clr, required this.callback,
  }) : super(key: key);
final Icon icons;
final String? title;
final Color clr;
final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: () => callback, icon: icons,
        ),
        Text(title!,style: TextStyle(color: clr),)
      ],
    );
  }
}