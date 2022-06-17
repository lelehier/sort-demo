import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  Tile(this.title, this.lead, this.children, {super.key});

  String title;
  Icon lead;
  List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: ExpansionTile(
          collapsedBackgroundColor: Theme.of(context).hoverColor,
          backgroundColor: Theme.of(context).hoverColor,
          title: Text(title),
          leading: lead,
          childrenPadding: EdgeInsets.all(10),
          children: children,
        ),
      ),
    );
  }
}
