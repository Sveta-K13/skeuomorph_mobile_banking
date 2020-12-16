import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:skeuomorph_mobile_banking/theme.dart';
import 'package:skeuomorph_mobile_banking/utils/CustomLampShadow.dart';

class LampButton extends StatefulWidget {
  @override
  _LampButtonState createState() => _LampButtonState();
}

class _LampButtonState extends State<LampButton>
    with SingleTickerProviderStateMixin {
  final redColor = Color(0xFFE51A1A);

  AnimationController flipController;
  Animation<double> flipAnimation;

  @override
  void initState() {
    flipController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    flipAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: pi / 2), weight: 50),
      TweenSequenceItem(tween: Tween(begin: pi / 2, end: 0.0), weight: 50),
    ]).animate(CurvedAnimation(curve: Curves.linear, parent: flipController));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: uiBgColor, boxShadow: skShadow),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: CircularText(
              children: [
                TextItem(
                    text: Text(
                      'PRESS TO SWITCH INCOME OR OUTCOME',
                      style: TextStyle(
                          color: Color(0xFF000000).withOpacity(0.3),
                          fontSize: 8,
                          fontFamily: fontFamily),
                    ),
                    startAngle: 115,
                    space: 10),
              ],
              radius: 45,
            ),
          ),
          AnimatedBuilder(
            animation: flipAnimation,
            builder: (BuildContext context, child) {
              var transform = Matrix4.identity();
              transform.setEntry(3, 2, 0.001);
              transform.rotate(Vector3(1, 1, 0), flipAnimation.value);
              return Transform(
                transform: transform,
                alignment: Alignment.center,
                child: Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        flipController.reset();
                        flipController.forward();
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(2.0),
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFFFFFFFF),
                              Color(0xFF000000).withOpacity(0.1),
                            ],
                            stops: [0.5, 1.5],
                            transform: GradientRotation(pi / 2),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: redColor.withOpacity(0.2), blurRadius: 6)
                          ]),
                      child: Container(
                        padding: EdgeInsets.all(1.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.alphaBlend(
                              Color(0xFF000000).withOpacity(0.3), redColor),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(color: redColor),
                              CustomLampShadow(
                                  blurRadius: 6, spreadRadius: -6.0),
                              BoxShadow(
                                  color: redColor.withOpacity(0.4),
                                  offset: Offset(0.0, 2.0),
                                  blurRadius: 6)
                            ],
                          ),
                          child: Center(
                            child: Transform.rotate(
                              angle: 100,
                              child: Icon(
                                Icons.arrow_forward,
                                color: Color(0xFFFFFFFF),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
