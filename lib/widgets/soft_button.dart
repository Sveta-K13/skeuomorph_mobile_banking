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
        margin: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          boxShadow: skShadow,
          gradient: isTapped ? innerBoxGradient : null,
          color: uiBgColor,
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return iconGradient.createShader(bounds);
            },
            blendMode: BlendMode.srcIn,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
