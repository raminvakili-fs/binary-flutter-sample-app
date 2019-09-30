import 'package:binary_mobile_app/model/serializable/requests/active_symbols_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/contracts_for_symbol_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/price_proposal_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/tick_stream_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/active_symbols_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/contracts_for_symbol_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/price_proposal_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/tick_stream_response.dart';
import 'package:binary_mobile_app/repository/api_repo/binary_api2.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class TradeScreenViewModel  extends ChangeNotifier{

  BinaryApi2 binaryApi2;

  BehaviorSubject<TickStreamResponse> _tickStream = BehaviorSubject<TickStreamResponse>();
  BehaviorSubject<TickStreamResponse> get tickStream => _tickStream;

  TradeScreenViewModel(){
    binaryApi2 = BinaryApi2.getInstance;
  }

  getTickStream({String ticks, int subscribe}){
    _setLoading(true);
    binaryApi2.sendRequest(TickStreamRequest(this.hashCode, ticks, subscribe), this.hashCode).listen((snapshot){
      if(snapshot != null)
        _tickStream.add(snapshot);
      _setLoading(false);
    });
  }


  BehaviorSubject<PriceProposalResponse> _priceProposalResponse;

  BehaviorSubject<PriceProposalResponse> get priceProposal => _priceProposalResponse;

  getPriceForContract(PriceProposalRequest priceProposalRequest){
    binaryApi2.sendRequest(priceProposalRequest, this.hashCode+1).listen((response){
      if (response != null) {
        _priceProposalResponse.add(response);
      }
    });
  }

  BehaviorSubject<ActiveSymbolsResponse> _activeSymbolsResponse = BehaviorSubject<ActiveSymbolsResponse>();
  BehaviorSubject<ActiveSymbolsResponse> get activeSymbols => _activeSymbolsResponse;

  getActiveSymbols(ActiveSymbolsRequest activeSymbolsRequest){
    activeSymbolsRequest.reqId = this.hashCode+2;
    binaryApi2.sendRequest(activeSymbolsRequest, this.hashCode+2).listen((response){
      if (response != null) {
        _activeSymbolsResponse.add(response);
      }
    });
  }

  BehaviorSubject<ContractsForSymbolResponse> _contractsForSymbolResponse = BehaviorSubject<ContractsForSymbolResponse>();
  BehaviorSubject<ContractsForSymbolResponse> get contractsForSymbolResponse => _contractsForSymbolResponse;

  getContractsForSymbol(ContractsForSymbolRequest contractsForSymbolRequest){
    contractsForSymbolRequest.reqId = this.hashCode+3;
    binaryApi2.sendRequest(contractsForSymbolRequest, this.hashCode+3).listen((response){
      if (response != null) {
        _contractsForSymbolResponse.add(response);
      }
    });
  }


  BehaviorSubject<ActiveSymbols> _selectedSymbol = BehaviorSubject<ActiveSymbols>();
  BehaviorSubject<ActiveSymbols> get selectedSymbol => _selectedSymbol;


  BehaviorSubject<String> _selectedContractCategory = BehaviorSubject<String>();
  BehaviorSubject<String> get selectedContractCategory => _selectedContractCategory;

  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  _setLoading(bool loading) {
    _isLoading = loading;
  }

  @override
  void dispose() {
    super.dispose();
    _tickStream.close();
    _selectedSymbol.close();
    _contractsForSymbolResponse.close();
    _selectedContractCategory.close();
  }

}