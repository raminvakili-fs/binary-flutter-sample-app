import 'package:binary_mobile_app/model/serializable/categories/contract_category.dart';
import 'package:binary_mobile_app/model/serializable/responses/contracts_for_symbol_response.dart';
import 'package:binary_mobile_app/blocs/trade_bloc.dart';
import 'package:binary_mobile_app/widgets/shared/binary_progress_indicator.dart';
import 'package:binary_mobile_app/widgets/shared/funky_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContractsTypeDialog extends StatelessWidget {
  final TradeBloc viewModel;

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
                      onTap: () {
                        viewModel.contractsTypeViewModel.selectedContractType.add(type);
                        Navigator.of(context).pop();
                      },
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
            return Center(child: BinaryProgressIndicator(elementsColor: Theme.of(context).accentColor, height: 20, width: 50,));
          }
        },
      ),
    );
  }
}
