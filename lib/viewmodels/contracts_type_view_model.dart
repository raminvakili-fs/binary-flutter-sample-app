import 'package:binary_mobile_app/model/contract_category.dart';
import 'package:binary_mobile_app/model/serializable/requests/contracts_for_symbol_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/contracts_for_symbol_response.dart';
import 'package:binary_mobile_app/viewmodels/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

class ContractsTypeViewModel extends BaseViewModel {


  final _contractsForSymbolResponse = BehaviorSubject<ContractsForSymbolResponse>();
  BehaviorSubject<ContractsForSymbolResponse> get contractsForSymbolResponse => _contractsForSymbolResponse;

  final _selectedContractType = BehaviorSubject<ContractTypeItem>();
  BehaviorSubject<ContractTypeItem> get selectedContractType => _selectedContractType;

  final _contractCategoryStream = BehaviorSubject<ContractCategory>();
  BehaviorSubject<ContractCategory> get contractCategoryStream => _contractCategoryStream;

  getContractsForSymbol(ContractsForSymbolRequest contractsForSymbolRequest){
    contractsForSymbolRequest.reqId = this.hashCode+3;
    print("Getting contract for ${contractsForSymbolRequest.contractsFor}");
    isLoading.add(true);
    binaryApi2.sendRequest(contractsForSymbolRequest).listen((response){
      if (response != null) {
        _contractsForSymbolResponse.add(response);
      }
      isLoading.add(false);
    });

    _contractsForSymbolResponse.listen((response) {
      var contractCategory = ContractCategory(contractsForSymbolResponse: response);
      _contractCategoryStream.add(contractCategory);
      _selectedContractType.add(contractCategory.categories[0].contractTypeItems[0]);
      print("done");
    });


  }

  @override
  void dispose() {
    _contractsForSymbolResponse.close();
    _selectedContractType.close();
    _contractCategoryStream.close();
    super.dispose();
  }

}