import 'package:binary_mobile_app/api_info.dart';
import 'package:binary_mobile_app/model/serializable/categories/contract_category.dart';
import 'package:binary_mobile_app/model/serializable/requests/authorize_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/contracts_for_symbol_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/forget_all_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/proposal_open_contract_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/active_symbols_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/buy_contract_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/proposal_open_contract_response.dart';
import 'package:binary_mobile_app/blocs/symbols_bloc.dart';
import 'package:binary_mobile_app/blocs/base_bloc.dart';
import 'package:binary_mobile_app/blocs/contracts_type_bloc.dart';
import 'package:binary_mobile_app/blocs/open_contract_bloc.dart';
import 'package:binary_mobile_app/blocs/price_proposal_bloc.dart';

class TradeBloc  extends BaseBloc{

  SymbolsBloc symbolsViewModel;
  ContractsTypeBloc contractsTypeViewModel;
  PriceProposalBloc priceProposalViewModel;
  OpenContractBloc openContractViewModel;

  TradeBloc(){

    symbolsViewModel = SymbolsBloc();
    contractsTypeViewModel = ContractsTypeBloc();
    priceProposalViewModel = PriceProposalBloc();
    openContractViewModel = OpenContractBloc();

    binaryApi2.sendRequest(AuthorizeRequest(1, authorize: API_TOKEN));

    symbolsViewModel.contractsForSymbolResponse.listen((response){
      contractsTypeViewModel.contractsForSymbolResponse.add(response);
    });

    priceProposalViewModel.buyContractResponse.listen((BuyContractResponse response) {

      if (response.error == null ){

        openContractViewModel.isLoading.add(true);
        binaryApi2.sendRequest(ProposalOpenContractRequest(reqID: this.hashCode + 6, contractId: response.buy.contractId, subscribe: 1)).listen((response){
          openContractViewModel.proposalOpenContractResponse.add(response);
          openContractViewModel.isLoading.add(false);
        });

      } else {
        openContractViewModel.proposalOpenContractResponse.add(ProposalOpenContractResponse(error: response.error, msgType: 'proposal_open_contract', reqId: response.reqId, proposalOpenContract: null));
        openContractViewModel.isLoading.add(false);
      }

    });

    symbolsViewModel.selectedSymbol.listen((ActiveSymbols activeSymbol){
      contractsTypeViewModel.getContractsForSymbol(ContractsForSymbolRequest(reqId: 1, contractsFor: activeSymbol.symbol, currency: 'USD', productType: 'basic'));
    });


    //listens to Contract Item and whenever new ContractItem comes, sends price proposal request
    priceProposalViewModel.contractItem.listen((contractItem){
      forgetProposalStreams();
      priceProposalViewModel.getPriceForContractTop(contractItem.createRequest(Position.TOP));

      priceProposalViewModel.getPriceForContractBottom(contractItem.createRequest(Position.BOTTOM));
    });

  }

  void forgetProposalStreams() {
    priceProposalViewModel.isLoading.add(true);
    openContractViewModel.isLoading.add(true);
    binaryApi2.sendRequest(ForgetAllRequest(reqID: 1, forgetAll: ['proposal', 'proposal_open_contract']), getResponseStream: false);
  }

  void forgetTickStream() {
    binaryApi2.sendRequest(ForgetAllRequest(reqID: 1, forgetAll: ['ticks']), getResponseStream: false);
  }

}