import 'package:binary_mobile_app/model/serializable/responses/contracts_for_symbol_response.dart';
import 'package:binary_mobile_app/viewmodels/trade_screen_view_model.dart';
import 'package:binary_mobile_app/widgets/funky_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContractsTypeDialog extends StatelessWidget {
  final TradeScreenViewModel viewModel;

  const ContractsTypeDialog({Key key, this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FunkyOverlay(
      child: StreamBuilder(
        stream: viewModel.contractsTypeViewModel.contractsForSymbolResponse,
        builder: (BuildContext context,
            AsyncSnapshot<ContractsForSymbolResponse> response) {
          if (response != null && response.hasData) {
            ContractsForSymbolResponse contractsForSymbolResponse = response.data;

            return Material(
              child: ListView.builder(
                itemCount: contractsForSymbolResponse.contractsFor.available.length,
                itemBuilder: (BuildContext context, int index) {

                  Available availableContract = contractsForSymbolResponse.contractsFor.available[index];

                  return ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("${availableContract.contractCategory} - ${availableContract.contractCategoryDisplay} - ${availableContract.contractDisplay}"),
                        Text("${availableContract.contractType} - ${availableContract.underlyingSymbol}"),
                      ],
                    ),
                    onTap: (){
                      viewModel.selectedAvailableContract.add(availableContract);
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
