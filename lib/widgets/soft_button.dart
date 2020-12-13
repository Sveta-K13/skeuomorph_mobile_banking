import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skeuomorph_mobile_banking/theme.dart';

class SoftButton extends StatefulWidget {
  @override
  _SoftButtonState createState() => _SoftButtonState();
}

class _SoftButtonState extends State<SoftButton> {
  bool isTapped = false;

  void onTap() {
    setState(() {
      isTapped = !isTapped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 8.0,
              offset: Offset(2.5, 1.5),
              color: Color(0xFF8CA2B7).withOpacity(0.4),
            ),
            BoxShadow(
              blurRadius: 6.0,
              offset: Offset(-2.5, -1.5),
              color: Color(0xFFFFFFFF),
            ),
          ],
          gradient: LinearGradient(
              colors: isTapped
                  ? <Color>[
                      Color(0xFFB9CCE2).withOpacity(0.4),
                      Color(0xFFFFFFFF),
                    ]
                  : [
                      Color(0xFFEDF2F8),
                      Color(0xFFEDF2F8),
                    ],
              transform: GradientRotation(pi / 4)),
          //color: Color(0xFFE3EDF7),
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(14),
          child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return iconGradient.createShader(bounds);
              },
              blendMode: BlendMode.srcIn,
              child: Icon(Icons.arrow_forward_ios)),
        ),
      ),
    );
  }
}
