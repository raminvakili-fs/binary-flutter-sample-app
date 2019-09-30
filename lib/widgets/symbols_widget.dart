import 'package:binary_mobile_app/model/serializable/requests/active_symbols_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/active_symbols_response.dart';
import 'package:binary_mobile_app/viewmodels/trade_screen_view_model.dart';
import 'package:binary_mobile_app/widgets/symbols_list_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SymbolsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tradeScreenViewModel = Provider.of<TradeScreenViewModel>(context);

    tradeScreenViewModel.getActiveSymbols(ActiveSymbolsRequest(
      reqId: this.hashCode,
      activeSymbols: 'brief',
      productType: 'basic',
    ));

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return SymbolsListDialog(
                  viewModel: tradeScreenViewModel,
                );
              });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 600),
          decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(
                color: Colors.blueGrey,
                width: 1.0,
              )),
          curve: ElasticInOutCurve(),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: StreamBuilder(
                    stream: tradeScreenViewModel.activeSymbols,
                    builder: (BuildContext context,
                        AsyncSnapshot<ActiveSymbolsResponse> snapshot) {
                      if (snapshot != null && snapshot.hasData) {
                        return StreamBuilder(
                          stream: tradeScreenViewModel.selectedSymbol,
                          builder: (_, selectedSymbol) {
                            ActiveSymbols sL;
                            if (selectedSymbol != null && selectedSymbol.hasData) {
                              sL = selectedSymbol.data;
                            }

                            return Text(
                                "${snapshot.data.activeSymbols[0].marketDisplayName} \n${snapshot.data.activeSymbols[0].displayName}",
                                style: TextStyle(
                                fontSize: 12,
                            ));
                          },
                        );
                      } else {
                        return Container(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
              Icon(Icons.keyboard_arrow_down)
            ],
          ),
        ),
      ),
    );
  }
}
