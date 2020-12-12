import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skeuomorph_mobile_banking/theme.dart';
import 'package:skeuomorph_mobile_banking/widgets/swipe_button.dart';

class StatisticLightScreen extends StatefulWidget {
  @override
  _StatisticLightScreenState createState() => _StatisticLightScreenState();
}

class _StatisticLightScreenState extends State<StatisticLightScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Color(0xFFF1F5F8),
          Color(0xFFDDE7F3),
          Color(0xFFE5F0F9),
        ], transform: GradientRotation(pi / 2), tileMode: TileMode.clamp),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              SwipeButton(),
              SizedBox(
                width: 16,
              ),
              Text(
                'Statistic',
                style: TextStyle(
                  color: textColor,
                  fontFamily: fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 34.0,
                ),
              ),
            ],
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
      ),
    );
  }
}
