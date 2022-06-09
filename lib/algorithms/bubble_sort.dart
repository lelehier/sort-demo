import 'package:provider/provider.dart';
import 'package:sort_demo/algorithms/a_element.dart';
import 'package:sort_demo/algorithms/algorithm.dart';
import 'package:sort_demo/widgets/sort_card.dart';
import 'package:sort_demo/providers/graph_provider.dart';
import 'package:flutter/material.dart';

class BubbleSort extends Algorithms {
  void sort(
    BuildContext context,
    List<Aelement> array,
  ) async {
    bool sorted;
    Duration step_duration = Duration(
            milliseconds: Provider.of<Graph>(context, listen: false).speed) ~/
        3;
    for (var i = 0; i < array.length; i++) {
      //print("for 1 - $i");
      sorted = true;
      for (var j = 1; j < array.length - i; j++) {
        //print("for 2 - $j");
        if (array[j].value < array[j - 1].value) {
          print(Duration(
                  microseconds:
                      Provider.of<Graph>(context, listen: false).speed)
              .toString());
          context.read<Graph>().addcheck();
          context.read<Graph>().select(j);
          context.read<Graph>().select(j - 1);
          await Future.delayed(Duration(
                  milliseconds:
                      Provider.of<Graph>(context, listen: false).speed) *
              0.6);
          swap(array, j, j - 1);
          context.read<Graph>().addswitch();
          //print('swap');
          context.read<Graph>().update(array);
          sorted = false;
          await Future.delayed(Duration(
                  milliseconds:
                      Provider.of<Graph>(context, listen: false).speed) *
              0.4);
          context.read<Graph>().deselect(j);
          context.read<Graph>().deselect(j - 1);
        } else {
          context.read<Graph>().addcheck();
          context.read<Graph>().select(j);
          context.read<Graph>().select(j - 1);
          await Future.delayed(Duration(
              milliseconds: Provider.of<Graph>(context, listen: false).speed));
          context.read<Graph>().deselect(j);
          context.read<Graph>().deselect(j - 1);
        }
      }
      context.read<Graph>().setfinished(i);
      if (sorted == true) {
        context.read<Graph>().addcheck();
        for (var z = 0; z < array.length; z++) {
          context.read<Graph>().setfinished(z);
        }

        return;
      }
      context.read<Graph>().addcheck();
    }
  }
}
