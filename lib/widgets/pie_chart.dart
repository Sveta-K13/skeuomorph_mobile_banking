import 'package:flutter/material.dart';

class PieChart extends StatelessWidget {
  final double diameter;

  const PieChart({Key key, this.diameter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(diameter / 2),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF353A40),
            Color(0xFF121416),
          ],
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(52, 20),
            color: Color(0xFF020203).withOpacity(0.5),
            blurRadius: 88,
          ),
          BoxShadow(
            offset: Offset(-8, -16),
            blurRadius: 56,
            color: Color(0xFFE8EDF3).withOpacity(0.08),
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: diameter * 0.89,
          height: diameter * 0.89,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(diameter / 2),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF070709).withOpacity(0.5),
                offset: Offset(2, 3),
                blurRadius: 12,
                spreadRadius: -20,
              ),
              BoxShadow(
                color: Color(0xFF070709).withOpacity(0.5),
              ),
              BoxShadow(
                color: Color(0xFF2C333A),
                spreadRadius: -12.0,
                blurRadius: 12.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
