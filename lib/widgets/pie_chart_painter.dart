import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'package:skeuomorph_mobile_banking/geometry.dart' as geometry;

class PieCharPainter extends CustomPainter {
  final double outerRadius;
  final double innerRadius;
  final borderRadius = 16.0;

  const PieCharPainter({@required this.outerRadius, @required this.innerRadius})
      : assert(outerRadius != null),
        assert(innerRadius != null);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0
      ..color = Colors.orange
      ..shader = ui.Gradient.linear(
        Offset(-150, -50),
        Offset(300, 400),
        [
          Color(0xFF2C333A),
          Color(0xFF131517),
        ],
      );

    _drawSector(
      canvas: canvas,
      paint: paint,
      size: size,
      startAngle: geometry.toRad(272),
      sweepAngle: geometry.toRad(176),
    );
    _drawSector(
      canvas: canvas,
      paint: paint,
      size: size,
      startAngle: geometry.toRad(92),
      sweepAngle: geometry.toRad(86),
    );
    _drawSector(
      canvas: canvas,
      paint: paint,
      size: size,
      startAngle: geometry.toRad(182),
      sweepAngle: geometry.toRad(45),
    );
    _drawSector(
      canvas: canvas,
      paint: paint,
      size: size,
      startAngle: geometry.toRad(231),
      sweepAngle: geometry.toRad(37),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _drawGizmos(Offset center, Canvas canvas, Paint paint) {
    for (double i = 0; i <= 360; i += 10) {
      canvas.drawCircle(
          geometry.cartesian(outerRadius, geometry.toRad(i)) + center,
          5,
          paint);
    }
  }

  void _drawPoints(Canvas canvas, List<Offset> points, Paint paint) {
    points.forEach((point) => canvas.drawCircle(point, 5, paint));
  }

  void _drawSector(
      {final Canvas canvas,
      final Size size,
      final double startAngle,
      final double sweepAngle,
      Paint paint}) {
    final center = Offset(size.width / 2, size.height / 2);

    final path = Path();
    // var startAngle = geometry.toRad(270);
    // var sweepAngle = geometry.toRad(180);
    final delta = geometry.toRad(3);
    var bezierAngle1 = 3 * delta;

    final p0 =
        Offset.fromDirection(startAngle, innerRadius + borderRadius) + center;
    path.moveTo(p0.dx, p0.dy);
    final p1 =
        Offset.fromDirection(startAngle, outerRadius - borderRadius) + center;
    path.lineTo(p1.dx, p1.dy);

    final cp1 = Offset.fromDirection(startAngle, outerRadius) + center;
    final p2 =
        Offset.fromDirection(startAngle + bezierAngle1, outerRadius) + center;
    path.quadraticBezierTo(cp1.dx, cp1.dy, p2.dx, p2.dy);

    path.arcTo(
      Rect.fromCircle(center: center, radius: outerRadius),
      startAngle + bezierAngle1,
      sweepAngle - 1.5 * bezierAngle1,
      false,
    );

    final cp2 =
        Offset.fromDirection(startAngle + sweepAngle, outerRadius) + center;
    final p3 = Offset.fromDirection(
            startAngle + sweepAngle, outerRadius - borderRadius) +
        center;
    path.quadraticBezierTo(cp2.dx, cp2.dy, p3.dx, p3.dy);

    final p4 = Offset.fromDirection(
            startAngle + sweepAngle, innerRadius + borderRadius) +
        center;
    //path.moveTo(p3.dx, p3.dy);
    path.lineTo(p4.dx, p4.dy);

    final cp3 =
        Offset.fromDirection(startAngle + sweepAngle, innerRadius) + center;
    final p5 = Offset.fromDirection(
            startAngle + sweepAngle - 1.5 * bezierAngle1, innerRadius) +
        center;
    path.quadraticBezierTo(cp3.dx, cp3.dy, p5.dx, p5.dy);

    final cp4 = Offset.fromDirection(startAngle, innerRadius) + center;
    final cp5 =
        Offset.fromDirection(startAngle + sweepAngle, innerRadius + 15) +
            center;
    final p6 =
        Offset.fromDirection(startAngle + 1.5 * bezierAngle1, innerRadius) +
            center;
    //path.quadraticBezierTo(cp5.dx, cp5.dy, p6.dx, p6.dy);
    // path.arcTo(Rect.fromCircle(center: center, radius: innerRadius),
    //     startAngle + bezierAngle1, sweepAngle - 2 * bezierAngle1, true);
    path.arcToPoint(p6, radius: Radius.circular(innerRadius), clockwise: false);
    path.moveTo(p6.dx, p6.dy);
    path.quadraticBezierTo(cp4.dx, cp4.dy, p0.dx, p0.dy);

    path.close();
    //canvas.drawShadow(path.shift(Offset(0, -5)), Colors.black, 2.0, true);
    canvas.drawPath(path, paint);
    //_drawPoints(canvas, [p6, p5], pointPaint);
  }
}
