import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwipeButton extends StatefulWidget {
  @override
  _SwipeButtonState createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton>
    with SingleTickerProviderStateMixin {
  AnimationController _slideController;
  Animation<Offset> position;
  Animation<Color> colorTween;
  double _radius = 12;
  bool isSwitched = false;

  @override
  void initState() {
    _slideController =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    position = Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(-0.5, 0.0))
        .animate(CurvedAnimation(
            parent: _slideController, curve: Curves.decelerate));
    colorTween = ColorTween(begin: Color(0xFFDEE8F2), end: Color(0xFFA1B8CF))
        .animate(CurvedAnimation(
            parent: _slideController, curve: Curves.decelerate));
    super.initState();
  }

  @override
  void dispose() {
    _slideController.dispose();
    super.dispose();
  }

  void onSwitch() {
    if (isSwitched) {
      _slideController.reverse();
    } else {
      _slideController.forward();
    }
    setState(() {
      isSwitched = !isSwitched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 40,
          width: 80,
          padding: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xFFFFFFFF),
                  Color(0xFFCADAEC),
                ],
                transform: GradientRotation(pi / 3),
              ),
              borderRadius: BorderRadius.all(Radius.circular(_radius + 1))),
          child: AnimatedBuilder(
            animation: colorTween,
            builder: (BuildContext context, child) => Container(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color(0xFF3A5165)
                            .withOpacity(isSwitched ? 0.5 : 0.2)),
                    BoxShadow(
                      color: colorTween.value,
                      spreadRadius: -0.3,
                      blurRadius: 6,
                    ),
                  ],
                  // color: Color(0xFFDEE8F2),
                  borderRadius: BorderRadius.all(Radius.circular(_radius))),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: <Color>[
                    Color(0xFF48647D),
                    Color(0xFF6B8299),
                    Color(0xFFDAE2EB),
                    Color(0xFF8CA2B7),
                    Color(0xFFEDF2F7),
                  ],
                  stops: [0.0, 0.3, 0.8, 0.85, 0.95],
                  transform: GradientRotation(pi / 3),
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcIn,
              child: Icon(
                Icons.arrow_back_rounded,
              )),
        ),
        GestureDetector(
          onTap: onSwitch,
          child: SlideTransition(
            position: position,
            child: Padding(
              padding: const EdgeInsets.only(left: 41.5, top: 2.5),
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: Color(0xFFE3EDF7),
                    borderRadius: BorderRadius.all(Radius.circular(_radius)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Color(0xFF3A5165).withOpacity(0.2),
                          offset: Offset(isSwitched ? 2.0 : -2.0, 0.0),
                          blurRadius: 6),
                    ]),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return RadialGradient(
                          colors: <Color>[
                            Color(0xFFFFFFFF),
                            Color(0xFFB2C3D6),
                          ],
                          stops: [0.05, 1.0],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.srcIn,
                      child: Image.asset(
                        'assets/icons/dots.png',
                        height: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
