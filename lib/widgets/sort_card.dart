import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sort_demo/algorithms/a_element.dart';
import 'package:sort_demo/algorithms/bubble_sort.dart';
import 'package:sort_demo/providers/graph_provider.dart';

class SortCard extends StatefulWidget {
  const SortCard({super.key});

  @override
  State<SortCard> createState() => _SortCardState();
}

class _SortCardState extends State<SortCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
                itemCount: context.watch<Graph>().data.length,
                itemBuilder: (context, index) => (bar(
                    context.watch<Graph>().data[index].value.toDouble(),
                    context.watch<Graph>().data[index].selected,
                    context.watch<Graph>().data[index].finished)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.av_timer_rounded),
                        Text('Checks: ' +
                            context.watch<Graph>().checks.toString()),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.swap_horiz_rounded),
                        Text('Swaps: ' +
                            context.watch<Graph>().switches.toString()),
                      ],
                    )
                  ]),
            ),
            ElevatedButton(
                onPressed: () => setState(() {
                      BubbleSort().sort(context,
                          Provider.of<Graph>(context, listen: false).data,
                          step_duration: Duration(milliseconds: 650));
                    }),
                child: Text('Sort')),
            ElevatedButton(
                onPressed: () => setState(() {
                      List<Aelement> temp = [];
                      for (int i = 0; i <= 20; i++) {
                        temp.add(Aelement(Random().nextInt(150)));
                      }
                      context.read<Graph>().update(temp);
                    }),
                child: Text('Reset'))
          ],
        ),
      ),
    );
  }

  Widget bar(double value, bool selected, bool finished) {
    return Column(children: [
      Expanded(
        child: Container(),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 1),
        child: AnimatedContainer(
          curve: Curves.easeInOutCubic,
          duration: Duration(milliseconds: 200),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              color: (!selected && !finished)
                  ? Theme.of(context).colorScheme.primary
                  : (finished)
                      ? Colors.greenAccent
                      : Colors.redAccent),
          width: 10,
          height: value,
        ),
      ),
    ]);
  }
}
