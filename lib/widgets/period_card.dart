import 'package:flutter/material.dart';
import 'package:skeuomorph_mobile_banking/theme.dart';
import 'package:skeuomorph_mobile_banking/widgets/soft_button.dart';

class PeriodCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        constraints: BoxConstraints(minHeight: 64.0),
        margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: AppTheme.boxBorderRadius,
            boxShadow: AppTheme.outerShadow),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Period:',
                style: TextStyle(
                   color: Theme.of(context).accentColor.withOpacity(0.6),
                  fontSize: 18,
                ),
              ),
            ),
            Text(
              'Last 30 days',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 18,
              ),
            ),
            Expanded(child: Container()),
            SoftButton(),
          ],
        ),
      ),
    );
  }
}
