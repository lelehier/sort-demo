import 'package:provider/provider.dart';
import 'package:sort_demo/algorithms/a_element.dart';
import 'package:sort_demo/algorithms/algorithm.dart';
import 'package:sort_demo/widgets/sort_card.dart';
import 'package:sort_demo/providers/graph_provider.dart';
import 'package:flutter/material.dart';

class BubbleSort extends Algorithms {
  void sort(BuildContext context, List<Aelement> array,
      {Duration step_duration = const Duration(microseconds: 0)}) async {
    bool sorted;
    Duration duration = step_duration ~/ 3;
    for (var i = 0; i < array.length; i++) {
      //print("for 1 - $i");
      sorted = true;
      for (var j = 1; j < array.length - i; j++) {
        //print("for 2 - $j");
        if (array[j].value < array[j - 1].value) {
          context.read<Graph>().select(j);
          context.read<Graph>().select(j - 1);
          await Future.delayed(step_duration * 0.6);
          swap(array, j, j - 1);
          //print('swap');
          context.read<Graph>().update(array);
          sorted = false;
          await Future.delayed(step_duration * 0.4);
          context.read<Graph>().deselect(j);
          context.read<Graph>().deselect(j - 1);
        } else {
          context.read<Graph>().select(j);
          context.read<Graph>().select(j - 1);
          await Future.delayed(step_duration);
          context.read<Graph>().deselect(j);
          context.read<Graph>().deselect(j - 1);
        }
      }
      context.read<Graph>().setfinished(i);
      if (sorted == true) {
        for (var z = 0; z < array.length; z++) {
          context.read<Graph>().setfinished(z);
        }

        return;
      }
    }
  }
}
