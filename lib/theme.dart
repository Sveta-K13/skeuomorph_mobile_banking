import 'dart:math';

import 'package:flutter/material.dart';

const Color bgColor = Color(0xFFE3EDF7);
const Color textColor = Color(0xFF31456A);
const Color uiBgColor = Color(0xFFEDF2F8);
const String fontFamily = 'Poppins';

BorderRadius boxBorderRadius = BorderRadius.all(Radius.circular(16));

LinearGradient iconGradient = LinearGradient(
  colors: <Color>[
    Color(0xFF48647D),
    Color(0xFF6B8299),
    Color(0xFFDAE2EB),
    Color(0xFF8CA2B7),
    Color(0xFFEDF2F7),
  ],
  stops: [0.0, 0.6, 0.8, 0.95, 1.0],
  transform: GradientRotation(pi + pi / 6),
);

LinearGradient borderGradient = LinearGradient(
  colors: <Color>[
    Color(0xFFFFFFFF),
    Color(0xFF8CA2B7).withOpacity(0.4),
  ],
);

LinearGradient rotatedBorderGradient = LinearGradient(
  colors: <Color>[
    Color(0xFFFFFFFF),
    Color(0xFF8CA2B7).withOpacity(0.4),
  ],
  stops: [0.3, 1.2],
  transform: GradientRotation(pi / 3),
);

LinearGradient innerBoxGradient = LinearGradient(
  colors: <Color>[
    Color(0xFFB9CCE2).withOpacity(0.4),
    Color(0xFFFFFFFF),
  ],
  transform: GradientRotation(pi / 4),
);

List<BoxShadow> skShadow = <BoxShadow>[
  BoxShadow(
    blurRadius: 8.0,
    offset: Offset(3.5, 2.5),
    color: Color(0xFF8CA2B7).withOpacity(0.4),
  ),
  BoxShadow(
    blurRadius: 8.0,
    offset: Offset(-3.5, -2.5),
    color: Color(0xFFFFFFFF),
  ),
];
