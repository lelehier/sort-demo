import 'dart:math';

import 'package:flutter/material.dart';

class SortCard extends StatefulWidget {
  const SortCard({super.key});

  @override
  State<SortCard> createState() => _SortCardState();
}

class _SortCardState extends State<SortCard> {
  List<double> graph = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i <= 30; i++) {
      graph.add(Random().nextDouble() * 150);
    }
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
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
                    padding: const EdgeInsets.all(20.0),
                    child: IconButton(
                      onPressed: () => () {},
                      icon: Icon(Icons.info_outline_rounded),
                      splashRadius: 10,
                    ),
                  ),
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: graph.length,
                    itemBuilder: (context, index) => (bar(graph[index])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(children: [
                    Icon(Icons.av_timer_rounded),
                    Text('Operatioen:')
                  ]),
                ),
              ],
            )));
  }

  Widget bar(double value) {
    return Column(children: [
      Expanded(
        child: Container(),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 1),
        child: AnimatedContainer(
          curve: Curves.easeInOutCubic,
          duration: Duration(milliseconds: 500),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              color: Theme.of(context).colorScheme.tertiary),
          width: 10,
          height: value,
        ),
      ),
    ]);
  }
}
