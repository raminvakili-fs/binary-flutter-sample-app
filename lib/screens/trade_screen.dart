import 'dart:async';
import 'dart:io';

import 'package:binary_mobile_app/app_constants.dart';
import 'package:binary_mobile_app/screens/statement_screen.dart';
import 'package:binary_mobile_app/viewmodels/trade_view_model.dart';
import 'package:binary_mobile_app/widgets/contracts_type_widget.dart';
import 'package:binary_mobile_app/widgets/open_contract_widget.dart';
import 'package:binary_mobile_app/widgets/price_proposal_widget.dart';
import 'package:binary_mobile_app/widgets/shared/binary_progress_indicator.dart';
import 'package:binary_mobile_app/widgets/symbols_widget.dart';
import 'package:flutter/material.dart';
import 'package:http_server/http_server.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TradeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => TradeViewModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('App Trader'),
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.account_balance),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return StatementScreen();
                }));
              },
            ),

            IconButton(
              icon: Icon(Icons.assignment_ind),
              onPressed: () async {

                runZoned((){

                  HttpServer.bind('0.0.0.0', 80).then((server){

                    print('*************************** Server running at: ${server.address.address}');

                    server.transform(HttpBodyHandler()).listen((HttpRequestBody body) async {

                      print('**************************************** ${body.request.uri}');


                    });

                    server.listen((HttpRequest request) {
                      print('*************************** ${request.first}');
                    });

                  });
                });

                var url = 'https://oauth.binary.com/oauth2/authorize?app_id=$APP_ID';


                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }


              }
            )
          ],
        ),
        body: TradeView(),
      ),
    );
  }

}


class TradeView extends StatefulWidget {
  @override
  _TradeViewState createState() => _TradeViewState();
}

class _TradeViewState extends State<TradeView> {
  bool expanded = false;
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;

    print('************** rebuilt **************');

    return Column(
      children: <Widget>[
        Container(
          height: 120,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(child: SymbolsWidget()),
              Expanded(child: ContractsTypeWidget()),
            ],
          ),
        ),
        Expanded(flex: 2, child: PriceProposalWidget()),
        Expanded(flex: 1, child: OpenContractWidget()),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('trade screen disposed');
    Provider.of<TradeViewModel>(_context)?.dispose();
  }
}
