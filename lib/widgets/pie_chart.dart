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
  final Color uiBgColor;
  final LinearGradient shadowGradient;

  PieChartPainter(
      {@required this.outcomes,
      this.currentIndex,
      this.uiBgColor,
      this.shadowGradient,
      this.padding = 16});

  final double radius = 155;
  final double innerRadius = 60;
  final double offsetRadius = 10;
  double centerX;
  double currentX;
  double centerY;
  double currentY;
  double lastAngle = -pi / 2;
  double sweepAngle;

  Paint sectorBgPaint = Paint();
  Paint sectorPaint = Paint();
  Paint selectedPaint;
  Paint fillPaint;
  Paint shadowPaint;
  Paint lightPaint;
  Paint selectedShadowPaint;

  Path sectorPath;

  @override
  void paint(Canvas canvas, Size size) {
    centerX = size.width / 2;
    centerY = size.height / 2;

    fillPaint = Paint()
      ..color = uiBgColor
      ..strokeWidth = 0.0
      ..style = PaintingStyle.fill;
    shadowPaint = Paint()
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10)
      ..color = shadowGradient.colors[1];
    lightPaint = Paint()
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10)
      ..color = shadowGradient.colors[0];

    canvas.drawCircle(size.center(Offset(5, 5)), radius, shadowPaint);
    canvas.drawCircle(size.center(Offset(-5, -5)), radius, lightPaint);
    canvas.drawCircle(size.center(Offset.zero), radius, fillPaint);

    currentY = getCoordinateY(
        centerY, radius - padding - offsetRadius, lastAngle + 0.02);
    currentX = getCoordinateX(
        centerX, radius - padding - offsetRadius, lastAngle + 0.02);
    for (int i = 0; i < outcomes.length; i++) {
      sweepAngle = getSweepAngle(outcomes[i].percentage);
      sectorPath = Path()
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
        selectedPaint = Paint()
          ..shader = LinearGradient(colors: [
            Color.alphaBlend(
                Color(0xFFFFFFFF).withOpacity(0.6), outcomes[i].color),
            outcomes[i].color
          ]).createShader(sectorPath.getBounds());
        selectedShadowPaint = Paint()
          ..color = outcomes[i].color.withOpacity(0.4)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 6);

        canvas.drawPath(sectorPath.shift(Offset(3, 8)), selectedShadowPaint);
        canvas.drawPath(sectorPath, selectedPaint);
      } else {
        sectorBgPaint
          ..shader = LinearGradient(colors: <Color>[
            shadowGradient.colors[1],
            shadowGradient.colors[0],
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
  final Function onTap;
  final GlobalKey lampKey;

  PieChart({this.outcomes, this.currentIndex = 1, this.onTap, this.lampKey});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265,
      width: 265,
      child: CustomPaint(
        painter: PieChartPainter(
            outcomes: outcomes,
            currentIndex: currentIndex,
            uiBgColor: Theme.of(context).primaryColor,
            shadowGradient: AppTheme.borderGradient),
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
              child: LampButton(
                onTap: onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
