import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sort_demo/algorithms/a_element.dart';
import 'package:sort_demo/providers/graph_provider.dart';

abstract class Algorithms {
  void swap(List<Aelement> array, int index1, int index2) {
    Aelement temp = array[index1];
    array[index1] = array[index2];
    array[index2] = temp;
  }
}
