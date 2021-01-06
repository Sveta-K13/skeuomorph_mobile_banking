import 'package:flutter/material.dart';
import 'package:skeuomorph_mobile_banking/theme.dart';

class CurveUntappedButton extends StatelessWidget {
  final String iconBorder;

  CurveUntappedButton(this.iconBorder);

  Widget _buildUntappedButton(Color uiBgColor) {
    return Container(
      margin: EdgeInsets.all(8.0),
      height: 64,
      width: 64,
      decoration: BoxDecoration(
        borderRadius: AppTheme.boxBorderRadius,
        color: uiBgColor,
        boxShadow: AppTheme.outerShadow,
      ),
      child: Center(
        child: ShaderMask(
            shaderCallback: (Rect bound) {
              return AppTheme.iconGradient.createShader(bound);
            },
            blendMode: BlendMode.srcIn,
            child: Image.asset(
              iconBorder,
              height: 24,
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildUntappedButton(Theme.of(context).primaryColor);
  }
}

class CurveTappedButton extends StatelessWidget {
  final String iconBorder;
  final String icon;

  CurveTappedButton(this.iconBorder, this.icon);

  Widget _buildTappedButton(Color uiBgColor) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(1.0),
      height: 64,
      width: 64,
      decoration: BoxDecoration(
        borderRadius: AppTheme.boxBorderRadius,
        gradient: AppTheme.rotatedBorderGradient,
      ),
      child: Container(
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: AppTheme.boxBorderRadius,
          color: uiBgColor,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: AppTheme.boxBorderRadius,
            gradient: AppTheme.innerBoxGradient,
          ),
          child: Center(
            child: Stack(
              children: [
                ShaderMask(
                    shaderCallback: (Rect bound) {
                      return AppTheme.innerIconGradient.createShader(bound);
                    },
                    blendMode: BlendMode.srcIn,
                    child: Image.asset(
                      icon,
                      height: 24,
                    )),
                ShaderMask(
                    shaderCallback: (Rect bound) {
                      return AppTheme.borderGradient.createShader(bound);
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
    return _buildTappedButton(Theme.of(context).primaryColor);
  }
}
