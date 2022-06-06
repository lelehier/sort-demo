import 'package:flutter/material.dart';

class SortCard extends StatefulWidget {
  const SortCard({super.key});

  @override
  State<SortCard> createState() => _SortCardState();
}

class _SortCardState extends State<SortCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).hoverColor,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: () => () {},
                icon: Icon(Icons.info_outline_rounded),
                splashRadius: 10,
              ),
            ),
          ),
          Row(
            children: [],
          ),
          Row(
            children: [
              Row(
                children: [],
              ),
              Row(
                children: [Icon(Icons.av_timer_rounded), Text('Operatioen:')],
              )
            ],
          ),
        ],
      ),
    );
  }
}
