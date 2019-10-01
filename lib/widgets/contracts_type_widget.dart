
import 'package:binary_mobile_app/model/serializable/responses/contracts_for_symbol_response.dart';
import 'package:binary_mobile_app/viewmodels/trade_screen_view_model.dart';
import 'package:binary_mobile_app/widgets/contracts_type_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContractsTypeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    var tradeViewModel = Provider.of<TradeScreenViewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          showDialog(context: context, builder: (context) => ContractsTypeDialog(viewModel: tradeViewModel,));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              border: Border.all(
                color: Colors.blueGrey,
                width: 1.0,
              )),
          child: Stack(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: StreamBuilder(
                    stream: tradeViewModel.contractsForSymbolResponse,
                    builder: (_, AsyncSnapshot<ContractsForSymbolResponse> contracts){
                      if (contracts.hasData && contracts.data.contractsFor.available.length > 0) {
                        return StreamBuilder(
                            stream: tradeViewModel.selectedAvailableContract,
                            builder: (context, AsyncSnapshot<Available> selectedContract) {
                              Available sA;
                              if (selectedContract.hasData){
                                sA = selectedContract.data;
                              } else {
                                sA = contracts.data.contractsFor.available[0];
                              }
                              tradeViewModel.selectedAvailableContract.add(sA);
                              return Text('${sA.contractCategoryDisplay} - ${sA.contractDisplay}');
                            }
                        );
                      } else {
                        return Text("Choose Contracts type");
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Align(alignment: Alignment.bottomRight,child: Icon(Icons.keyboard_arrow_down)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
