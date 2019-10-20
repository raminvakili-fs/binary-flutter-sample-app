import 'package:binary_mobile_app/model/serializable/requests/contracts_for_symbol_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/active_symbols_response.dart';
import 'package:binary_mobile_app/blocs/trade_bloc.dart';
import 'package:binary_mobile_app/widgets/shared/binary_progress_indicator.dart';
import 'package:binary_mobile_app/widgets/shared/funky_overlay.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SymbolsListDialog extends StatelessWidget {
  final TradeBloc viewModel;

  const SymbolsListDialog({Key key, this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FunkyOverlay(
      child: StreamBuilder(
        stream: viewModel.symbolsViewModel.activeSymbols,
        builder: (BuildContext context,
            AsyncSnapshot<ActiveSymbolsResponse> response) {
          if (response != null && response.hasData) {
            ActiveSymbolsResponse activeSymbolsResponse = response.data;
            return Material(
              child: ListView.builder(
                itemCount: activeSymbolsResponse.activeSymbols.length,
                itemBuilder: (BuildContext context, int index) {

                  ActiveSymbols aS = activeSymbolsResponse.activeSymbols[index];

                  return ListTile(
                    title: Text(
                        aS.displayName),
                    onTap: (){
                      viewModel.forgetTickStream();
                      viewModel.symbolsViewModel.selectedSymbol.add(aS);
//                      viewModel.contractsTypeViewModel.getContractsForSymbol(ContractsForSymbolRequest(contractsFor: aS.symbol, productType: 'basic'));
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            );
          } else {
            return Center(child: BinaryProgressIndicator(elementsColor: Theme.of(context).accentColor, height: 20, width: 50,));
          }
        },
      ),
    );
  }
}
