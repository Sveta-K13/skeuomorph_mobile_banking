import 'package:flutter/material.dart';
import 'package:skeuomorph_mobile_banking/widgets/inner_shadow.dart';

class SwipeButton extends StatefulWidget {
  @override
  _SwipeButtonState createState() => _SwipeButtonState();
}

class _SwipeButtonState extends State<SwipeButton> {
  bool left;

  @override
  void initState() {
    left = false;
    super.initState();
  }

  void _swipe() {
    setState(() {
      left = !left;
    });
  }

  @override
  Widget build(BuildContext context) {
    final background = Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment(-7, -5),
          end: Alignment(5, 5),
          colors: [
            Color(0xFFC8D5E1).withOpacity(1.0),
            Colors.black.withOpacity(0),
          ],
        ),
      ),
      child: InnerShadow(
        blur: 8,
        color: Colors.black.withOpacity(0.6),
        offset: Offset(2, 2),
        child: Container(
          width: 82,
          height: 42,
          decoration: BoxDecoration(
            color: Color(0xFF131416),
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              // begin: Alignment(-8, -8),
              // end: Alignment(1, 1),
              begin: Alignment(-15, -15),
              end: Alignment(0.5, 0.5),
              colors: [
                Color(0xFF6D7883),
                Color(0xFF1E2328),
              ],
            ),
          ),
        ),
      ),
    );

    return GestureDetector(
      onTap: () => _swipe(),
      child: Stack(
        children: [
          background,
          Positioned(
            top: 17,
            left: 15,
            child: Image.asset(
              'assets/images/arrow_back.png',
            ),
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
            left: left ? 3 : 41,
            top: 3,
            child: Trigger(),
          ),
        ],
      ),
    );
  }
}

class Trigger extends StatelessWidget {
  final width = 39.0;

  @override
  Widget build(BuildContext context) {
    return InnerShadow(
      offset: Offset(0, -1),
      blur: 1,
      color: Color(0xFF181A1D),
      child: Container(
        width: 39,
        height: 39,
        decoration: BoxDecoration(
          color: Color(0xFF272B30),
          borderRadius: BorderRadius.circular(11),
          boxShadow: [
            BoxShadow(
              offset: Offset(-4, -4),
              blurRadius: 16,
              color: Color(0xFFFFFFFF).withOpacity(0.01),
            ),
            BoxShadow(
              offset: Offset(5, 2),
              blurRadius: 16,
              color: Color(0xFF2C3034).withOpacity(0.01),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCircle(),
                  _buildCircle(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildCircle(),
                  _buildCircle(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircle() {
    return Container(
      width: 6,
      height: 6,
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        gradient: LinearGradient(
          colors: [
            Color(0xFF798188),
            Color(0xFF1F2328),
          ],
        ),
      ),
    );
  }
}
