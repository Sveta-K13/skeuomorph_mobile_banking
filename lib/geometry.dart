import 'dart:math' as Math;

import 'package:flutter/material.dart';

double polarAngle(double x, double y) {
  if (x > 0 && y >= 0) {
    return Math.atan(y / x);
  }
  if (x > 0 && y < 0) {
    return Math.atan(y / x) + Math.pi * 2;
  }
  if (x < 0) {
    return Math.atan(y / x) + Math.pi;
  }
  if (x == 0 && y > 0) {
    return Math.pi / 2;
  }
  if (x == 0 && y < 0) {
    return Math.pi * 3 / 2;
  }
  throw Exception("x and y equal zero.");
}

/// Returns the length of the arc with [radius]
/// and central [angle] in degrees.
double arcLength(double radius, double angle) {
  return Math.pi * radius * angle / 180;
}

/// Returns the central angle of the arc with [length]
/// and [radius].
double centralAngle(double length, double radius) {
  return 180 * length / (Math.pi * radius);
}

/// Converts degrees to radians.
double toRad(double angle) {
  return angle * Math.pi / 180;
}

double angleFromPolar() {
  return 0;
}

/// Retruns cartesian coordinates.
Offset cartesian(double radius, double radians) {
  final x = radius * Math.cos(radians);
  final y = radius * Math.sin(radians);
  return Offset(x, y);
}
