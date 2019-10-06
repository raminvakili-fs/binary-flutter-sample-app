import 'package:binary_mobile_app/model/contract_category.dart';
import 'package:binary_mobile_app/viewmodels/trade_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuyContractForm extends StatefulWidget {

  final ContractTypeItem contractTypeItem;

  const BuyContractForm({Key key, this.contractTypeItem}) : super(key: key);

  @override
  _BuyContractFormState createState() => _BuyContractFormState(contractTypeItem);

}

class _BuyContractFormState extends State<BuyContractForm> {

  final ContractTypeItem contractTypeItem;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _BuyContractFormState(this.contractTypeItem);


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
                contractTypeItem.createForm(),
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
                        initialValue: contractTypeItem.amount.toString(),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'payout',
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(2.0)))),
                        onSaved: (a) {
                          contractTypeItem.amount = double.parse(a);
                        },
                      ),
                    ),
                  ],
                ),

                StreamBuilder(
                    stream: tradeViewModel.contractsTypeViewModel.selectedAvailableContract,
                    builder: (context, AsyncSnapshot<ContractTypeItem> snapshot) {
                      if (snapshot.hasData) {
                        return FlatButton(
                          color: Colors.green,
                          highlightColor: Colors.blueGrey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          onPressed: () {
                            _getProposal(tradeViewModel, snapshot.data);
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

  _getProposal(
      TradeViewModel viewModel, ContractTypeItem contractTypeItem) async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      viewModel.priceProposalViewModel.getPriceForContract(
        contractTypeItem.createRequest()
      );
    }
  }
}