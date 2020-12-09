import 'package:flutter/material.dart';
import 'package:skeuomorph_mobile_banking/theme.dart';

class StatisticLightScreen extends StatefulWidget {
  @override
  _StatisticLightScreenState createState() => _StatisticLightScreenState();
}

class _StatisticLightScreenState extends State<StatisticLightScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          'Statistic',
          style: TextStyle(
            color: textColor,
            fontFamily: fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 36.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 128, vertical: 24),
              color: Colors.white,
              child: Text(
                'Period',
                style: TextStyle(
                  color: textColor.withOpacity(0.6),
                  fontFamily: fontFamily,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              height: 295,
              width: 295,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            Container(
              height: 94,
              color: Colors.white,
            ),
            Container(
              height: 64,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
