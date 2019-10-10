import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class BuyButton extends StatefulWidget {
  final Function onPressed;

  final Size buttonSize;

  const BuyButton(
      {Key key, @required this.onPressed, this.buttonSize = const Size(50, 20)})
      : super(key: key);

  @override
  _BuyButtonState createState() => _BuyButtonState();
}

class _BuyButtonState extends State<BuyButton>
    with SingleTickerProviderStateMixin {
  double arrowPos;
  AnimationController _animationController;
  Animation _arrowAnimation;

  @override
  void initState() {
    super.initState();

    arrowPos = widget.buttonSize.width / 2;

    _animationController = AnimationController(
      animationBehavior: AnimationBehavior.preserve,
        duration: Duration(seconds: 1),
        vsync: this,);

    _arrowAnimation = Tween<double>(begin: arrowPos, end: widget.buttonSize.width).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white12,
      onTap: () {
        print('Clicked');
        _animationController.forward();
      },
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) {
          return Container(
            width: widget.buttonSize.width,
            height: widget.buttonSize.height,
            child: Stack(
              children: <Widget>[
                CustomPaint(
                  painter: BuyButtonPainter(arrowPos: _arrowAnimation.value),
                  size: widget.buttonSize,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class BuyButtonPainter extends CustomPainter {
  final double arrowPos;

  BuyButtonPainter({@required this.arrowPos});

  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    double arrowWidth = width * 0.2;

    Path painPath = Path();
    Paint paint = Paint();

    painPath
      ..moveTo(arrowPos, 0)
      ..lineTo(width, 0)
      ..lineTo(width, height)
      ..lineTo(arrowPos, height)
      ..lineTo(arrowPos, 0);

    paint.color = Colors.yellow;

    canvas.drawPath(painPath, paint);

    painPath.reset();


    double arrowEnd = arrowPos + arrowWidth;

    painPath
      ..lineTo(arrowPos, 0)
      ..lineTo(arrowEnd < width ? arrowEnd : width, height / 2)
      ..lineTo(arrowPos, height)
      ..lineTo(0, height)
      ..lineTo(0, 0);
    paint..color = Colors.red;

    canvas.drawPath(painPath, paint);

    painPath.close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
