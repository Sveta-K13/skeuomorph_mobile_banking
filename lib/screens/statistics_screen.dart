import 'package:flutter/material.dart';
import 'package:skeuomorph_mobile_banking/widgets/category_card.dart';
import 'package:skeuomorph_mobile_banking/widgets/period_card.dart';
import 'package:skeuomorph_mobile_banking/widgets/pie_chart.dart';
import 'package:skeuomorph_mobile_banking/widgets/sk_button.dart';
import 'package:skeuomorph_mobile_banking/widgets/swipe_button.dart';

const iconsUrl = {
  'house': 'assets/images/house_def.png',
  'house_pressed': 'assets/images/house_pressed.png',
  'cross': 'assets/images/cross_def.png',
  'cross_pressed': 'assets/images/cross_pressed.png',
  'cards': 'assets/images/cards_def.png',
  'cards_pressed': 'assets/images/cards_pressed.png',
  'settings': 'assets/images/settings.png',
  'settings_pressed': 'assets/images/settings_pressed.png',
};

class StatisticsScreen extends StatelessWidget {
  final String title;

  const StatisticsScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
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
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                children: [
                  Stack(
                    children: [
                      SwipeButton(),
                    ],
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: Color(0xFFD6E1EF),
                      fontSize: 36,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Container(),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          //physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 32.0,
                  right: 32.0,
                  top: 30.0,
                ),
                child: PeriodCard(),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                child: PieChart(
                  diameter: screenWidth - 64,
                ),
              ),
              _buildCarousel(context, 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarousel(BuildContext context, int carouselIndex) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(
          height: 196.0,
          child: PageView(
            controller: PageController(
              viewportFraction: 0.8,
              initialPage: 1,
            ),
            children: [
              _buildCarouselItem(WideCard()),
              _buildCarouselItem(
                WideCard(
                  child: CategoryCard(
                    amount: ' 1593,58',
                    percentage: 25,
                    icon: Image.asset(
                      'assets/images/cup.png',
                    ),
                    title: 'Restaurants',
                  ),
                ),
              ),
              _buildCarouselItem(WideCard()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SkButton(
                child: Image.asset(iconsUrl['house']),
                pressedChild: Image.asset(iconsUrl['house_pressed']),
              ),
              SkButton(
                child: Image.asset(iconsUrl['cross']),
                pressedChild: Image.asset(iconsUrl['cross_pressed']),
              ),
              SkButton(
                child: Image.asset(iconsUrl['cards']),
                pressedChild: Image.asset(iconsUrl['cards_pressed']),
              ),
              SkButton(
                child: Image.asset(iconsUrl['settings']),
                pressedChild: Image.asset(iconsUrl['settings_pressed']),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCarouselItem(Widget widget) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 12),
      child: widget,
    );
  }
}
