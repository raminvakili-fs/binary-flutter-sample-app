import 'package:binary_mobile_app/model/contract_category.dart';
import 'package:binary_mobile_app/viewmodels/trade_view_model.dart';
import 'package:binary_mobile_app/widgets/contracts_type_dialog.dart';
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
                  child: StreamBuilder(
                    stream: tradeViewModel.contractsTypeViewModel.isLoading,
                    builder: (context, loadingSnapshot) {
                      if (!loadingSnapshot.hasData || loadingSnapshot.data) {
                        return Container(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator());
                      } else {
                        return StreamBuilder(
                          stream: tradeViewModel.contractsTypeViewModel.contractCategoryStream,
                          builder: (_, AsyncSnapshot<ContractCategory> contracts) {
                            if (contracts.hasData && contracts.data.categories.length > 0) {
                              return StreamBuilder(
                                  stream: tradeViewModel.contractsTypeViewModel.selectedAvailableContract,
                                  builder: (context, AsyncSnapshot<ContractTypeItem> selectedContract) {
                                    ContractTypeItem cT;
                                    if (selectedContract.hasData) {
                                      cT = selectedContract.data;
                                    } else {
                                      cT = contracts.data.categories[0].contractTypeItems[0];
                                    }
                                    //tradeViewModel.contractsTypeViewModel.selectedAvailableContract.add(cT);
                                    return Text('${cT.displayName} - ${cT.categoryName}');
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
