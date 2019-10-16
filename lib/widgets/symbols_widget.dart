import 'dart:collection';

import 'package:binary_mobile_app/model/serializable/responses/active_symbols_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/tick_stream_response.dart';
import 'package:binary_mobile_app/viewmodels/trade_view_model.dart';
import 'package:binary_mobile_app/widgets/shared/binary_progress_indicator.dart';
import 'package:binary_mobile_app/widgets/symbols_list_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:provider/provider.dart';

class SymbolsWidget extends StatefulWidget {


  @override
  _SymbolsWidgetState createState() => _SymbolsWidgetState();


}

class _SymbolsWidgetState extends State<SymbolsWidget> {

  final tickStreamValues = Queue<double>();

  @override
  Widget build(BuildContext context) {
    var tradeScreenViewModel = Provider.of<TradeViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
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
          child: Stack(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: StreamBuilder(
                      stream: tradeScreenViewModel.symbolsViewModel.activeSymbols,
                      builder: (BuildContext context,
                          AsyncSnapshot<ActiveSymbolsResponse> snapshot) {
                        if (snapshot != null && snapshot.hasData) {
                          return StreamBuilder(
                            stream: tradeScreenViewModel.symbolsViewModel.selectedSymbol,
                            builder: (_, selectedSymbol) {
                              ActiveSymbols sL;
                              if (selectedSymbol.hasData) {
                                sL = selectedSymbol.data;
                              } else if (snapshot
                                      .data.activeSymbols.length >
                                  0) {
                                sL = snapshot.data.activeSymbols[0];
                              } else {
                                return Text('No Active Symbol', style: TextStyle(fontSize: 12),);
                              }
                              return Column(
                                children: <Widget>[
                                  Text("${sL.marketDisplayName}", style: TextStyle(fontSize: 12,), textAlign: TextAlign.center,),
                                  Text("${sL.displayName}", style: TextStyle(fontSize: 12,), textAlign: TextAlign.center,),
                                ],
                              );
                            },
                          );
                        } else {
                          return Center(child: BinaryProgressIndicator(elementsColor: Theme.of(context).accentColor, height: 15, width: 30,));
                        }
                      }),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Flexible(
                        child: StreamBuilder(
                            stream: tradeScreenViewModel.symbolsViewModel.tickStream,
                            builder: (context,
                                AsyncSnapshot<TickStreamResponse> snapshot) {
                              if (snapshot.hasData) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.lightGreen,
                                  ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: snapshot.data.error == null ?
                                        Text('${snapshot.data.tick?.ask?.toStringAsFixed(5)}') :
                                        Text('${snapshot.data.error.message}', style: TextStyle(fontSize: 9,),),
                                    ));
                              }
                              return Text("...");
                            }),
                      ),
                      Icon(Icons.keyboard_arrow_down)
                    ],
                  ),
                ),
              ),

              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StreamBuilder(
                      stream: tradeScreenViewModel.symbolsViewModel.tickStream,
                      builder: (context,
                          AsyncSnapshot<TickStreamResponse> snapshot) {
                        if (snapshot.hasData) {

                          tickStreamValues.add(snapshot.data.tick.ask);

                          if (tickStreamValues.length > 15) {
                            tickStreamValues.removeFirst();
                          }

                          return Container(
                            width: 30,
                            height: 30,
                            child: Sparkline(
                              data: tickStreamValues.toList(),
                              pointsMode: PointsMode.last,
                              pointSize: 2.0,
                              pointColor: Colors.amber,
                            ),
                          );
                        }
                        return Text("...");
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
