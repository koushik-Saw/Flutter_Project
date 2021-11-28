import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bottomtextbutton extends StatelessWidget {
  const Bottomtextbutton({
    Key? key, required this.icons, required this.title,
  }) : super(key: key);
final Icon icons;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: (){}, icon: icons,
        ),
        Text(title)
      ],
    );
  }
}