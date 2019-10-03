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
import 'package:binary_mobile_app/viewmodels/open_contract_view_model.dart';
import 'package:binary_mobile_app/viewmodels/price_proposal_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';

class TradeViewModel  extends BaseViewModel{

  final SymbolsViewModel symbolsViewModel;
  final ContractsTypeViewModel contractsTypeViewModel;
  final PriceProposalViewModel priceProposalViewModel;
  final OpenContractViewModel openContractViewModel;

  TradeViewModel({this.symbolsViewModel, this.contractsTypeViewModel, this.priceProposalViewModel, this.openContractViewModel}){
    binaryApi2.sendRequest(AuthorizeRequest(1, authorize: API_TOKEN));

    symbolsViewModel.contractsForSymbolResponse.listen((response){
      contractsTypeViewModel.contractsForSymbolResponse.add(response);
    });

    priceProposalViewModel.buyContractResponse.listen((BuyContractResponse response) {
      binaryApi2.sendRequest(ProposalOpenContractRequest(reqID: this.hashCode + 6, contractId: response.buy.contractId, subscribe: 1))
          .listen((response) => openContractViewModel.proposalOpenContractResponse.add(response));
    });

    symbolsViewModel.selectedSymbol.listen((ActiveSymbols activeSymbol){
      contractsTypeViewModel.getContractsForSymbol(ContractsForSymbolRequest(reqId: 1, contractsFor: activeSymbol.symbol, currency: 'USD', productType: 'basic'));
    });

  }

  void forgetProposalStream() {
    binaryApi2.sendRequest(ForgetAllRequest(reqID: 1, forgetAll: ['proposal', 'proposal_open_contract', 'ticks']), getResponseStream: false);
  }

}