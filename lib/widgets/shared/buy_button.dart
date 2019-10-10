import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class BuyButton extends StatefulWidget {
  final Function onPressed;

  final Size buttonSize;
  final Duration animationDuration;
  final Color backgroundColor;
  final Color arrowColor;

  const BuyButton(
      {Key key,
      @required this.onPressed,
      this.buttonSize = const Size(100, 20),
      this.animationDuration = const Duration(milliseconds: 300),
      this.backgroundColor = Colors.lightGreen,
      this.arrowColor = Colors.green})
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
      duration: widget.animationDuration,
      vsync: this,
    );

    _arrowAnimation =
        Tween<double>(begin: arrowPos, end: widget.buttonSize.width)
            .animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));

    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        _animationController.reverse();
      }
    });
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
          return ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5.0),
              topRight: Radius.circular(5.0),
              bottomRight: Radius.circular(5.0),
            ),
            child: Container(
              width: widget.buttonSize.width,
              height: widget.buttonSize.height,
              child: Stack(
                children: <Widget>[
                  CustomPaint(
                    painter: BuyButtonPainter(
                      arrowPos: _arrowAnimation.value,
                      arrowColor: widget.arrowColor,
                      backgroundColor: widget.backgroundColor,
                    ),
                    size: widget.buttonSize,
                  )
                ],
              ),
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

  final Color backgroundColor;
  final Color arrowColor;

  BuyButtonPainter(
      {@required this.backgroundColor,
      @required this.arrowColor,
      @required this.arrowPos});

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

    paint.color = backgroundColor;

    canvas.drawPath(painPath, paint);

    painPath.reset();

    double arrowEnd = arrowPos + arrowWidth;

    painPath
      ..lineTo(arrowPos, 0)
      ..lineTo(arrowEnd < width ? arrowEnd : width, height / 2)
      ..lineTo(arrowPos, height)
      ..lineTo(0, height)
      ..lineTo(0, 0);

    paint..color = arrowColor;

    canvas.drawPath(painPath, paint);

    painPath.close();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
