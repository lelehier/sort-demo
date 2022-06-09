import 'package:flutter/widgets.dart';
import 'package:sort_demo/algorithms/a_element.dart';

class Graph with ChangeNotifier {
  List<Aelement> _data = [];
  int _switches = 0;
  int _checks = 0;

  List<Aelement> get data => _data;
  int get switches => _switches;
  int get checks => _checks;

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

  void addswitch() {
    _switches = _switches + 1;
    notifyListeners();
  }

  void addcheck() {
    _checks = _checks + 1;
    notifyListeners();
  }
}
