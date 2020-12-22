import 'package:flutter/material.dart';
import 'package:skeuomorph_mobile_banking/constraints.dart';

class WideCard extends StatelessWidget {
  final Widget child;

  const WideCard({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: linearGradient,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFC3C8CD).withOpacity(0.09),
            blurRadius: 16,
            offset: Offset(-4, -2),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 18,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final Widget icon;
  final double percentage;
  final String amount;

  CategoryCard({
    Key key,
    this.title,
    this.icon,
    this.percentage,
    this.amount,
  })  : assert(title != null),
        assert(icon != null),
        assert(percentage != null),
        assert(amount != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: RadialGradient(
          colors: [
            Color(0xFFFC7717),
            Color(0xFFEE8335).withOpacity(0),
          ],
          center: Alignment(-2, -19),
          radius: 10,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.red,
          gradient: LinearGradient(
            begin: Alignment(-4, -3),
            end: Alignment(1, 3),
            colors: [
              Color(0xFFC8D5E1).withOpacity(1.0),
              Colors.black.withOpacity(0),
            ],
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(1.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: RadialGradient(
              colors: [
                Color(0xFFFF730D),
                Color(0xFFFF852D).withOpacity(0.0),
              ],
              center: Alignment(-0.45, -2.0),
              radius: 0.88,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
                gradient: linearGradient,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: RadialGradient(
                  colors: [
                    Color(0xFFFC7717),
                    Color(0xFFEE8335).withOpacity(0),
                  ],
                  center: Alignment(-2, -19),
                  radius: 10,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      icon,
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          color: Color(0xFF6D737A),
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${percentage.floor()}%',
                        style: TextStyle(
                          color: Color(0xFFD6E1EF).withOpacity(0.6),
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        '\$ $amount',
                        style: TextStyle(
                          color: Color(0xFFD6E1EF),
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
