import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skeuomorph_mobile_banking/theme.dart';

class CurveButton extends StatelessWidget {
  final bool isPressed;
  final String iconBorder;
  final String icon;

  CurveButton(this.isPressed, this.iconBorder, this.icon);

  Widget _buildUntappedButton() {
    return Container(
      margin: EdgeInsets.all(8.0),
      height: 64,
      width: 64,
      decoration: BoxDecoration(
        borderRadius: boxBorderRadius,
        color: uiBgColor,
        boxShadow: skShadow,
      ),
      child: Center(
        child: ShaderMask(
            shaderCallback: (Rect bound) {
              return iconGradient.createShader(bound);
            },
            blendMode: BlendMode.srcIn,
            child: Image.asset(
              iconBorder,
              height: 24,
            )),
      ),
    );
  }

  Widget _buildTappedButton() {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(1.0),
      height: 64,
      width: 64,
      decoration: BoxDecoration(
        borderRadius: boxBorderRadius,
        gradient: rotatedBorderGradient,
      ),
      child: Container(
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: boxBorderRadius,
          color: uiBgColor,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: boxBorderRadius,
            gradient: innerBoxGradient,
          ),
          child: Center(
            child: Stack(
              children: [
                ShaderMask(
                    shaderCallback: (Rect bound) {
                      return LinearGradient(
                        colors: <Color>[
                          Color(0xFF5F83AD),
                          Color(0xFFDEE9F3),
                        ],
                        transform: GradientRotation(pi / 4),
                        stops: [0.35, 1.25],
                      ).createShader(bound);
                    },
                    blendMode: BlendMode.srcIn,
                    child: Image.asset(
                      icon,
                      height: 24,
                    )),
                ShaderMask(
                    shaderCallback: (Rect bound) {
                      return borderGradient.createShader(bound);
                    },
                    blendMode: BlendMode.srcIn,
                    child: Image.asset(
                      iconBorder,
                      height: 24,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isPressed ? _buildTappedButton() : _buildUntappedButton();
  }
}
