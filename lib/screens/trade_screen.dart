
import 'package:binary_mobile_app/model/authentication/token_info.dart';
import 'package:binary_mobile_app/model/serializable/responses/authorize_response.dart';
import 'package:binary_mobile_app/screens/statement_screen.dart';
import 'package:binary_mobile_app/viewmodels/app_view_model.dart';
import 'package:binary_mobile_app/viewmodels/trade_view_model.dart';
import 'package:binary_mobile_app/widgets/contracts_type_widget.dart';
import 'package:binary_mobile_app/widgets/open_contract_widget.dart';
import 'package:binary_mobile_app/widgets/price_proposal_widget.dart';
import 'package:binary_mobile_app/widgets/shared/slid_in_widget.dart';
import 'package:binary_mobile_app/widgets/symbols_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TradeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    final appViewModel = Provider.of<AppViewModel>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => TradeViewModel()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('App Trader'),
              SizedBox(height: 8,),
              StreamBuilder(

                stream: appViewModel.authorizeResponse,

                builder: (_, AsyncSnapshot<AuthorizeResponse> snapshot){


                  if (snapshot.hasData){
                    var msg = '';
                    if (snapshot.data.error == null) {
                      msg = 'Login ID: ${snapshot.data.authorize.loginid}';
                    } else {
                      msg = snapshot.data.error.message;
                    }
                    return Text(msg, style: TextStyle(fontSize: 11),);
                  }
                  return Container();
                },
              )

            ],
          ),
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

                appViewModel.authenticateWithOauth();

              }
            ),

            StreamBuilder(
              stream: appViewModel.oauthResponse,
              builder: (_, AsyncSnapshot<OAuthResponse> oauthResponseSnapshot){
                if(oauthResponseSnapshot.hasData){

                  return PopupMenuButton<TokenInfo>(
                    onSelected: (TokenInfo result) {
                      appViewModel.switchAccount(result);
                    },
                    itemBuilder: (BuildContext context){
                      return oauthResponseSnapshot.data.accounts.map((tokenInfo) =>
                          PopupMenuItem<TokenInfo>(value: tokenInfo, child: Text('${tokenInfo.id}'),)).toList();
                    }
                  );

                }
                return Container();
              },
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
