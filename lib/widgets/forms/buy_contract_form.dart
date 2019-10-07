import 'package:binary_mobile_app/model/contract_category.dart';
import 'package:binary_mobile_app/model/contract_type_form_classes.dart';
import 'package:binary_mobile_app/model/serializable/responses/price_proposal_response.dart';
import 'package:binary_mobile_app/viewmodels/trade_view_model.dart';
import 'package:binary_mobile_app/widgets/forms/digits_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuyContractForm extends StatefulWidget {

  final ContractTypeItem contractTypeItem;

  BuyContractForm({Key key, this.contractTypeItem}) : super(key: key){
    print("");
  }

  @override
  _BuyContractFormState createState() => _BuyContractFormState();

}

class _BuyContractFormState extends State<BuyContractForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var tradeViewModel = Provider.of<TradeViewModel>(context);

    Widget childForm;

    if (widget.contractTypeItem is DigitsContractItem){
      childForm = DigitsForm(contractItem: widget.contractTypeItem,);
    } else {
      childForm = Container();
    }

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ListView(
              padding: EdgeInsets.all(15.0),
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),

                childForm,

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
                        initialValue: widget.contractTypeItem.amount.toString(),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'payout',
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(2.0)))),
                        onSaved: (a) {
                          widget.contractTypeItem.amount = double.parse(a);
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

                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: StreamBuilder(
                        stream: tradeViewModel.priceProposalViewModel.priceProposalTop,
                          builder: (_, AsyncSnapshot<PriceProposalResponse> snapshot) {
                            if (snapshot.hasData) {
                              return FlatButton(
                                color: Colors.green,
                                highlightColor: Colors.blueGrey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                onPressed: () {

                                },
                                child: Text(
                                  widget.contractTypeItem.top,
                                  style: TextStyle(color: Colors.white, fontSize: 10),
                                ),
                              );
                            }
                            return Container();
                          },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: StreamBuilder(
                        stream: tradeViewModel.priceProposalViewModel.priceProposalBottom,
                        builder: (_, AsyncSnapshot<PriceProposalResponse> snapshot) {
                          if (snapshot.hasData) {
                            return FlatButton(
                              color: Colors.green,
                              highlightColor: Colors.blueGrey,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0)),
                              onPressed: () {

                              },
                              child: Text(
                                widget.contractTypeItem.bottom,
                                style: TextStyle(color: Colors.white, fontSize: 10),
                              ),
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                  ],
                )

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
      viewModel.priceProposalViewModel.getPriceForContractTop(
        contractTypeItem.createRequest(Position.TOP)
      );

      viewModel.priceProposalViewModel.getPriceForContractBottom(
          contractTypeItem.createRequest(Position.BOTTOM)
      );

    }
  }
}