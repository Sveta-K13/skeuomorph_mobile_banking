import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';
import 'package:skeuomorph_mobile_banking/models/outcome.dart';
import 'package:skeuomorph_mobile_banking/theme.dart';
import 'package:skeuomorph_mobile_banking/utils/utils.dart';
import 'package:skeuomorph_mobile_banking/widgets/lamp_button.dart';

class PieChartPainter extends CustomPainter {
  final List<Outcome> outcomes;
  final int currentIndex;
  final double padding;

  PieChartPainter(
      {@required this.outcomes, this.currentIndex, this.padding = 16});

  @override
  void paint(Canvas canvas, Size size) {
    double radius = 155;
    double innerRadius = 60;
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double offsetRadius = 10;

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

    Paint sectorBgPaint = Paint();
    Paint sectorPaint = Paint();

    canvas.drawCircle(size.center(Offset(5, 5)), radius, shadowPaint);
    canvas.drawCircle(size.center(Offset(-5, -5)), radius, lightPaint);
    canvas.drawCircle(size.center(Offset.zero), radius, fillPaint);

    double lastAngle = -pi / 2;
    double currentY = getCoordinateY(
        centerY, radius - padding - offsetRadius, lastAngle + 0.02);
    double currentX = getCoordinateX(
        centerX, radius - padding - offsetRadius, lastAngle + 0.02);
    double sweepAngle;
    for (int i = 0; i < outcomes.length; i++) {
      sweepAngle = getSweepAngle(outcomes[i].percentage);
      Path sectorPath = Path()
        ..moveTo(currentX, currentY)
        ..arcTo(
            Rect.fromCircle(
                center: size.center(Offset(
                    getCoordinateX(
                        0, radius - padding - offsetRadius, lastAngle + 0.1),
                    getCoordinateY(
                        0, radius - padding - offsetRadius, lastAngle + 0.1))),
                radius: offsetRadius),
            lastAngle - (pi / 2),
            pi / 2,
            false)
        ..arcTo(
            Rect.fromCircle(
                center: size.center(Offset.zero), radius: radius - padding),
            lastAngle + 0.1,
            sweepAngle - 0.24,
            false)
        ..arcTo(
            Rect.fromCircle(
                center: size.center(Offset(
                    getCoordinateX(0, radius - padding - offsetRadius,
                        getVectorAngle(lastAngle, sweepAngle) - 0.1),
                    getCoordinateY(0, radius - padding - offsetRadius,
                        getVectorAngle(lastAngle, sweepAngle) - 0.1))),
                radius: offsetRadius),
            getVectorAngle(lastAngle, sweepAngle) - 0.11,
            pi / 2,
            false)
        ..lineTo(
            getCoordinateX(centerX, innerRadius + offsetRadius,
                getVectorAngle(lastAngle, sweepAngle) - 0.025),
            getCoordinateY(centerY, innerRadius + offsetRadius,
                getVectorAngle(lastAngle, sweepAngle) - 0.025))
        ..arcTo(
            Rect.fromCircle(
                center: size.center(Offset(
                    getCoordinateX(0, innerRadius + offsetRadius,
                        getVectorAngle(lastAngle, sweepAngle) - 0.17),
                    getCoordinateY(0, innerRadius + offsetRadius,
                        getVectorAngle(lastAngle, sweepAngle) - 0.17))),
                radius: offsetRadius),
            getVectorAngle(lastAngle, sweepAngle) + pi / 2,
            pi / 2,
            false)
        ..arcTo(
            Rect.fromCircle(
                center: size.center(Offset.zero), radius: innerRadius),
            getVectorAngle(lastAngle, sweepAngle) - 0.14,
            -sweepAngle + 0.26,
            false)
        ..arcTo(
            Rect.fromCircle(
                center: size.center(Offset(
                    getCoordinateX(0, innerRadius + offsetRadius, lastAngle + 0.17), getCoordinateY(0, innerRadius + offsetRadius, lastAngle + 0.17))),
                radius: offsetRadius),
            lastAngle - pi,
            pi / 2,
            false)
        ..lineTo(currentX, currentY);

      if (i == currentIndex) {
        Paint selectedPaint = Paint()
          ..shader = LinearGradient(colors: [
            Color.alphaBlend(
                Color(0xFFFFFFFF).withOpacity(0.6), outcomes[i].color),
            outcomes[i].color
          ]).createShader(sectorPath.getBounds());
        Paint selectedShadowPaint = Paint()
          ..color = outcomes[i].color.withOpacity(0.4)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 6);

        canvas.drawPath(sectorPath.shift(Offset(3, 8)), selectedShadowPaint);
        canvas.drawPath(sectorPath, selectedPaint);
      } else {
        sectorBgPaint
          ..shader = LinearGradient(colors: <Color>[
            Color(0xFF8CA2B7).withOpacity(0.4),
            Color(0xFFFFFFFF),
          ], begin: Alignment.topLeft, end: Alignment.topCenter)
              .createShader(sectorPath.getBounds());
        sectorPaint
          ..color = uiBgColor
          ..maskFilter = MaskFilter.blur(BlurStyle.inner, 10);
        canvas.drawPath(sectorPath, sectorBgPaint);
        canvas.drawPath(sectorPath, sectorPaint);
      }

      lastAngle = lastAngle + getSweepAngle(outcomes[i].percentage);
      currentY = getCoordinateY(
          centerY, radius - padding - offsetRadius, lastAngle + 0.02);
      currentX = getCoordinateX(
          centerX, radius - padding - offsetRadius, lastAngle + 0.02);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PieChart extends StatelessWidget {
  final List<Outcome> outcomes;
  final int currentIndex;

  PieChart({this.outcomes, this.currentIndex = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265,
      width: 265,
      child: CustomPaint(
        painter:
            PieChartPainter(outcomes: outcomes, currentIndex: currentIndex),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: CircularText(
                children: [
                  TextItem(
                      text: Text(
                        outcomes[currentIndex].percentage.toString() + '%',
                        style: TextStyle(
                          color: Color.alphaBlend(
                              Color(0xFF000000).withOpacity(0.3),
                              outcomes[currentIndex].color),
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      space: 8,
                      startAngle: getStartAngle(outcomes, currentIndex))
                ],
                radius: 115,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: LampButton(),
            ),
          ],
        ),
      ),
    );
  }
}
