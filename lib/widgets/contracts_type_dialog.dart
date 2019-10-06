import 'package:binary_mobile_app/model/contract_category.dart';
import 'package:binary_mobile_app/model/serializable/responses/contracts_for_symbol_response.dart';
import 'package:binary_mobile_app/viewmodels/trade_view_model.dart';
import 'package:binary_mobile_app/widgets/funky_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContractsTypeDialog extends StatelessWidget {
  final TradeViewModel viewModel;

  const ContractsTypeDialog({Key key, this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FunkyOverlay(
      child: StreamBuilder(
        stream: viewModel.contractsTypeViewModel.contractCategoryStream,
        builder:
            (BuildContext context, AsyncSnapshot<ContractCategory> response) {
          if (response != null && response.hasData) {
            ContractCategory contractCategory = response.data;

            return Material(
              child: ListView.builder(
                itemCount: contractCategory.categories.length,
                itemBuilder: (BuildContext context, int index) {
                  Category category = contractCategory.categories[index];

                  return ExpansionTile(
                    title: Text("${category.categoryDisplayName}"),
                    children: category.contractTypeItems.map((ContractTypeItem type) => ListTile(
                      onTap: () => print(type.categoryName),
                      title: Text('${type.displayName} ${type.categoryName}', style: TextStyle(fontSize: 9),),)).toList(),
                  );

//                  return ListTile(
//                    title: Column(
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text("${category.categoryDisplayName}"),
//                        Text(
//                            "${category.contractTypes[0].displayName} - ${category.contractTypes[1].displayName}"),
//                      ],
//                    ),
//                    onTap: () {
////                      viewModel.contractsTypeViewModel.selectedAvailableContract.add(availableContract);
//                      Navigator.of(context).pop();
//                    },
//                  );
                },
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
