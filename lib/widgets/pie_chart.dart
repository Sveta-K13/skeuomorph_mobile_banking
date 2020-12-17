import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skeuomorph_mobile_banking/models/outcome.dart';
import 'package:skeuomorph_mobile_banking/theme.dart';
import 'package:skeuomorph_mobile_banking/utils/utils.dart';
import 'package:skeuomorph_mobile_banking/widgets/lamp_button.dart';

class PieChartPainter extends CustomPainter {
  final List<Outcome> outcomes;
  final int currentIndex;
  final double padding;

  PieChartPainter(
      {@required this.outcomes, this.currentIndex = 1, this.padding = 16});

  @override
  void paint(Canvas canvas, Size size) {
    double radius = 155;
    //double innerRadius = 100;

    final Paint fillPaint = Paint()
      ..color = uiBgColor
      ..strokeWidth = 0.0
      ..style = PaintingStyle.fill;
    final Paint shadowPaint = Paint()
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10)
      ..color = Color(0xFF8CA2B7).withOpacity(0.4);
    final Paint lightPaint = Paint()
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10)
      ..color = Color(0xFFFFFFFF);
    final Paint selectedPaint = Paint()
      ..shader = LinearGradient(colors: [
        Color.alphaBlend(Color(0xFFFFFFFF), outcomes[currentIndex].color),
        outcomes[currentIndex].color
      ]).createShader(Rect.fromCircle(center: Offset(0, 0), radius: 125));

    canvas.drawCircle(size.center(Offset(5, 5)), radius, shadowPaint);
    canvas.drawCircle(size.center(Offset(-5, -5)), radius, lightPaint);
    canvas.drawCircle(size.center(Offset.zero), radius, fillPaint);

    double currentY =  padding;
    double currentX = size.width / 2 + 2;
    double lastAngle = -pi / 2;

    // for (int i = 0; i < outcomes.length; i++) {
    final Path sectorPath = Path()
      ..moveTo(currentX, currentY)
      ..arcTo(
          Rect.fromCircle(
              center: size.center(Offset.zero), radius: radius - padding),
          lastAngle + 0.03,
          getSweepAngle(outcomes[0].percentage),
          false)
      //..lineTo(x, y)
      // ..arcTo(
      //     Rect.fromCircle(
      //         center: size.center(Offset.zero), radius: radius),
      //     lastAngle + 0.03,
      //     getSweepAngle(outcomes[0].percentage),
      //     false)
      ..lineTo(currentX, currentY);

    lastAngle = lastAngle + getSweepAngle(outcomes[0].percentage);
    canvas.drawPath(sectorPath, selectedPaint);
    //}
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PieChart extends StatelessWidget {
  final List<Outcome> outcomes;

  PieChart(this.outcomes);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265,
      width: 265,
      child: CustomPaint(
        painter: PieChartPainter(outcomes: outcomes),
        child: Align(
          alignment: Alignment.center,
          child: LampButton(),
        ),
      ),
    );
  }
}
