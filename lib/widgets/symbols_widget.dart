import 'package:binary_mobile_app/model/serializable/requests/active_symbols_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/active_symbols_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/tick_stream_response.dart';
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
          child: Stack(
            children: <Widget>[
              Center(
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
                                  if (selectedSymbol.hasData) {
                                    sL = selectedSymbol.data;
                                  } else if (snapshot
                                          .data.activeSymbols.length >
                                      0) {
                                    sL = snapshot.data.activeSymbols[0];
                                  } else {
                                    return Text('No Active Symbol');
                                  }
                                  return Text(
                                      "${sL.marketDisplayName} \n${sL.displayName}",
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: StreamBuilder(
                      stream: tradeScreenViewModel.tickStream,
                      builder: (context,
                          AsyncSnapshot<TickStreamResponse> snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                              color: Colors.lightGreen,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text('${snapshot.data.tick.ask.toStringAsFixed(5)}'),
                              ));
                        }
                        return Container(
                          width: 10,
                          height: 10,
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
