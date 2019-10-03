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
import 'package:binary_mobile_app/viewmodels/Symbols_view_model.dart';
import 'package:binary_mobile_app/viewmodels/base_view_model.dart';
import 'package:binary_mobile_app/viewmodels/contracts_type_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class TradeScreenViewModel  extends BaseViewModel{

  final SymbolsViewModel symbolsViewModel;
  final ContractsTypeViewModel contractsTypeViewModel;

  BehaviorSubject<BuyContractResponse> buyContractResponse = BehaviorSubject<BuyContractResponse>();

  TradeScreenViewModel({this.symbolsViewModel, this.contractsTypeViewModel}){
    binaryApi2.sendRequest(AuthorizeRequest(1, authorize: API_TOKEN));

    symbolsViewModel.contractsForSymbolResponse.listen((response){
      contractsTypeViewModel.contractsForSymbolResponse.add(response);
    });

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

  BehaviorSubject<Available> _selectedAvailableContract = BehaviorSubject<Available>();
  BehaviorSubject<Available> get selectedAvailableContract => _selectedAvailableContract;

  BehaviorSubject<ProposalOpenContractResponse> _proposalOpenContractResponse = BehaviorSubject<ProposalOpenContractResponse>();
  BehaviorSubject<ProposalOpenContractResponse> get proposalOpenContractResponse => _proposalOpenContractResponse;


  @override
  void dispose() {
    super.dispose();
    _selectedAvailableContract.close();
    _proposalOpenContractResponse.close();
    print("Trade view model streams disposed");
  }

  void forgetProposalStream() {
    binaryApi2.sendRequest(ForgetAllRequest(reqID: 1, forgetAll: ['proposal', 'proposal_open_contract', 'ticks']), getResponseStream: false);
  }

}