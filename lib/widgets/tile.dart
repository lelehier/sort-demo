import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  Tile(this.title, this.lead, this.children, {super.key});

  String title;
  Icon lead;
  List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          collapsedBackgroundColor: Theme.of(context).hoverColor,
          title: Text(title),
          leading: lead,
          childrenPadding: EdgeInsets.all(10),
          children: children,
        ),
      ),
    );
  }
}
