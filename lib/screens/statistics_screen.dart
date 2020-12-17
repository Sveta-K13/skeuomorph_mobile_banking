import 'package:flutter/material.dart';

import '../main.dart';

class StatisticsScreen extends StatelessWidget {
  final String title;

  const StatisticsScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF262B2F),
            Color(0xFF16191D),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 40),
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xFFD6E1EF),
                fontSize: 36,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 32.0,
                vertical: 32.0,
              ),
              child: PeriodCard(),
            ),
          ],
        ),
      ),
    );
  }
}
