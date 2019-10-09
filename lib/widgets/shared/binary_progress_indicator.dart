import 'package:binary_mobile_app/widgets/shared/collection_transition.dart';
import 'package:flutter/material.dart';

class BinaryProgressIndicator extends StatefulWidget {

  final Color elementsColor;
  final double width;
  final double height;

  const BinaryProgressIndicator({Key key, this.elementsColor = Colors.blue, this.width = 100.0, this.height = 50.0}) : super(key: key);

  @override
  _BinaryProgressIndicatorState createState() => _BinaryProgressIndicatorState();

}

class _BinaryProgressIndicatorState extends State<BinaryProgressIndicator> {

   var elementWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      child: CollectionScaleTransition(
        end: 1.5,
        children: <Widget>[
          _buildElement(),
          _buildElement(),
          _buildElement(),
          _buildElement(),
        ],
      ),
    );
  }



  _buildElement(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        width: widget.width / 12,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.elementsColor,
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
      ),
    );
  }
}
