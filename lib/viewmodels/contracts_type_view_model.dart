import 'package:binary_mobile_app/model/serializable/requests/contracts_for_symbol_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/contracts_for_symbol_response.dart';
import 'package:binary_mobile_app/viewmodels/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

class ContractsTypeViewModel extends BaseViewModel {


  BehaviorSubject<ContractsForSymbolResponse> _contractsForSymbolResponse = BehaviorSubject<ContractsForSymbolResponse>();
  BehaviorSubject<ContractsForSymbolResponse> get contractsForSymbolResponse => _contractsForSymbolResponse;

  BehaviorSubject<Available> _selectedAvailableContract = BehaviorSubject<Available>();
  BehaviorSubject<Available> get selectedAvailableContract => _selectedAvailableContract;

  getContractsForSymbol(ContractsForSymbolRequest contractsForSymbolRequest){
    contractsForSymbolRequest.reqId = this.hashCode+3;
    isLoading.add(true);
    binaryApi2.sendRequest(contractsForSymbolRequest).listen((response){
      if (response != null) {
        _contractsForSymbolResponse.add(response);
      }
      isLoading.add(false);
    });
  }

  @override
  void dispose() {
    _contractsForSymbolResponse.close();
    _selectedAvailableContract.close();
    super.dispose();
  }

}