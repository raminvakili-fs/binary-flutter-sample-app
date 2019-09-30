
import 'package:binary_mobile_app/viewmodels/trade_screen_view_model.dart';
import 'package:binary_mobile_app/views/contracts_type_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContractsTypeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var tradeViewModel = Provider.of<TradeScreenViewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          showDialog(context: context, builder: (context) => ContractsTypeDialog(viewModel: tradeViewModel,));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(
                color: Colors.blueGrey,
                width: 1.0,
              )),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Contracts type"),
              ),
              Icon(Icons.keyboard_arrow_down)
            ],
          ),
        ),
      ),
    );
  }
}
