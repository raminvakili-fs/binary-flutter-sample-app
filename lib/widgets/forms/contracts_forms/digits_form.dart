import 'package:binary_mobile_app/model/serializable/categories/contract_type_form_classes.dart';
import 'package:binary_mobile_app/viewmodels/trade_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    final tradeViewModel = Provider.of<TradeViewModel>(context);

    return Form(
      key: _formKey,
      child: widget.contractItem.lastDigitRanges == null
          ? Container()
          : Row(
            children: <Widget>[
              Text('Last Digit Prediction'),
              SizedBox(width: 20,),
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
                    tradeViewModel.priceProposalViewModel.contractItem.add(widget.contractItem);
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
            ],
          )
    );
  }
}
