import 'package:binary_mobile_app/app_constants.dart';
import 'package:binary_mobile_app/model/contract_category.dart';
import 'package:binary_mobile_app/model/contract_type_form_classes.dart';
import 'package:binary_mobile_app/model/serializable/requests/buy_contract_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/price_proposal_response.dart';
import 'package:binary_mobile_app/viewmodels/trade_view_model.dart';
import 'package:binary_mobile_app/widgets/forms/contracts_forms/digits_form.dart';
import 'package:binary_mobile_app/widgets/shared/rotating_Icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuyContractForm extends StatefulWidget {
  final ContractTypeItem contractTypeItem;

  BuyContractForm({Key key, this.contractTypeItem}) : super(key: key) {
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

    if (widget.contractTypeItem is DigitsContractItem) {
      childForm = DigitsForm(
        contractItem: widget.contractTypeItem,
      );
    } else {
      childForm = Container();
    }

    _getProposal(tradeViewModel, widget.contractTypeItem);

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
                      child: Container(
                        height: 50,
                        child: TextFormField(
                          initialValue: "5",
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: 'Duration',
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Theme.of(context).accentColor, width: 1.0),
                                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              )),
                          onSaved: (pN) {
                            widget.contractTypeItem.duration = int.parse(pN);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DropdownButton<String>(
                      value: widget.contractTypeItem.durationUnit,
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
                          widget.contractTypeItem.durationUnit = newValue;
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

                childForm,

                // ********* A Form based on Symbol and Contract type

                SizedBox(height: 10,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    DropdownButton<String>(
                      value: widget.contractTypeItem.basis,
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
                          widget.contractTypeItem.basis = newValue;
                        });
                      },
                      items: <String>[
                        Basis.PAYOUT,
                        Basis.STAKE,
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 100,
                      height: 50,
                      child: TextFormField(
                        initialValue: widget.contractTypeItem.amount.toString(),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Amount',
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)))),
                        onSaved: (a) {
                          widget.contractTypeItem.amount = double.parse(a);
                        },
                      ),
                    ),

                    SizedBox(width: 20,),

                    StreamBuilder(
                        stream: tradeViewModel
                            .contractsTypeViewModel.selectedContractType,
                        builder:
                            (context, AsyncSnapshot<ContractTypeItem> snapshot) {
                          if (snapshot.hasData) {
                            return StreamBuilder(
                              stream: tradeViewModel.priceProposalViewModel.isLoading,
                              builder: (_, snapshot) {
                                if(snapshot.hasData) {
                                  if (snapshot.data) {
                                    return RotatingIcon(
                                      icon: Icons.refresh,
                                    );
                                  }
                                  return IconButton(
                                    color: Theme.of(context).accentColor,
                                    icon: Icon(Icons.refresh),
                                    onPressed: (){
                                      _getProposal(tradeViewModel, snapshot.data);
                                    },
                                  );
                                }
                                return Container();
                              },
                            );
                          }
                          return Container();
                        }),

                  ],
                ),

                SizedBox(height: 20,),

                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: StreamBuilder(
                        stream: tradeViewModel
                            .priceProposalViewModel.priceProposalTop,
                        builder:
                            (_, AsyncSnapshot<PriceProposalResponse> snapshot) {
                          if (snapshot.hasData && snapshot.data.error == null) {
                            return Column(
                              children: <Widget>[
                                FlatButton(
                                  color: Colors.green,
                                  highlightColor: Colors.blueGrey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                  onPressed: () {
                                    tradeViewModel.priceProposalViewModel.buyContract(
                                        BuyContractRequest(
                                            buy: snapshot.data.proposal.id,
                                            price: snapshot.data.proposal.askPrice));
                                  },
                                  child: Text(
                                    widget.contractTypeItem.top,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ),
                                Text(
                                    'stake: \$${snapshot.data.proposal.askPrice}\npayout: \$${snapshot.data.proposal.payout}', textAlign: TextAlign.center, style: TextStyle(fontSize: 10),)
                              ],
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: StreamBuilder(
                        stream: tradeViewModel
                            .priceProposalViewModel.priceProposalBottom,
                        builder:
                            (_, AsyncSnapshot<PriceProposalResponse> snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.error == null) {
                              return Column(
                                children: <Widget>[
                                  FlatButton(
                                    color: Colors.redAccent,
                                    highlightColor: Colors.blueGrey,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            5.0)),
                                    onPressed: () {
                                      tradeViewModel.priceProposalViewModel
                                          .buyContract(
                                          BuyContractRequest(
                                              buy: snapshot.data.proposal.id,
                                              price: snapshot.data.proposal
                                                  .askPrice));
                                    },
                                    child: Text(
                                      widget.contractTypeItem.bottom,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ),
                                  Text(
                                      'stake: \$${snapshot.data.proposal.askPrice}\npayout: \$${snapshot.data.proposal.payout}', textAlign: TextAlign.center, style: TextStyle(fontSize: 10),)
                                ],
                              );
                            } else {
                              return Container(width: double.infinity, child: Center(child: Text('${snapshot.data.error.message}', textAlign:TextAlign.center, style: TextStyle(fontSize: 10),)));
                            }
                          }
                          return Container();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getProposal(TradeViewModel viewModel, ContractTypeItem contractTypeItem) async {
    if (_formKey.currentState != null && _formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
    viewModel.priceProposalViewModel.contractItem.add(contractTypeItem);

  }
}
