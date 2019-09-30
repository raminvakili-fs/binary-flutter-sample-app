import 'package:binary_mobile_app/app_constants.dart';
import 'package:binary_mobile_app/model/serializable/requests/price_proposal_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/price_proposal_response.dart';
import 'package:binary_mobile_app/viewmodels/trade_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HigherLowerForm extends StatefulWidget {
  @override
  _HigherLowerFormState createState() => _HigherLowerFormState();
}

class _HigherLowerFormState extends State<HigherLowerForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int _duration = 5;

  String _durationUnit = 'days';

  int _amount = 10;

  String _barrier = "10";


  @override
  Widget build(BuildContext context) {
    var tradeViewModel = Provider.of<TradeScreenViewModel>(context);

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
                      items: <String>['ticks', 'seconds', 'minutes', 'hours', 'days']
                          .map<DropdownMenuItem<String>>((String value) {
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
                    Text('Barrier Offset: '),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      child: TextFormField(
                        initialValue: _barrier,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Offset',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.0)))),
                        onSaved: (b) {
                          _barrier = b;
                        },
                      ),
                    ),
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
                FlatButton(
                  color: Colors.green,
                  highlightColor: Colors.blueGrey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  onPressed: (){
                   _loadProposal(tradeViewModel);
                  },
                  child: Text(
                    'get price',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                StreamBuilder(
                    stream: tradeViewModel.priceProposal,
                    builder: (BuildContext context,
                        AsyncSnapshot<PriceProposalResponse> snapshot) {
                      if (snapshot.hasData) {
                        return Text(
                            "${snapshot.data.proposal.askPrice}  ${snapshot.data.proposal.payout}");
                      }
                      return Container();
                    })
              ],
            ),
          ),
        ],
      ),
    );

  }

  _loadProposal(TradeScreenViewModel viewModel) async{
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      viewModel.getPriceForContract(
        PriceProposalRequest(
            1,
            subscribe: 1,
            basis: 'payout',
            amount: _amount,
            barrier: _barrier,
            contractType: ContractType.CALL,
            currency: 'USD',
            durationUnit: _durationUnit.substring(0, 1),
            duration: _duration,
            proposal: 1,
            symbol: 'frxAUDJPY'
        ),
      );
    }
  }

}
