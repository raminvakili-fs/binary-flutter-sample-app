import 'dart:async';
import 'dart:io';

import 'package:binary_mobile_app/app_constants.dart';
import 'package:binary_mobile_app/model/authentication/oauth.dart';
import 'package:binary_mobile_app/screens/statement_screen.dart';
import 'package:binary_mobile_app/viewmodels/trade_view_model.dart';
import 'package:binary_mobile_app/widgets/contracts_type_widget.dart';
import 'package:binary_mobile_app/widgets/open_contract_widget.dart';
import 'package:binary_mobile_app/widgets/price_proposal_widget.dart';
import 'package:binary_mobile_app/widgets/shared/binary_progress_indicator.dart';
import 'package:binary_mobile_app/widgets/shared/buy_button.dart';
import 'package:binary_mobile_app/widgets/shared/slid_in_widget.dart';
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

//            IconButton(
//              icon: Icon(Icons.assignment_ind),
//              onPressed: () async {
//
//                getToken("", "");
//
//
//              }
//            )
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
        SlidInWidget(
          startingVerticalOffset: -30.0,
          child: Container(
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
        ),
        Expanded(flex: 2, child: SlidInWidget(child: PriceProposalWidget())),
        Expanded(flex: 1, child: SlidInWidget(child: OpenContractWidget())),
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
