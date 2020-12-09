import 'package:flutter/material.dart';
import 'package:skeuomorph_mobile_banking/statistic_light_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StatisticLightScreen(),
    );
  }
}
