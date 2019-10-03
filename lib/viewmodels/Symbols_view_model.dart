import 'package:binary_mobile_app/model/serializable/requests/active_symbols_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/contracts_for_symbol_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/tick_stream_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/active_symbols_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/contracts_for_symbol_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/tick_stream_response.dart';
import 'package:binary_mobile_app/viewmodels/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

class SymbolsViewModel extends BaseViewModel {

  BehaviorSubject<TickStreamResponse> _tickStream = BehaviorSubject<TickStreamResponse>();
  BehaviorSubject<TickStreamResponse> get tickStream => _tickStream;

  BehaviorSubject<ActiveSymbols> _selectedSymbol = BehaviorSubject<ActiveSymbols>();
  BehaviorSubject<ActiveSymbols> get selectedSymbol => _selectedSymbol;


  SymbolsViewModel(){
    selectedSymbol.listen((ActiveSymbols activeSymbol){
      _tickStream.add(null);
      binaryApi2.sendRequest(TickStreamRequest(this.hashCode + 7, activeSymbol.symbol, 1))
          .listen((response) => tickStream.add(response));
    });

    getActiveSymbols(ActiveSymbolsRequest(
      reqId: this.hashCode,
      activeSymbols: 'brief',
      productType: 'basic',
    ));
  }

  BehaviorSubject<ActiveSymbolsResponse> _activeSymbolsResponse = BehaviorSubject<ActiveSymbolsResponse>();
  BehaviorSubject<ActiveSymbolsResponse> get activeSymbols => _activeSymbolsResponse;

  getActiveSymbols(ActiveSymbolsRequest activeSymbolsRequest){
    activeSymbolsRequest.reqId = this.hashCode+2;
    binaryApi2.sendRequest(activeSymbolsRequest).listen((response){
      if (response != null) {
        _activeSymbolsResponse.add(response);

        var activeSymbols = response as ActiveSymbolsResponse;

        if (activeSymbols.error == null && activeSymbols.activeSymbols.length > 0) {
          var firstSymbol = activeSymbols.activeSymbols[0];
          selectedSymbol.add(firstSymbol);
        }

      }
    });
  }

  BehaviorSubject<ContractsForSymbolResponse> _contractsForSymbolResponse = BehaviorSubject<ContractsForSymbolResponse>();
  BehaviorSubject<ContractsForSymbolResponse> get contractsForSymbolResponse => _contractsForSymbolResponse;


  @override
  void dispose() {
    super.dispose();
    _tickStream.close();
    _selectedSymbol.close();
  }

}