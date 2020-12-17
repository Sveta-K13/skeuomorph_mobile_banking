import 'package:flutter/material.dart';
class Outcome {
  String _icon;
  String _name;
  int _percentage;
  double _sum;
  Color _color;

  String get icon => _icon;

  String get name => _name;

  int get percentage => _percentage;

  double get sum => _sum;

  Color get color => _color;

  Outcome(this._icon, this._name, this._percentage, this._sum, this._color);
}
