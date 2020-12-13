import 'package:flutter/material.dart';
import 'package:skeuomorph_mobile_banking/theme.dart';
import 'package:skeuomorph_mobile_banking/widgets/soft_button.dart';

class PeriodCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 64.0),
      margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      decoration: BoxDecoration(
          color: Color(0xFFEDF2F8),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          boxShadow: skShadow),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Period:',
              style: TextStyle(
                color: textColor.withOpacity(0.6),
                fontFamily: fontFamily,
                fontSize: 18,
              ),
            ),
          ),
          Text(
            'Last 30 days',
            style: TextStyle(
                color: textColor, fontFamily: fontFamily, fontSize: 18),
          ),
          Expanded(child: Container()),
          SoftButton(),
        ],
      ),
    );
  }
}
