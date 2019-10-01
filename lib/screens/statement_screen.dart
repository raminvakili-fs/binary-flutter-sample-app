import 'package:binary_mobile_app/model/serializable/responses/statement_response.dart';
import 'package:binary_mobile_app/util.dart';
import 'package:binary_mobile_app/viewmodels/statement_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: StatementScreenViewModel())
      ],
      child: Scaffold(
        appBar: AppBar(title: Text('Account Statement'), elevation: 0,),
        body: Consumer(
          builder: (context, StatementScreenViewModel model, child) {
            return StreamBuilder(
              stream: model.statementResponse,
              builder: (context, AsyncSnapshot<StatementResponse> snapshot) {
                if (snapshot.hasData) {
                  StatementResponse response = snapshot.data;

                  if (response.statement.transactions.length > 0) {
                    return ListView.builder(
                      itemCount: response.statement.transactions.length,
                      itemBuilder: (context, index) {
                        Transactions transaction = response.statement.transactions[index];
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(
                            leading: Icon(transaction.amount <= 0 ? Icons.remove : Icons.add , color: transaction.amount <= 0 ? Colors.pinkAccent : Colors.greenAccent,),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Text('profit: ${transaction.amount}'),
                                Text('time: ${timeStampToDate(transaction.transactionTime)}', style: TextStyle(fontSize: 9),),
                              ],
                            ),
                          ),
                        );
                    },);
                  }
                  return Center(child: Text('No Transaction'));
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
