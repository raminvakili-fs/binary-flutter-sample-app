import 'package:binary_mobile_app/model/contract_type_form_classes.dart';
import 'package:flutter/material.dart';

class DigitsForm extends StatefulWidget {

  final DigitsContractItem contractItem;

  const DigitsForm({Key key, this.contractItem}) : super(key: key);

  @override
  _DigitsFormState createState() => _DigitsFormState();

}

class _DigitsFormState extends State<DigitsForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: widget.contractItem.lastDigitRanges == null ?
          Container() :
      DropdownButton<int>(
        value: widget.contractItem.selectedDigit,
        icon: Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (int newValue) {
          setState(() {
            widget.contractItem.selectedDigit = newValue;
          });
        },
        items: widget.contractItem.lastDigitRanges
            .map<DropdownMenuItem<int>>((int value) {
          return DropdownMenuItem<int>(
            value: value,
            child: Text('$value'),
          );
        }).toList(),
      ),
    );
  }

}
