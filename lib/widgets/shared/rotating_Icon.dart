import 'package:flutter/material.dart';

class RotatingIcon extends StatefulWidget {
  final IconData icon;
  final Duration duration;

  const RotatingIcon({Key key, @required this.icon, this.duration = const Duration(seconds: 2)}) : super(key: key);

  @override
  _RotatingIconState createState() => _RotatingIconState();
}

class _RotatingIconState extends State<RotatingIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      child: IconButton(
          icon: Icon(widget.icon),
      ),
      builder: (context, child) {
        return Transform.rotate(
          child: child,
          angle: _animationController.value * 6.3,
        );
      },
      animation: _animationController,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
