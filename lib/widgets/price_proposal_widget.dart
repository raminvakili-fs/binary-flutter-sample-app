import 'package:binary_mobile_app/app_constants.dart';
import 'package:binary_mobile_app/model/serializable/responses/contracts_for_symbol_response.dart';
import 'package:binary_mobile_app/viewmodels/trade_screen_view_model.dart';
import 'package:binary_mobile_app/widgets/forms/higher_lower_form.dart';
import 'package:binary_mobile_app/widgets/forms/match_diff_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PriceProposalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TradeScreenViewModel>(
      builder: (ctx, model, child) {

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder(
                stream: model.selectedAvailableContract,
                builder: (BuildContext context, AsyncSnapshot<Available> selectedAvailable) {
                  if (selectedAvailable.hasData) {
                    switch (selectedAvailable.data.contractType){
                      case ContractType.CALL:
                      case ContractType.PUT:
                        return HigherLowerForm();
                        break;
                      case ContractType.CALLE:
                      case ContractType.PUTE:
                        return RiseFallForm();
                        break;

                      case ContractType.DIGITDIFF:
                      case ContractType.DIGITMATCH:
                        return MatchDiffForm();
                        break;
                    }

                    return Center(child: Text('The proper Form for this contract type is not been implemented yet!', textAlign: TextAlign.center,),);
                  }
                  return Container(
                    width: double.infinity,
                    height: 100,
                  );
                },
              ),
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
    return Center(child: Text('The proper Form for this contract type is not implemented yet!', textAlign: TextAlign.center,),);;
  }
}


