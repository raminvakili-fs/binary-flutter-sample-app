import 'package:binary_mobile_app/model/serializable/requests/buy_contract_request.dart';
import 'package:binary_mobile_app/model/serializable/requests/price_proposal_request.dart';
import 'package:binary_mobile_app/model/serializable/responses/buy_contract_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/contracts_for_symbol_response.dart';
import 'package:binary_mobile_app/model/serializable/responses/price_proposal_response.dart';
import 'package:binary_mobile_app/viewmodels/base_view_model.dart';
import 'package:rxdart/rxdart.dart';

class PriceProposalViewModel extends BaseViewModel {

  BehaviorSubject<BuyContractResponse> buyContractResponse = BehaviorSubject<BuyContractResponse>();

  BehaviorSubject<PriceProposalResponse> _priceProposalResponse = BehaviorSubject<PriceProposalResponse>();
  BehaviorSubject<PriceProposalResponse> get priceProposal => _priceProposalResponse;

  buyContract(BuyContractRequest buyContractRequest){
    buyContractRequest.reqId = this.hashCode+4;
    binaryApi2.sendRequest(buyContractRequest).listen((response){
      buyContractResponse.add(response);
    });
  }


  getPriceForContract(PriceProposalRequest priceProposalRequest){
    priceProposalRequest.reqId = this.hashCode+1;
    binaryApi2.sendRequest(priceProposalRequest).listen((response){
      if (response != null) {
        _priceProposalResponse.add(response);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}