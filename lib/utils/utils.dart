import 'dart:math';

double getSweepAngle(int percentage) {
  double sweep = (2 * pi * percentage) / 100;
  return sweep - 0.06;
}
