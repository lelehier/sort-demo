import 'package:provider/provider.dart';
import 'package:sort_demo/algorithms/a_element.dart';
import 'package:sort_demo/algorithms/algorithm.dart';
import 'package:sort_demo/widgets/sort_card.dart';
import 'package:sort_demo/providers/graph_provider.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class HeapSort extends Algorithms {
  void sort(
    BuildContext context,
    List<Aelement> array,
  ) async {
    for (int i = (array.length ~/ 2) - 1; i >= 0; i--) {
      versickern(context, array, i, array.length);
    }
    context.read<Graph>().update(array);
    for (int i = array.length - 1; i > 0; i--) {
      context.read<Graph>().select(i);
      context.read<Graph>().select(0);
      await Future.delayed(Duration(
              milliseconds: Provider.of<Graph>(context, listen: false).speed) *
          0.4);
      swap(array, i, 0);
      await Future.delayed(Duration(
              milliseconds: Provider.of<Graph>(context, listen: false).speed) *
          0.4);
      context.read<Graph>().deselect(i);
      context.read<Graph>().setfinished(i);
      context.read<Graph>().deselect(0);
      context.read<Graph>().addswitch();
      versickern(context, array, 0, i);
    }
  }

  void versickern(BuildContext context, List<Aelement> liste, int i, int j) {
    while (i <= (j ~/ 2) - 1) {
      //child links
      int childIndex = ((i + 1) * 2) - 1;
      //child rechts
      if (childIndex + 1 <= j - 1) {
        if (liste[childIndex].value < liste[childIndex + 1].value) {
          childIndex++;
        }
      }
      if (liste[i].value < liste[childIndex].value) {
        swap(liste, i, childIndex);
        context.read<Graph>().addswitch();
        i = childIndex;
      } else
        break;
    }
  }
}
