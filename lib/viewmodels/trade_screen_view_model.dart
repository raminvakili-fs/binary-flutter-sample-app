import 'package:binary_mobile_app/api_info.dart';
import 'package:binary_mobile_app/model/api/binary_api2.dart';
import 'package:binary_mobile_app/model/serializable/requests/active_symbols_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/authorize_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/buy_contract_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/contracts_for_symbol_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/forget_all_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/price_proposal_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/proposal_open_contract_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/tick_stream_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/active_symbols_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/buy_contract_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/contracts_for_symbol_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/price_proposal_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/proposal_open_contract_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/tick_stream_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class TradeScreenViewModel  extends ChangeNotifier{

  BinaryApi2 binaryApi2;

  BehaviorSubject<TickStreamResponse> _tickStream = BehaviorSubject<TickStreamResponse>();
  BehaviorSubject<TickStreamResponse> get tickStream => _tickStream;



  BehaviorSubject<BuyContractResponse> buyContractResponse = BehaviorSubject<BuyContractResponse>();

  TradeScreenViewModel(){
    binaryApi2 = BinaryApi2.getInstance;
    binaryApi2.sendRequest(AuthorizeRequest(1, authorize: API_TOKEN));

    buyContractResponse.listen((BuyContractResponse response) {
      binaryApi2.sendRequest(ProposalOpenContractRequest(reqID: this.hashCode + 6, contractId: response.buy.contractId, subscribe: 1))
          .listen((response) => proposalOpenContractResponse.add(response));
    });
  }

  buyContract(BuyContractRequest buyContractRequest){
    buyContractRequest.reqId = this.hashCode+4;
    binaryApi2.sendRequest(buyContractRequest).listen((response){
      buyContractResponse.add(response);
    });
  }

  getTickStream({String ticks, int subscribe}){
    _setLoading(true);
    binaryApi2.sendRequest(TickStreamRequest(this.hashCode, ticks, subscribe)).listen((snapshot){
      if(snapshot != null)
        _tickStream.add(snapshot);
      _setLoading(false);
    });
  }

  BehaviorSubject<PriceProposalResponse> _priceProposalResponse = BehaviorSubject<PriceProposalResponse>();
  BehaviorSubject<PriceProposalResponse> get priceProposal => _priceProposalResponse;

  getPriceForContract(PriceProposalRequest priceProposalRequest){
    priceProposalRequest.reqId = this.hashCode+1;
    binaryApi2.sendRequest(priceProposalRequest).listen((response){
      if (response != null) {
        _priceProposalResponse.add(response);
      }
    });
  }

  BehaviorSubject<ActiveSymbolsResponse> _activeSymbolsResponse = BehaviorSubject<ActiveSymbolsResponse>();
  BehaviorSubject<ActiveSymbolsResponse> get activeSymbols => _activeSymbolsResponse;

  getActiveSymbols(ActiveSymbolsRequest activeSymbolsRequest){
    activeSymbolsRequest.reqId = this.hashCode+2;
    binaryApi2.sendRequest(activeSymbolsRequest).listen((response){
      if (response != null) {
        _activeSymbolsResponse.add(response);
      }
    });
  }

  BehaviorSubject<ContractsForSymbolResponse> _contractsForSymbolResponse = BehaviorSubject<ContractsForSymbolResponse>();
  BehaviorSubject<ContractsForSymbolResponse> get contractsForSymbolResponse => _contractsForSymbolResponse;

  getContractsForSymbol(ContractsForSymbolRequest contractsForSymbolRequest){
    contractsForSymbolRequest.reqId = this.hashCode+3;
    binaryApi2.sendRequest(contractsForSymbolRequest).listen((response){
      if (response != null) {
        _contractsForSymbolResponse.add(response);
      }
    });
  }


  BehaviorSubject<ActiveSymbols> _selectedSymbol = BehaviorSubject<ActiveSymbols>();
  BehaviorSubject<ActiveSymbols> get selectedSymbol => _selectedSymbol;


  BehaviorSubject<Available> _selectedAvailableContract = BehaviorSubject<Available>();
  BehaviorSubject<Available> get selectedAvailableContract => _selectedAvailableContract;

  BehaviorSubject<ProposalOpenContractResponse> _proposalOpenContractResponse = BehaviorSubject<ProposalOpenContractResponse>();
  BehaviorSubject<ProposalOpenContractResponse> get proposalOpenContractResponse => _proposalOpenContractResponse;

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
    _selectedAvailableContract.close();
    _proposalOpenContractResponse.close();
    print("Trade view model streams disposed");
  }

  void forgetProposalStream() {
    binaryApi2.sendRequest(ForgetAllRequest(reqID: 1, forgetAll: ['proposal', 'proposal_open_contract']), getResponseStream: false);
  }

}