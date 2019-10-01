import 'package:binary_mobile_app/screens/statement_screen.dart';
import 'package:binary_mobile_app/viewmodels/trade_screen_view_model.dart';
import 'package:binary_mobile_app/widgets/contracts_type_widget.dart';
import 'package:binary_mobile_app/widgets/open_contract_widget.dart';
import 'package:binary_mobile_app/widgets/price_proposal_widget.dart';
import 'package:binary_mobile_app/widgets/symbols_widget.dart';
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
        appBar: AppBar(
          title: Text('App Trader'),
          elevation: 0,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.account_balance), onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return StatementScreen();
              }));
            },)
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

    return Column(
      children: <Widget>[
        Container(
          height: 150,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(child: SymbolsWidget()),
              Expanded(child: ContractsTypeWidget()),
            ],
          ),
        ),
        Expanded(flex: 1, child: PriceProposalWidget()),
        OpenContractWidget()
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    print('trade screen disposed');
    Provider.of<TradeScreenViewModel>(_context)?.dispose();
  }
}
