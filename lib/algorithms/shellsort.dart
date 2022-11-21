import 'package:provider/provider.dart';
import 'package:sort_demo/algorithms/a_element.dart';
import 'package:sort_demo/algorithms/algorithm.dart';
import 'package:sort_demo/widgets/sort_card.dart';
import 'package:sort_demo/providers/graph_provider.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ShellSort extends Algorithms {
  void sort(
    BuildContext context,
    List<Aelement> array,
  ) async {
    int inner;
    int outer;
    int tmp;
    int current = 0;
    // Größe der Teillisten
    int h = 1;
    while (h < array.length / 4) {
      h = h * 4 + 1;
    }
    while (h > 0) {
      for (outer = h; outer < array.length; outer++) {
        tmp = array[outer].value;
        inner = outer;
        while (inner > h - 1 && array[inner - h].value >= tmp) {
          context.read<Graph>().addcheck();
          context.read<Graph>().select(inner);
          context.read<Graph>().select(inner - h);
          await Future.delayed(Duration(
                  milliseconds:
                      Provider.of<Graph>(context, listen: false).speed) *
              0.4);
          array[inner].value = array[inner - h].value;
          //context.read<Graph>().addswitch();
          //context.read<Graph>().update(array);
          await Future.delayed(Duration(
                  milliseconds:
                      Provider.of<Graph>(context, listen: false).speed) *
              0.4);
          context.read<Graph>().deselect(inner);
          context.read<Graph>().deselect(inner - h);
          await Future.delayed(Duration(
                  milliseconds:
                      Provider.of<Graph>(context, listen: false).speed) *
              0.4);
          inner -= h;
        }
        array[inner].value = tmp;
        context.read<Graph>().addswitch();
        context.read<Graph>().addswitch();
        context.read<Graph>().update(array);
      }
      h = (h - 1) ~/ 4;
    }

    while (current <= array.length) {
      context.read<Graph>().setfinished(current);
      current++;
    }
  }
}
