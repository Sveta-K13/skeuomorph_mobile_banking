import 'package:flutter/material.dart';

class SkButton extends StatefulWidget {
  final Widget child;
  final Widget pressedChild;

  const SkButton({Key key, this.pressedChild, this.child})
      : assert(child != null),
        assert(pressedChild != null),
        super(key: key);

  @override
  _SkButtonState createState() => _SkButtonState();
}

class _SkButtonState extends State<SkButton> {
  bool isPressed;

  @override
  void initState() {
    isPressed = false;
    super.initState();
  }

  void _pressButton() {
    setState(() {
      isPressed = !isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.15;
    final pressedButton = Container(
      width: width,
      height: width,
      padding: EdgeInsets.all(1.5),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(17),
        gradient: LinearGradient(
          begin: Alignment(-3, -2),
          end: Alignment(5, 1),
          colors: [
            Color(0xFFC8D5E1).withOpacity(1.0),
            Colors.black.withOpacity(0),
          ],
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.center,
            colors: [
              Color(0xFF2C333A),
              Color(0xFF121416),
            ],
          ),
        ),
        child: widget.pressedChild,
      ),
    );
    final defaultButton = Container(
      width: width,
      height: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF32383E),
            Color(0xFF17191C),
          ],
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(-4, -2),
            blurRadius: 16,
            color: Color(0xFFC3C8CD).withOpacity(0.09),
          ),
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 18,
            color: Colors.black.withOpacity(0.5),
          ),
        ],
      ),
      child: widget.child,
    );
    return GestureDetector(
      onTap: () => _pressButton(),
      child: AnimatedCrossFade(
        duration: Duration(milliseconds: 70),
        crossFadeState:
            isPressed ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        firstChild: pressedButton,
        secondChild: defaultButton,
      ),
    );
  }
}
