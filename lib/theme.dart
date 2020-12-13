import 'dart:math';

import 'package:flutter/material.dart';

const Color bgColor = Color(0xFFE3EDF7);
const Color textColor = Color(0xFF31456A);
const String fontFamily = 'Poppins';

LinearGradient iconGradient = LinearGradient(
  colors: <Color>[
    Color(0xFF48647D),
    Color(0xFF6B8299),
    Color(0xFFDAE2EB),
    Color(0xFF8CA2B7),
    Color(0xFFEDF2F7),
  ],
  stops: [0.0, 0.6, 0.8, 0.95, 1.0],
  transform: GradientRotation(pi+pi/6),
);