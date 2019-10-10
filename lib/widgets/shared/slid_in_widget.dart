import 'package:flutter/material.dart';

class SlidInWidget extends StatefulWidget {
  final Widget child;

  final double startingVerticalOffset;

  const SlidInWidget(
      {Key key, @required this.child, this.startingVerticalOffset = 30})
      : super(key: key);

  @override
  _SlidInWidgetState createState() => _SlidInWidgetState();
}

class _SlidInWidgetState extends State<SlidInWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _slidAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(
          milliseconds: 1000,
        ),
        vsync: this);

    _slidAnimation = Tween<double>(begin: widget.startingVerticalOffset, end: 0)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.fastOutSlowIn));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget child) {
        return Transform.translate(
          child: widget.child,
          offset: Offset(0, _slidAnimation.value),
        );
      },
    );
  }
}
