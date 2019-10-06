import 'package:binary_mobile_app/model/contract_category.dart';
import 'package:binary_mobile_app/viewmodels/trade_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PriceProposalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TradeViewModel>(
      builder: (ctx, model, child) {

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder(
                stream: model.contractsTypeViewModel.selectedAvailableContract,
                builder: (BuildContext context, AsyncSnapshot<ContractTypeItem> selectedAvailable) {
                  if (selectedAvailable.hasData) {
                    return Container(width: double.infinity, child: _matchProperForm(selectedAvailable.data));
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

  Widget _matchProperForm(ContractTypeItem contractTypeItem) {
    return contractTypeItem.createForm();
  }
}


class RiseFallForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('The proper Form for this contract type is not implemented yet!', textAlign: TextAlign.center,),);;
  }
}


/*



 */

