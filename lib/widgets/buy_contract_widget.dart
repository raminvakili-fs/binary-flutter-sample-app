import 'package:binary_mobile_app/model/serializable/requests/buy_contract_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/buy_contract_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/price_proposal_response.dart';
import 'package:binary_mobile_app/viewmodels/trade_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuyContractWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TradeViewModel>(
      builder: (context, model, child){
        return StreamBuilder(
          stream: model.priceProposalViewModel.isLoading,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data){
              return Container();
            }
            return Column (
              children: <Widget>[

                StreamBuilder(
                    stream: model.priceProposalViewModel.priceProposal,
                    builder: (BuildContext context,
                        AsyncSnapshot<PriceProposalResponse> snapshot) {

                      if (snapshot.hasData) {
                        if (snapshot.data.error == null){
                          return Text(
                              "Stake: \$${snapshot.data.proposal.askPrice}  Payout: \$${snapshot.data.proposal.payout}  Spot: ${snapshot.data.proposal.spot}");
                        } else {
                          return (Text(snapshot.data.error.message, style: TextStyle(color: Colors.pinkAccent),));
                        }
                      }
                      return Container();
                    }),

                StreamBuilder(
                    stream: model.priceProposalViewModel.priceProposal,
                    builder: (BuildContext context,
                        AsyncSnapshot<PriceProposalResponse> snapshot) {
                      if (snapshot != null && snapshot.hasData) {
                        if (snapshot.data.error == null) {
                          return FlatButton(
                            color: Colors.green,
                            highlightColor: Colors.blueGrey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            onPressed: () {
                              model.priceProposalViewModel.buyContract(BuyContractRequest(
                                  buy: snapshot.data.proposal.id,
                                  price: snapshot.data.proposal.askPrice));
                            },
                            child: Text('Purchase', style: TextStyle(color: Colors
                                .white),),
                          );
                        } else {
                          return Text(snapshot.data.error.message);
                        }
                      }
                      return Container();
                    }
                ),

                StreamBuilder(
                  stream: model.priceProposalViewModel.buyContractResponse,
                  builder: (BuildContext context, AsyncSnapshot<BuyContractResponse> snapshot) {
                    if (snapshot != null && snapshot.hasData) {
                      if (snapshot.data.error == null) {
                        return Text("payout: ${snapshot.data.buy
                            .payout} balanceAfter: ${snapshot.data.buy
                            .balanceAfter} buyPrice: ${snapshot.data.buy
                            .buyPrice}");
                      } else {
                        return Text(snapshot.data.error.message);
                      }
                    }
                    return Container();
                  },
                )

              ],
            );
          }
        );
      },
    );
  }
}
