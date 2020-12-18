import 'dart:math';

import 'package:skeuomorph_mobile_banking/models/outcome.dart';

double getSweepAngle(int percentage) {
  return (2 * pi * percentage) / 100;
}

double getCoordinateX(double center, double radius, double angle) {
  return center + radius * cos(angle);
}

double getCoordinateY(double center, double radius, double angle) {
  return center + radius * sin(angle);
}

double getVectorAngle(double startAngle, double sweepAngle) {
  return (0 - startAngle - sweepAngle).abs();
}

double getStartAngle(List<Outcome> list, int index) {
  double angle = -pi / 2;
  for (int i = 0; i < list.length; i++) {
    angle += getSweepAngle(list[i].percentage);
    if (i == index) break;
  }
  angle -= getSweepAngle(list[index].percentage) / 2;
  angle = angle * 180 / pi;
  return angle - 10;
}
