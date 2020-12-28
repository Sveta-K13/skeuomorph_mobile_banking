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
        Offset(0, 0),
        Offset(size.width, size.width),
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
      isActive: true,
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

  // void _drawGizmos(Offset center, Canvas canvas, Paint paint) {
  //   for (double i = 0; i <= 360; i += 10) {
  //     canvas.drawCircle(
  //         geometry.cartesian(outerRadius, geometry.toRad(i)) + center,
  //         5,
  //         paint);
  //   }
  // }

  // void _drawPoints(Canvas canvas, List<Offset> points, Paint paint) {
  //   points.forEach((point) => canvas.drawCircle(point, 5, paint));
  // }

  void _drawSector(
      {final Canvas canvas,
      final Size size,
      final double startAngle,
      final double sweepAngle,
      Paint paint,
      bool isActive = false}) {
    final center = Offset(size.width / 2, size.height / 2);

    final path = Path();
    final delta = geometry.toRad(3);
    var deltaAngle = 3 * delta;

    final p0 =
        Offset.fromDirection(startAngle, innerRadius + borderRadius) + center;
    path.moveTo(p0.dx, p0.dy);
    final p1 =
        Offset.fromDirection(startAngle, outerRadius - borderRadius) + center;
    path.lineTo(p1.dx, p1.dy);

    final cp1 = Offset.fromDirection(startAngle, outerRadius) + center;
    final p2 =
        Offset.fromDirection(startAngle + deltaAngle, outerRadius) + center;
    path.quadraticBezierTo(cp1.dx, cp1.dy, p2.dx, p2.dy);

    path.arcTo(
      Rect.fromCircle(center: center, radius: outerRadius),
      startAngle + deltaAngle,
      sweepAngle - 1.5 * deltaAngle,
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
    path.lineTo(p4.dx, p4.dy);

    final cp3 =
        Offset.fromDirection(startAngle + sweepAngle, innerRadius) + center;
    final p5 = Offset.fromDirection(
            startAngle + sweepAngle - 1.5 * deltaAngle, innerRadius) +
        center;
    path.quadraticBezierTo(cp3.dx, cp3.dy, p5.dx, p5.dy);

    final cp4 = Offset.fromDirection(startAngle, innerRadius) + center;
    final cp5 =
        Offset.fromDirection(startAngle + sweepAngle, innerRadius + 15) +
            center;
    final p6 =
        Offset.fromDirection(startAngle + 1.5 * deltaAngle, innerRadius) +
            center;
    path.arcToPoint(p6, radius: Radius.circular(innerRadius), clockwise: false);
    path.moveTo(p6.dx, p6.dy);
    path.quadraticBezierTo(cp4.dx, cp4.dy, p0.dx, p0.dy);

    path.close();

    final lightPaint1 = Paint();
    lightPaint1
      ..shader = LinearGradient(
        colors: <Color>[
          Color(0xFF2C333A).withAlpha(0),
          Color(0xFFFFFFFF).withAlpha(15),
        ],
        begin: Alignment(-0.2, 0.2),
        end: Alignment(0.7, 0.7),
      ).createShader(path.getBounds());

    final lightPaint2 = Paint();
    lightPaint2
      ..shader = LinearGradient(
        colors: <Color>[
          Color(0xFF2C333A).withAlpha(3),
          Color(0xFFFFFFFF).withAlpha(20),
        ],
        begin: Alignment(0.7, 0.6),
        end: Alignment(1.4, 0.5),
        //stops: [0.5, 0.9],
      ).createShader(path.getBounds());

    final shadowPaint = Paint()
      ..shader = LinearGradient(
        colors: <Color>[
          Colors.black.withAlpha(60),
          Colors.black.withAlpha(0),
        ],
        begin: Alignment(-1, -1),
        end: Alignment(0.5, 0.5),
      ).createShader(path.getBounds());

    final shadowMask = Paint()
      ..color = Color(0xFF2C333A).withOpacity(0.2)
      ..maskFilter = MaskFilter.blur(BlurStyle.inner, 6);

    canvas.drawPath(path, paint);
    canvas.drawPath(path, lightPaint1);
    canvas.drawPath(path, lightPaint2);
    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, shadowMask);

    final sectorPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment(-2, 0),
        end: Alignment(0.4, 0.4),
        colors: [
          Color(0xFFFFA05C),
          Color(0xFFF06500),
        ],
      ).createShader(path.getBounds());
    if (isActive) {
      canvas.drawShadow(path.shift(Offset(-16, 20)),
          Color(0xFFF46600).withAlpha(30), 40, false);
      canvas.drawShadow(path.shift(Offset(-1, -40)),
          Color(0xFFF46600).withAlpha(30), 40, false);
      canvas.drawShadow(path.shift(Offset(-2, -2)),
          Color(0xFFFF9040).withAlpha(60), 24, false);

      canvas.drawPath(path, sectorPaint);
      final p = Offset.fromDirection(geometry.toRad(122.5),
              innerRadius + (outerRadius - innerRadius) / 2 + 15) +
          center;
      drawText(canvas, '25%', p.dx, p.dy, 5 * 3.14 / 4);
    }
  }

  void drawText(Canvas context, String title, double x, double y,
      double angleRotationInRadians) {
    context.save();
    context.translate(x, y);
    context.rotate(angleRotationInRadians);
    TextSpan span = new TextSpan(
      style: new TextStyle(
        color: Color(0xFF612901).withOpacity(0.6),
        fontSize: 28.0,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            offset: Offset(-1, 0),
            blurRadius: 2,
            color: Color(0xFFFEEDE0).withAlpha(20),
          ),
          Shadow(
            offset: Offset(1, 1),
            blurRadius: 2,
            color: Color(0xFF773607).withAlpha(30),
          ),
        ],
      ),
      text: title,
    );
    TextPainter tp = new TextPainter(
      text: span,
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(context, new Offset(0.0, 0.0));
    context.restore();
  }
}
