import 'package:binary_mobile_app/viewmodels/trade_screen_view_model.dart';
import 'package:binary_mobile_app/widgets/forms/higher_lower_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PriceProposalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TradeScreenViewModel>(
      builder: (ctx, model, child) {

        return Padding(
          padding: const EdgeInsets.all(20.0),
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
            child: StreamBuilder(
              stream: model.selectedContractCategory,
              builder: (context, contractTypeSnapShot) {
                if (contractTypeSnapShot.hasData) {
                  switch (contractTypeSnapShot.data){
                    case 'callput':
                      return HigherLowerForm();
                      break;
                    case 'callputequal':
                      return RiseFallForm();
                      break;
                  }

                  return Container();
                }
                return Container(
                  width: 100,
                  height: 100,
                );
              },
            ),
          ),
        );
      },
    );
  }
}


class RiseFallForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}


