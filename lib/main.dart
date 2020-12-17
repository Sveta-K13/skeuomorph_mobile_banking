import 'package:flutter/material.dart';
import 'package:skeuomorph_mobile_banking/screens/statistics_screen.dart';
import 'package:skeuomorph_mobile_banking/widgets/round_button.dart';

import 'constraints.dart';

void main() {
  //Paint.enableDithering = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StatisticsScreen(title: 'Statistics'),
    );
  }
}

class PeriodCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(6, 6),
            blurRadius: 28,
          ),
          BoxShadow(
            color: Color(0xFFC3C8CD).withOpacity(0.04),
            offset: Offset(-5, -6),
            blurRadius: 16,
          ),
        ],
        gradient: linearGradient,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Period:',
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w500,
              color: Color(0xFF6D737A),
              fontSize: 18,
            ),
          ),
          Text(
            'Last 30 days',
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w600,
              color: Color(0xFFD6E1EF),
              fontSize: 18,
            ),
          ),
          RoundButton(),
        ],
      ),
    );
  }
}
