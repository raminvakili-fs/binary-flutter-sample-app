import 'package:binary_mobile_app/model/serializable/responses/contracts_for_symbol_response.dart';
import 'package:binary_mobile_app/viewmodels/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

class ContractsTypeViewModel extends BaseViewModel {
  BehaviorSubject<ContractsForSymbolResponse> _contractsForSymbolResponse = BehaviorSubject<ContractsForSymbolResponse>();
  BehaviorSubject<ContractsForSymbolResponse> get contractsForSymbolResponse => _contractsForSymbolResponse;

  BehaviorSubject<Available> _selectedAvailableContract = BehaviorSubject<Available>();
  BehaviorSubject<Available> get selectedAvailableContract => _selectedAvailableContract;

  @override
  void dispose() {
    _contractsForSymbolResponse.close();
    _selectedAvailableContract.close();
    super.dispose();
  }

}