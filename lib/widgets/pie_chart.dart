import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';
import 'package:skeuomorph_mobile_banking/widgets/pie_chart_painter.dart';

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
          begin: Alignment(-1.2, -1.4),
          end: Alignment(1.2, 1.3),
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
          ),
          child: Stack(
            children: [
              CustomPaint(
                size: Size(500, 500),
                painter: PieCharPainter(
                  outerRadius: diameter * 0.89 / 2,
                  innerRadius: 53,
                ),
              ),
              Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0xFF35393E),
                  ),
                ),
              ),
              Center(
                child: CircularText(
                  radius: 32,
                  children: [
                    TextItem(
                      startAngle: 110,
                      text: Text(
                        'Press to switch income or outcome',
                        style: TextStyle(
                          fontFamily: 'Gilroy',
                          fontSize: 6,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFC9CED3).withAlpha(80),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment(0, 0.02),
                child: Image.asset('assets/images/lamp.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
