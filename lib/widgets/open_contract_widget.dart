
import 'package:binary_mobile_app/model/serializable/responses/proposal_open_contract_response.dart';
import 'package:binary_mobile_app/util.dart';
import 'package:binary_mobile_app/viewmodels/trade_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OpenContractWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tradeViewModel = Provider.of<TradeViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              //BuyContractWidget(),
              StreamBuilder(
                stream: tradeViewModel.openContractViewModel.isLoading,
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data){
                    return Container();
                  }
                  return StreamBuilder(
                    stream: tradeViewModel.openContractViewModel.proposalOpenContractResponse,
                    builder: (_, AsyncSnapshot<ProposalOpenContractResponse> snapshot){
                      if (snapshot.hasData){
                        if (snapshot.data.error == null) {
                          var openContract = snapshot.data;
                          return Container(
                            width: double.infinity,
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Text('entrySpot: ${openContract.proposalOpenContract?.entrySpotDisplayValue}\n'
                                      'currentSpot: ${openContract.proposalOpenContract?.currentSpotDisplayValue}\n', textAlign: TextAlign.center, style: TextStyle(fontSize: 10),),
                                  openContract.proposalOpenContract.exitTickDisplayValue == null ? Container() : Text('exitSpot: ${openContract.proposalOpenContract?.exitTickDisplayValue}', textAlign: TextAlign.center, style: TextStyle(fontSize: 10),),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Center(child: Text('${snapshot.data.error.message}'));
                        }
                      }
                      return Center(child: Text('No open contract'));
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
