import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  Tile(this.title, this.children, {super.key});

  String title;
  List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      childrenPadding: EdgeInsets.all(10),
      children: children,
    );
  }
}
