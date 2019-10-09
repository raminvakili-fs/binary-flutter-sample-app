import 'package:binary_mobile_app/model/contract_category.dart';
import 'package:binary_mobile_app/viewmodels/trade_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MatchDiffForm extends StatefulWidget {
  @override
  _MatchDiffFormState createState() => _MatchDiffFormState();
}

class _MatchDiffFormState extends State<MatchDiffForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int _duration = 5;

  String _durationUnit = 'days';

  int _lastDigitPrediction = 0;

  int _amount = 10;

  @override
  Widget build(BuildContext context) {
    var tradeViewModel = Provider.of<TradeViewModel>(context);

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ListView(
              padding: EdgeInsets.all(15.0),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Duration: '),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      flex: 1,
                      child: TextFormField(
                        initialValue: "5",
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Duration',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.0)))),
                        onSaved: (pN) {
                          _duration = int.parse(pN);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DropdownButton<String>(
                      value: _durationUnit,
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          _durationUnit = newValue;
                        });
                      },
                      items: <String>[
                        'ticks',
                        'seconds',
                        'minutes',
                        'hours',
                        'days'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Last Digit Prediction: '),
                    SizedBox(
                      width: 10,
                    ),
                    DropdownButton<int>(
                      value: _lastDigitPrediction,
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
                          _lastDigitPrediction = newValue;
                        });
                      },
                      items: <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
                          .map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text('$value'),
                        );
                      }).toList(),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('Payout: '),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      child: TextFormField(
                        initialValue: _amount.toString(),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'payout',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.0)))),
                        onSaved: (a) {
                          _amount = int.parse(a);
                        },
                      ),
                    ),
                  ],
                ),
                StreamBuilder(
                    stream: tradeViewModel.contractsTypeViewModel.selectedContractType,
                    builder: (context, AsyncSnapshot<ContractTypeItem> snapshot) {
                      if (snapshot.hasData) {
                        return FlatButton(
                          color: Colors.green,
                          highlightColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          onPressed: () {
                            //_getProposal(tradeViewModel, snapshot.data);
                          },
                          child: Text(
                            'get price',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }
                      return Container();
                    }),

              ],
            ),
          ),
        ],
      ),
    );
  }

//  _getProposal(
//      TradeViewModel viewModel, Available selectedAvailable) async {
//    if (_formKey.currentState.validate()) {
//      _formKey.currentState.save();
//      viewModel.priceProposalViewModel.getPriceForContract(
//        PriceProposalRequest(1,
//            subscribe: 1,
//            basis: 'payout',
//            amount: _amount,
//            barrier: '0',
//            contractType: selectedAvailable.contractType,
//            currency: 'USD',
//            durationUnit: _durationUnit.substring(0, 1),
//            duration: _duration,
//            proposal: 1,
//            symbol: selectedAvailable.underlyingSymbol),
//      );
//    }
//  }
}
