import 'package:flutter/material.dart';

class RotatingIcon extends StatefulWidget {
  final IconData icon;
  final Duration duration;
  final Function onPressed;

  final Stream<bool> loadingStream;

  const RotatingIcon({Key key, @required this.icon, this.duration = const Duration(seconds: 2), this.loadingStream, @required this.onPressed}) : super(key: key);

  @override
  _RotatingIconState createState() => _RotatingIconState();
}

class _RotatingIconState extends State<RotatingIcon>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  double _angle = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animationController.addListener((){
      setState(() {
        _angle = _animationController.value * 6.3;
      });
    });

    widget.loadingStream.listen((loading){
      if (loading){
        _animationController.repeat();
      } else {
        _animationController.stop();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      child: IconButton(
        icon: Icon(widget.icon), onPressed: () {
          widget.onPressed();
      },
      ),
      angle: _angle,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}