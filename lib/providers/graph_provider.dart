import 'package:flutter/widgets.dart';
import 'package:sort_demo/algorithms/a_element.dart';

class Graph with ChangeNotifier {
  List<Aelement> _data = [];

  List<Aelement> get data => _data;

  void select(int index) {
    _data[index].selected = true;
    notifyListeners();
  }

  void deselect(int index) {
    _data[index].selected = false;
    notifyListeners();
  }

  void setfinished(int loop) {
    _data[_data.length - loop - 1].finished = true;
    notifyListeners();
  }

  void update(List<Aelement> array) {
    _data = array;
    notifyListeners();
  }
}
