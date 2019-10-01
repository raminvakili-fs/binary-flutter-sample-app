
import 'package:binary_mobile_app/model/serializable/responses/buy_contract_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/proposal_open_contract_response.dart';
import 'package:binary_mobile_app/util.dart';
import 'package:binary_mobile_app/viewmodels/trade_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OpenContractWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tradeViewModel = Provider.of<TradeScreenViewModel>(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder(
          stream: tradeViewModel.proposalOpenContractResponse,
          builder: (_, AsyncSnapshot<ProposalOpenContractResponse> snapshot){
            if (snapshot.hasData){
              var openContract = snapshot.data;
              print('${openContract.proposalOpenContract.displayName}');
              return Text('currentSpot: ${openContract.proposalOpenContract.currentSpot} \n '
                  'currentSpotTime: ${timeStampToDate(openContract.proposalOpenContract.currentSpotTime)}');
            }
            return Text('No open contract');
          },
        ),
      ),
    );
  }
}
