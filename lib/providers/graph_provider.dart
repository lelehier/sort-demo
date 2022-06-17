import 'package:flutter/widgets.dart';
import 'package:sort_demo/algorithms/a_element.dart';

class Graph with ChangeNotifier {
  List<Aelement> _data = [];
  int _switches = 0;
  int _checks = 0;
  int _speed = 500;
  double _slidervalue = 1020 - 500;
  bool _running = false;

  List<Aelement> get data => _data;
  int get switches => _switches;
  int get checks => _checks;
  int get speed => _speed;
  double get slidervalue => _slidervalue;
  bool get isrunning => _running;

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

  void changespeed(double value) {
    _speed = 1020 - value.toInt();
    _slidervalue = value.toDouble();
    notifyListeners();
  }

  void isrunnning(bool value) {
    _running = value;
  }

  void resetCounter() {
    _checks = 0;
    _switches = 0;
  }
}
