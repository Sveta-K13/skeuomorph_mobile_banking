import 'package:flutter/material.dart';
import 'package:skeuomorph_mobile_banking/models/outcome.dart';
import 'package:skeuomorph_mobile_banking/theme.dart';

class CategoryCard extends StatelessWidget {
  final Outcome _outcome;

  CategoryCard(this._outcome);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(minWidth: MediaQuery.of(context).size.width - 64),
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      padding: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        boxShadow: skShadow,
        color: uiBgColor,
        borderRadius: boxBorderRadius,
      ),
      child: Container(
        padding: EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          borderRadius: boxBorderRadius,
          gradient: borderGradient,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: boxBorderRadius,
            color: uiBgColor,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    _outcome.icon,
                    height: 22,
                    color: textColor.withOpacity(0.8),
                  ),
                  Text(
                    _outcome.name,
                    style: TextStyle(
                      fontSize: 18,
                      color: textColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontFamily: fontFamily,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_outcome.percentage}%',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$ ${_outcome.sum}',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
