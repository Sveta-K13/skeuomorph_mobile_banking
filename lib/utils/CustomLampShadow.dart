import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class CustomLampShadow extends BoxShadow {
  const CustomLampShadow({
    double blurRadius = 0.0,
    double spreadRadius = 0.0,
  }) : super(blurRadius: blurRadius, spreadRadius: spreadRadius);

  @override
  Paint toPaint() {
    final Paint result = Paint()
      ..shader = LinearGradient(
              colors: <Color>[
            Color(0xFFE51A1A),
            Color(0xFFFFA14A).withOpacity(0.9),
          ],
              begin: Alignment(0.0, 0.0),
              end: Alignment(0.25, 0.0),
              tileMode: TileMode.mirror)
          .createShader(Rect.fromCircle(center: Offset(0, 0), radius: 10))
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
    assert(() {
      if (debugDisableShadows) result.maskFilter = null;
      return true;
    }());
    return result;
  }
}
