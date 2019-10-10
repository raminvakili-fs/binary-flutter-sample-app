import 'package:binary_mobile_app/model/serializable/responses/balance_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/statement_response.dart';
import 'package:binary_mobile_app/util.dart';
import 'package:binary_mobile_app/viewmodels/statement_screen_view_model.dart';
import 'package:binary_mobile_app/widgets/shared/binary_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: StatementScreenViewModel())
      ],
      child: Consumer(
        builder: (context, StatementScreenViewModel model, child){
          return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text('Statement', style: TextStyle(fontSize: 12),),
                  StreamBuilder(
                      stream: model.balanceResponse,
                      builder: (context, AsyncSnapshot<BalanceResponse> snapshot) {
                        if (snapshot.hasData){
                          if (snapshot.data.error == null) {
                            return Text(
                                'balance: \$${snapshot.data.balance.balance}',
                                style: TextStyle(fontSize: 12));
                          } else {
                            return Text(
                                '${snapshot.data.error.message}',
                                style: TextStyle(fontSize: 12));
                          }
                        }
                        return Container(width: 10, height: 10, child: CircularProgressIndicator(),);
                      }
                  )
                ],
              ),
              elevation: 0,
            ),
            body: StreamBuilder(
              stream: model.statementResponse,
              builder: (context, AsyncSnapshot<StatementResponse> snapshot) {
                if (snapshot.hasData && snapshot.data.error == null) {
                  StatementResponse response = snapshot.data;

                  if (response.statement.transactions.length > 0) {
                    return ListView.builder(
                      itemCount: response.statement.transactions.length,
                      itemBuilder: (context, index) {
                        Transactions transaction = response.statement.transactions[index];
                        return TransactionItem(
                          transaction: transaction,
                        );
                      },
                    );
                  }
                  return Center(child: Text('No Transaction'));
                }
                return Center(
                  child: BinaryProgressIndicator(elementsColor: Theme.of(context).accentColor, height: 20, width: 50,),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {

  final Transactions transaction;

  const TransactionItem({Key key, @required this.transaction}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool profit = transaction.amount <= 0 ? false : true;

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ListTile(
        onTap: (){},
        leading: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: profit ? Colors.greenAccent : Colors.pinkAccent,
              width: 1.0,
            ),
          ),
          child: Icon(
            profit ? Icons.add : Icons.remove,
            color: profit ? Colors.greenAccent : Colors.pinkAccent,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            profit ? Text('Profit: ${transaction.amount}') : Text('Loss: ${transaction.amount}'),
            Text('Date: ${timeStampToDate(transaction.transactionTime)}', style: TextStyle(fontSize: 9),),
          ],
        ),
        trailing: Text('Balance: ${transaction.balanceAfter}', style: TextStyle(fontSize: 9),),
      ),
    );
  }
}

