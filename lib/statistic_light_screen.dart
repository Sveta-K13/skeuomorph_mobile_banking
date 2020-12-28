import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skeuomorph_mobile_banking/models/outcome.dart';
import 'package:skeuomorph_mobile_banking/theme.dart';
import 'package:skeuomorph_mobile_banking/utils/CustomScrollPhysics.dart';
import 'package:skeuomorph_mobile_banking/widgets/category_card.dart';
import 'package:skeuomorph_mobile_banking/widgets/curve_button.dart';
import 'package:skeuomorph_mobile_banking/widgets/period_card.dart';
import 'package:skeuomorph_mobile_banking/widgets/pie_chart.dart';
import 'package:skeuomorph_mobile_banking/widgets/swipe_button.dart';

class StatisticLightScreen extends StatefulWidget {
  @override
  _StatisticLightScreenState createState() => _StatisticLightScreenState();
}

class _StatisticLightScreenState extends State<StatisticLightScreen> {
  List<Outcome> outcomes = <Outcome>[
    Outcome('assets/icons/shopping.png', 'Shopping', 50, 3187.16,
        Color(0xFFE60A0A)),
    Outcome('assets/icons/restaurant.png', 'Restaurants', 25, 1593.58,
        Color(0xFFE6660A)),
    Outcome(
        'assets/icons/taxi.png', 'Transport', 15, 956.14, Color(0xFFE6D00A)),
    Outcome(
        'assets/icons/pharmacy.png', 'Pharmacy', 10, 637.44, Color(0xFF92E60A)),
  ];

  List<Map<String, String>> bottomIcons = <Map<String, String>>[
    {
      'icon': 'assets/icons/home.png',
      'filled_icon': 'assets/icons/filled_home.png',
    },
    {
      'icon': 'assets/icons/plus.png',
      'filled_icon': 'assets/icons/filled_plus.png'
    },
    {
      'icon': 'assets/icons/card.png',
      'filled_icon': 'assets/icons/filled_card.png'
    },
    {
      'icon': 'assets/icons/settings.png',
      'filled_icon': 'assets/icons/filled_settings.png'
    },
  ];

  ScrollController _scrollController;
  ScrollPhysics _physics;

  int currentBottomIndex = 2;
  int currentListIndex = 0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.haveDimensions && _physics == null) {
        setState(() {
          var dimension = _scrollController.position.maxScrollExtent /
              (outcomes.length - 1);
          _physics = CustomScrollPhysics(itemDimension: dimension);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          Color(0xFFF1F5F8),
          Color(0xFFEDF2F8),
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
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: PieChart(
                outcomes: outcomes,
                currentIndex: currentListIndex,
              ),
            ),
            Flexible(
              child: Container(
                height: 128,
                child: NotificationListener<ScrollNotification>(
                  onNotification: (scrollNotification) {
                    setState(() {
                      currentListIndex = _scrollController.offset ~/
                          (MediaQuery.of(context).size.width - 80);
                    });
                    return true;
                  },
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    physics: _physics,
                    scrollDirection: Axis.horizontal,
                    child: ListView.builder(
                        physics: _physics,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: outcomes.length,
                        itemBuilder: (BuildContext context, int i) {
                          if (i == 0) {
                            return Padding(
                              padding: EdgeInsets.only(left: 24.0),
                              child: CategoryCard(outcomes[i]),
                            );
                          }
                          if (i == outcomes.length - 1) {
                            return Padding(
                              padding: EdgeInsets.only(right: 24.0),
                              child: CategoryCard(outcomes[i]),
                            );
                          }
                          return CategoryCard(outcomes[i]);
                        }),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: bottomIcons
                    .map((Map<String, String> map) => GestureDetector(
                          onTapDown: (details) {
                            setState(() {
                              currentBottomIndex = bottomIcons.indexOf(map);
                            });
                          },
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 500),
                            child:
                                bottomIcons.indexOf(map) == currentBottomIndex
                                    ? CurveTappedButton(
                                        map['icon'], map['filled_icon'])
                                    : CurveUntappedButton(map['icon']),
                          ),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
