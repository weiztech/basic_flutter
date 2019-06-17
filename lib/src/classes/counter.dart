import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _counter;

  Counter(this._counter);

  getCounter() => _counter;
  setCounter(int counter) => _counter = counter;

  void increment() {
    _counter++;
    notifyListeners();
    print("COUNTER INC $_counter");
  }

  void decrement() {
    _counter--;
    notifyListeners();
    print("COUNTER DEC $_counter");
  }
}

class Planet{
  String _name;
  String showName;
  String color;

  Planet(this._name, this.color){
    this.showName = this._name;
  }

  Planet.mars() {
    this._name = "mars";
    this.showName = this._name;
    this.color = "red";
  }

  Planet.earth() {
    this._name = "earth";
    this.showName = this._name;
    this.color = "blue";
  }

  void changeNameCounter(int counter) => showName = "$_name-($counter)";
}
