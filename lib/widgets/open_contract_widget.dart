
import 'package:binary_mobile_app/model/serializable/responses/proposal_open_contract_response.dart';
import 'package:binary_mobile_app/util.dart';
import 'package:binary_mobile_app/viewmodels/trade_view_model.dart';
import 'package:binary_mobile_app/widgets/buy_contract_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OpenContractWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tradeViewModel = Provider.of<TradeViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white30,
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            border: Border.all(
              color: Colors.blueGrey,
              width: 1.0,
            )),
        child: Column(
          children: <Widget>[
            BuyContractWidget(),
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
                      var openContract = snapshot.data;
                      return Text('currentSpot: ${openContract.proposalOpenContract?.currentSpot}\n'
                          'currentSpotTime: ${timeStampToDate(openContract.proposalOpenContract?.currentSpotTime)}');
                    }
                    return Center(child: Text('No open contract'));
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
