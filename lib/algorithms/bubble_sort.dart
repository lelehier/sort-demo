import 'package:sort_demo/algorithms/algorithm.dart';

class BubbleSort extends Algorithms {
  void sort(List<int> array) {
    bool sorted;
    for (var i = 0; i < array.length; i++) {
      sorted = true;
      for (var j = 0; j < array.length - 1; j++) {
        if (array[j] < array[j - 1]) {
          swap(array, j, j - 1);
          sorted = false;
        }
        if (sorted) {
          return;
        }
      }
    }
  }
}
