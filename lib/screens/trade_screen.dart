

import 'package:binary_mobile_app/viewmodels/trade_screen_view_model.dart';
import 'package:binary_mobile_app/views/contracts_type_widget.dart';
import 'package:binary_mobile_app/views/price_proposal_widget.dart';
import 'package:binary_mobile_app/views/symbols_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TradeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => TradeScreenViewModel()),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text('Trade Screen'),),
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

    return ListView(
      children: <Widget>[
        Row(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           Expanded(child: SymbolsWidget()),
           Expanded(child: ContractsTypeWidget()),
         ],
        ),

        PriceProposalWidget(),

        FlatButton(
          color: Colors.green,
          highlightColor: Colors.blueGrey,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          onPressed: () => {},
          child: Text('Purchase', style: TextStyle(color: Colors.white),),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    Provider.of<TradeScreenViewModel>(_context)?.dispose();
  }
}

