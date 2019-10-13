import 'package:binary_mobile_app/model/serializable/categories/contract_category.dart';
import 'package:binary_mobile_app/viewmodels/trade_view_model.dart';
import 'package:binary_mobile_app/widgets/contracts_type_dialog.dart';
import 'package:binary_mobile_app/widgets/shared/binary_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContractsTypeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tradeViewModel = Provider.of<TradeViewModel>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) => ContractsTypeDialog(
                      viewModel: tradeViewModel,
                    ));
          },
          child: Stack(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: StreamBuilder(
                      stream: tradeViewModel.contractsTypeViewModel.isLoading,
                      builder: (context, loadingSnapshot) {
                        if (!loadingSnapshot.hasData || loadingSnapshot.data) {
                          return BinaryProgressIndicator(elementsColor: Theme.of(context).accentColor, height: 15, width: 30,);
                        } else {
                          return StreamBuilder(
                            stream: tradeViewModel.contractsTypeViewModel.contractCategoryStream,
                            builder: (_, AsyncSnapshot<ContractCategory> contracts) {
                              if (contracts.hasData && contracts.data.categories.length > 0) {
                                return StreamBuilder(
                                    stream: tradeViewModel.contractsTypeViewModel.selectedContractType,
                                    builder: (context, AsyncSnapshot<ContractTypeItem> selectedContract) {
                                      ContractTypeItem cT;
                                      if (selectedContract.hasData) {
                                        cT = selectedContract.data;
                                        return Column(
                                          children: <Widget>[
                                            Text('${cT.displayName}', style: TextStyle(fontSize: 12), textAlign: TextAlign.center,),
                                            Text('${cT.displayName} - ${cT.categoryName}', style: TextStyle(fontSize: 12), textAlign: TextAlign.center,),
                                          ],
                                        );
                                      }
                                      return Container();
                                    });
                              } else {
                                return Text(
                                  "Choose Contracts type",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                );
                              }
                            },
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(Icons.keyboard_arrow_down)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
