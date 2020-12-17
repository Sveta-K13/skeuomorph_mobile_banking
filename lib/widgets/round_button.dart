import 'package:flutter/material.dart';
import 'package:skeuomorph_mobile_banking/constraints.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black,
        gradient: linearGradient,
        boxShadow: [
          BoxShadow(
            offset: Offset(-4, 0),
            blurRadius: 8,
            color: Color(0xFFC3C8CD).withOpacity(0.05),
          ),
          BoxShadow(
            offset: Offset(4, 2),
            blurRadius: 18,
            color: Colors.black.withOpacity(0.6),
          ),
        ],
      ),
      child: Icon(
        Icons.arrow_forward_ios,
        color: Color(0xFF6D737A),
        size: 18,
      ),
    );
  }
}
