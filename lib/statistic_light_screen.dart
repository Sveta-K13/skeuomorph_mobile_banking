import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skeuomorph_mobile_banking/models/outcome.dart';
import 'package:skeuomorph_mobile_banking/theme.dart';
import 'package:skeuomorph_mobile_banking/widgets/category_card.dart';
import 'package:skeuomorph_mobile_banking/widgets/period_card.dart';
import 'package:skeuomorph_mobile_banking/widgets/swipe_button.dart';

class StatisticLightScreen extends StatefulWidget {
  @override
  _StatisticLightScreenState createState() => _StatisticLightScreenState();
}

class _StatisticLightScreenState extends State<StatisticLightScreen> {
  List<Outcome> outcomes = <Outcome>[
    Outcome('assets/icons/shopping.png', 'Shopping', 50, 3187.16),
    Outcome('assets/icons/restaurant.png', 'Restaurants', 25, 1593.58),
    Outcome('assets/icons/taxi.png', 'Transport', 15, 956.14),
    Outcome('assets/icons/pharmacy.png', 'Pharmacy', 10, 637.44),
  ];

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PeriodCard(),
            Container(
              height: 295,
              width: 295,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            Flexible(
              child: Container(
                height: 128,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: outcomes.length,
                      itemBuilder: (BuildContext context, int i) =>
                          CategoryCard(outcomes[i])),
                ),
              ),
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
